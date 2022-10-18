package dao;

import java.text.ParseException;
import java.time.LocalDate;

public class StringToDateConverter {
	
	
	public LocalDate convert(String source) throws ParseException {
		LocalDate date = LocalDate.parse(source);
		return date;
	}
}
