package apptive.nochigima.service;

import apptive.nochigima.domain.AuthProvider;
import apptive.nochigima.domain.Role;
import apptive.nochigima.domain.User;
import apptive.nochigima.domain.repository.UserRepository;
import apptive.nochigima.dto.KakaoUserInfo;
import apptive.nochigima.dto.OAuthTokenResponse;
import apptive.nochigima.dto.TokenResponse;
import apptive.nochigima.jwt.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.reactive.function.client.WebClient;

import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AuthService {

    private final UserRepository userRepository;
    private final JwtTokenProvider jwtTokenProvider;
    private final WebClient webClient;

    // application.yml에서 값 가져오기
    @Value("${spring.security.oauth2.client.registration.kakao.client-id}")
    private String kakaoClientId;
    @Value("${spring.security.oauth2.client.registration.kakao.client-secret}")
    private String kakaoClientSecret;
    @Value("${spring.security.oauth2.client.registration.kakao.redirect-uri}")
    private String kakaoRedirectUri;

    @Value("${spring.security.oauth2.client.registration.google.client-id}")
    private String googleClientId;
    @Value("${spring.security.oauth2.client.registration.google.client-secret}")
    private String googleClientSecret;
    @Value("${spring.security.oauth2.client.registration.google.redirect-uri}")
    private String googleRedirectUri;

    @Value("${spring.security.oauth2.client.provider.kakao.token-uri}")
    private String kakaoTokenUri;
    @Value("${spring.security.oauth2.client.provider.kakao.user-info-uri}")
    private String kakaoUserInfoUri;


    @Transactional
    public TokenResponse kakaoLogin(String code) {
        // 1. 코드로 카카오 서버에서 Access Token 받기
        OAuthTokenResponse tokenResponse = getKakaoAccessToken(code);

        // 2. Access Token으로 카카오 서버에서 사용자 정보 받기
        KakaoUserInfo kakaoUserInfo = getKakaoUserInfo(tokenResponse.getAccessToken());

        // 3. 사용자 정보로 DB에서 유저 찾기 또는 회원가입
        User user = findOrCreateUser(kakaoUserInfo.getKakaoAccount().getEmail(),
            kakaoUserInfo.getKakaoAccount().getProfile().getNickname(),
            AuthProvider.KAKAO);

        // 4. 우리 서비스의 JWT 생성
        String accessToken = jwtTokenProvider.createToken(user.getEmail(), user.getRoleKey());

        return new TokenResponse(accessToken);
    }

    private OAuthTokenResponse getKakaoAccessToken(String code) {
        MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
        formData.add("grant_type", "authorization_code");
        formData.add("client_id", kakaoClientId);
        formData.add("redirect_uri", kakaoRedirectUri);
        formData.add("code", code);
        formData.add("client_secret", kakaoClientSecret);

        return webClient.post()
            .uri(kakaoTokenUri)
            .contentType(MediaType.APPLICATION_FORM_URLENCODED)
            .bodyValue(formData)
            .retrieve()
            .bodyToMono(OAuthTokenResponse.class)
            .block();
    }

    private KakaoUserInfo getKakaoUserInfo(String accessToken) {
        return webClient.get()
            .uri(kakaoUserInfoUri)
            .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
            .retrieve()
            .bodyToMono(KakaoUserInfo.class)
            .block();
    }

    @Transactional
    public TokenResponse googleLogin(String code) {
        // 1. 코드로 구글 서버에서 Access Token 받기
        OAuthTokenResponse tokenResponse = getGoogleAccessToken(code);

        // 2. Access Token으로 구글 서버에서 사용자 정보 받기
        // (WebClient로 "https://www.googleapis.com/oauth2/v2/userinfo" 요청)
        Map<String, Object> googleUserInfo = getGoogleUserInfo(tokenResponse.getAccessToken());

        String email = (String) googleUserInfo.get("email");
        String nickname = (String) googleUserInfo.get("name");

        // 3. 사용자 정보로 DB에서 유저 찾기 또는 회원가입
        User user = findOrCreateUser(email, nickname, AuthProvider.GOOGLE);

        // 4. 우리 서비스의 JWT 생성
        String accessToken = jwtTokenProvider.createToken(user.getEmail(), user.getRoleKey());

        return new TokenResponse(accessToken);
    }

    private OAuthTokenResponse getGoogleAccessToken(String code) {
        MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
        formData.add("grant_type", "authorization_code");
        formData.add("client_id", googleClientId);
        formData.add("client_secret", googleClientSecret);
        formData.add("redirect_uri", googleRedirectUri);
        formData.add("code", code);

        return webClient.post()
            .uri("https://oauth2.googleapis.com/token")
            .contentType(MediaType.APPLICATION_FORM_URLENCODED)
            .bodyValue(formData)
            .retrieve()
            .bodyToMono(OAuthTokenResponse.class)
            .block();
    }

    private Map<String, Object> getGoogleUserInfo(String accessToken) {
        return webClient.get()
            .uri("https://www.googleapis.com/oauth2/v2/userinfo")
            .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
            .retrieve()
            .bodyToMono(Map.class) // Google은 반환 타입이 유연해서 Map으로 받음
            .block();
    }


    private User findOrCreateUser(String email, String nickname, AuthProvider provider) {
        Optional<User> userOptional = userRepository.findByEmail(email);

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            // 닉네임이 변경되었을 수 있으니 업데이트
            user.update(nickname);
            return userRepository.save(user);
        } else {
            User newUser = User.builder()
                .email(email)
                .nickname(nickname)
                .provider(provider)
                .role(Role.USER) // 기본 역할
                .build();
            return userRepository.save(newUser);
        }
    }
}
