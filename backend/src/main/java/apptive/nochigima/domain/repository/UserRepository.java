package apptive.nochigima.domain.repository;

import apptive.nochigima.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    // 이메일을 통해 이미 가입된 사용자인지 확인
    Optional<User> findByEmail(String email);
}
