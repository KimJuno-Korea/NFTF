package kr.co.nftf.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.nftf.user.User;

public class CommonValidator implements Validator{
	private static final String idRegExp = "/[^a-z|^0-9|^A-Z]/g";
	private static final String pwRegExp = "/[^a-z|^0-9|^A-Z|^!@#$%^&*()_]/g";
	private static final String phoneRegExp = "/[^0-9|-]/g";
	private static final String accountNoRegExp = "/[^0-9]/g";
	
	
	private Pattern idPattern;
	private Pattern pwPattern;
	
	public CommonValidator() {
		idPattern = Pattern.compile(idRegExp);
		pwPattern = Pattern.compile(pwRegExp);
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		User user = (User)target;
		
		String id = user.getId();
		String pw = user.getPw();
		String phone = user.getPhone();
		String accountNo = user.getAccountNo();
		
		if (id == null || id.trim().isEmpty()) {
			errors.rejectValue("id", "required.id", "아이디를 입력하세요.");
			
		} else {
			Matcher matcher = idPattern.matcher(id);
			
			if (!matcher.matches()) {
				errors.rejectValue("id", "typeMismatch.id", "올바르지 않은 아이디 형식입니다.");
			}
		}
	}
}
