package component;

import entity.UsersEntity;
import static org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers.regex;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Service
public class RegisterFormValidator implements Validator{
    @Override
	public boolean supports(Class<?> aClass) {
        // Chỉ ra rằng nó sẽ chỉ có hiệu lực đối với RegisterForm.
		return aClass.equals(UsersEntity.class);
	}

	@Override
	public void validate(Object o, Errors errors) {
		UsersEntity users = (UsersEntity) o;
        String regex = null;
		if (!users.getEmail().matches(regex)) {
            // Khai báo thêm lỗi vào đối tượng errors
			errors.rejectValue("email", "Key message báo lỗi email sai format. (Đọc thêm về i18n)");
		}
		// Tiếp tục validate các thuộc tính khác nhé
        // Kiểm tra format, độ lớn, độ dài các kiểu
        // Kiểm tra email nhập có trùng khớp hay không
	}
        
        
}
