package apptive.nochigima.dto;

import lombok.Getter;
import lombok.Setter;

// 앱에서 보낼 '인증 코드'를 담을 객체
@Getter
@Setter
public class LoginRequest {
    private String code;
}
