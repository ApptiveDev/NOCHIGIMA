package apptive.nochigima.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

// 앱으로 보낼 'JWT'를 담을 객체
@Getter
@AllArgsConstructor
public class TokenResponse {
    private String accessToken;
}
