package apptive.nochigima.controller;

import apptive.nochigima.dto.LoginRequest;
import apptive.nochigima.dto.TokenResponse;
import apptive.nochigima.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/kakao")
    public ResponseEntity<TokenResponse> kakaoLogin(@RequestBody LoginRequest request) {
        TokenResponse token = authService.kakaoLogin(request.getCode());
        return ResponseEntity.ok(token);
    }

    @PostMapping("/google")
    public ResponseEntity<TokenResponse> googleLogin(@RequestBody LoginRequest request) {
        TokenResponse token = authService.googleLogin(request.getCode());
        return ResponseEntity.ok(token);
    }
}

