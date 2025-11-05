package apptive.nochigima.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;

// 카카오 서버에서 사용자 정보를 받을 객체
@Getter
@NoArgsConstructor
public class KakaoUserInfo {
    private Long id;

    @JsonProperty("kakao_account")
    private KakaoAccount kakaoAccount;

    @Getter
    @NoArgsConstructor
    public static class KakaoAccount {
        private String email;
        private Profile profile;

        @Getter
        @NoArgsConstructor
        public static class Profile {
            private String nickname;
        }
    }

    // 우리 User 엔티티로 변환
    public apptive.nochigima.domain.User toUser() {
        return apptive.nochigima.domain.User.builder()
            .email(this.kakaoAccount.email)
            .nickname(this.kakaoAccount.profile.nickname)
            .provider(apptive.nochigima.domain.AuthProvider.KAKAO)
            .role(apptive.nochigima.domain.Role.USER)
            .build();
    }
}
