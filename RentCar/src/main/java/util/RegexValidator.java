package util;

import java.util.regex.Pattern;

public class RegexValidator {
	
	public static String ID_PATTERN= "^[a-zA-Z]{1}[a-zA-Z0-9_-]{4,19}$";
	public static String PASS_PATTERN = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#])[\\da-zA-Z!@#]{8,}$"; 
	public static String EMAIL_PATTERN= "^[a-zA-Z]([-_.]?[0-9a-zA-Z]){2,15}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){1,9}.([a-zA-Z]{2,3})$";
	
	public static boolean registrationValidator(String email, String regexPattern) {
		return Pattern.compile(regexPattern)
				.matcher(email)
				.matches();
	}
}
