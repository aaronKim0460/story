package egovframework.com.cop.api.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DayComUtil {

	public static String getStrYmd(int year, int month, int day)
	{
	    Calendar cal = Calendar.getInstance();
	    cal.set(year, month - 1, day);
	    return getDateToStr(cal.getTime(), "yyyy-MM-dd");
	}
	
	public static String getDateToStr(Date date, String strPattern)
	{
	    String strDate = "";
	    if (date != null) {
	      strDate = getDateFormat(strPattern).format(date);
	    }
	    return strDate;
	}
	
	private static DateFormat getDateFormat(String pattern)
	{
	    SimpleDateFormat formatter = new SimpleDateFormat(pattern);
	    return formatter;
	}
	
	public static Calendar getCalendarYmd(int year, int month, int day)
	{
	    Calendar cal = Calendar.getInstance();
	    cal.set(year, month - 1, day);
	    return cal;
	}
}
