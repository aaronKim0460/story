package egovframework.com.cmm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class DateUtil {
	public static void main(String[] args) throws Exception {
		System.out.println(DateUtil.convertDateFormat("20101010232323", yyyyMMddHHmmss, "yyyy-MM-dd HH:mm:ss"));
		System.out.println(DateUtil.addDate("20101010232323", 10, Calendar.DATE));

	}

	/**
	 * 기본날짜 포멧
	 */
	public static String yyyyMMdd = "yyyyMMdd";
	public static String yyyyMMddHHmm = "yyyyMMddHHmm";
	public static String yyyyMMddHHmmss = "yyyyMMddHHmmss";
	public static Locale locale = java.util.Locale.KOREAN;

	private static Calendar getCalendar(String dt) {
		Calendar cal = Calendar.getInstance();

		int yyyy = Integer.parseInt(dt.substring(0, 4));
		int MM = Integer.parseInt(dt.substring(4, 6)) - 1;
		int dd = Integer.parseInt(dt.substring(6, 8));

		int HH = 0;
		int mm = 0;
		int ss = 0;

		if (dt.length() == 8) {
			cal.set(yyyy, MM, dd);
		} else if (dt.length() == 12) {
			HH = Integer.parseInt(dt.substring(8, 10));
			mm = Integer.parseInt(dt.substring(10, 12));
			cal.set(yyyy, MM, dd, HH, mm);
		} else if (dt.length() == 14) {
			HH = Integer.parseInt(dt.substring(8, 10));
			mm = Integer.parseInt(dt.substring(10, 12));
			ss = Integer.parseInt(dt.substring(12, 14));
			cal.set(yyyy, MM, dd, HH, mm, ss);
		}

		return cal;
	}

	/**
	 * 날짜 포멧 바꾸기
	 *
	 * <pre>
	 * String sampleDate = convertDateFormat(&quot;20081010&quot;, &quot;yyyyMMdd&quot;, &quot;yyyy-MM-dd&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param oriFormat
	 *            원본날짜포멧
	 * @param convFormat
	 *            변경날짜포멧
	 * @return
	 * @throws ParseException
	 * @throws Exception
	 */
	public static String convertDateFormat(String dt, String oriFormat, String convFormat) throws Exception {
		String rt = "";

		try {
			SimpleDateFormat ori = new SimpleDateFormat(oriFormat, locale);
			Date oriDt = ori.parse(dt);
			SimpleDateFormat conv = new SimpleDateFormat(convFormat, locale);

			rt = conv.format(oriDt);
		} catch (ParseException pe) {
			throw new Exception("날짜와 포멧이 맞지 않거나 지원되지 않는 포멧입니다.");
		}

		return rt;
	}

	/**
	 * 날짜 더하기 세가지 포멧만 허용(yyyyMMdd, yyyyMMddHHmm, yyyyMMddHHmmss)
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = addDate(&quot;20081010&quot;, 1);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param addNum
	 *            더한 날
	 * @param calConst
	 *            Calendar.DATE, Calendar.MONTH
	 * @return
	 * @throws Exception
	 */
	private static String addDate(String dt, int addNum, int calConst) throws Exception {
		String dateFormat = getDateFormat(dt);
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, locale);

		Calendar c = getCalendar(dt);
		c.add(calConst, addNum);

		return sdf.format(c.getTime());
	}

	/**
	 * 기본포멧 일 더하기 세가지 포멧만 허용(yyyyMMdd, yyyyMMddHHmm, yyyyMMddHHmmss)
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = addDate(&quot;20081010&quot;, 1);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param addNum
	 *            더한 날
	 * @return
	 */
	public static String addDate(String dt, int addNum) throws Exception {
		return addDate(dt, addNum, Calendar.DATE);
	}

	/**
	 * 기본포멧 주 더하기 세가지 포멧만 허용(yyyyMMdd, yyyyMMddHHmm, yyyyMMddHHmmss)
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = addWeek(&quot;20081010&quot;, 1);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param addNum
	 *            더한 주
	 * @return
	 */
	public static String addWeek(String dt, int addNum) throws Exception {
		return addDate(dt, addNum * 7, Calendar.DATE);
	}

	/**
	 * 기본포멧 월 더하기 세가지 포멧만 허용(yyyyMMdd, yyyyMMddHHmm, yyyyMMddHHmmss)
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = addMonth(&quot;20081010&quot;, 1);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param addNum
	 *            더한 월
	 * @return
	 */
	public static String addMonth(String dt, int addNum) throws Exception {
		return addDate(dt, addNum, Calendar.MONTH);
	}

	/**
	 * 기본포멧 월 더하기 후 포멧변경
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = addMonth(&quot;20081010&quot;, 1, &quot;yyyy-MM-dd&quot;);
	 * </pre>
	 *
	 * @param dt
	 * @param addNum
	 * @param dateFormat
	 * @return
	 * @throws Exception
	 */
	public static String addMonth(String dt, int addNum, String convFormat) throws Exception {
		return convertDateFormat(addMonth(dt, addNum), getDateFormat(dt), convFormat);
	}

	/**
	 * 날짜에 해당하는 포멧을 반환 날짜문자열 길이로 세가지중 한가지 타입선택 (yyyyMMdd, yyyyMMddHHmm,
	 * yyyyMMddHHmmss)
	 *
	 * @param dt
	 * @return
	 * @throws Exception
	 */
	private static String getDateFormat(String dt) throws Exception {
		int dtlen = dt.length();
		String dateFormat = "";
		if (dtlen == 8)
			dateFormat = yyyyMMdd;
		else if (dtlen == 12)
			dateFormat = yyyyMMddHHmm;
		else if (dtlen == 14)
			dateFormat = yyyyMMddHHmmss;
		else
			throw new Exception("허용된 날짜 포멧이 아닙니다. 가능한 포멧 : yyyyMMdd, yyyyMMddHHmm, yyyyMMddHHmmss");

		return dateFormat;
	}

	/**
	 * 기본포멧 년 더하기
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = addYear(&quot;20081010&quot;, 1);
	 * </pre>
	 *
	 * @param dt
	 * @param addNum
	 * @return
	 * @throws Exception
	 */
	public static String addYear(String dt, int addNum) throws Exception {
		return addDate(dt, addNum, Calendar.YEAR);
	}

	/**
	 * 기본포멧 년 더하기 후 포멧변경
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = addYear(&quot;20081010&quot;, 1, &quot;yyyy-MM-dd&quot;);
	 * </pre>
	 *
	 * @param dt
	 * @param addNum
	 * @param dateFormat
	 * @return
	 * @throws Exception
	 */
	public static String addYear(String dt, int addNum, String convFormat) throws Exception {
		return convertDateFormat(addYear(dt, addNum), getDateFormat(dt), convFormat);
	}

	/**
	 * 조건일 주의 시작일
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getFirstDayOfWeek(&quot;20081010&quot;);
	 * </pre>
	 *
	 * @param dt
	 * @return
	 * @throws Exception
	 */
	public static String getFirstDayOfWeek(String dt) throws Exception {
		String dateFormat = getDateFormat(dt);
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, locale);

		Calendar c = getCalendar(dt);
		c.add(Calendar.DATE, (c.get(Calendar.DAY_OF_WEEK) - 1) * -1);

		return sdf.format(c.getTime());
	}

	/**
	 * 조건일 주의 시작일 포멧변경
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getFirstDayOfWeek(&quot;20081010&quot;, &quot;yyyy-MM-dd&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param dateFormat
	 *            변경할 포멧
	 * @return
	 * @throws Exception
	 */
	public static String getFirstDayOfWeek(String dt, String dateFormat) throws Exception {
		return convertDateFormat(getFirstDayOfWeek(dt), getDateFormat(dt), dateFormat);
	}

	/**
	 * 조건일 주의 종료일
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getLastDayOfWeek(&quot;20081010&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @return
	 * @throws Exception
	 */
	public static String getLastDayOfWeek(String dt) throws Exception {
		String dateFormat = getDateFormat(dt);
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, locale);

		Calendar c = getCalendar(dt);
		c.add(Calendar.DATE, 7 - c.get(Calendar.DAY_OF_WEEK));

		return sdf.format(c.getTime());
	}

	/**
	 * 조건일 주의 종료일 포멧변경
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getLastDayOfWeek(&quot;20081010&quot;, &quot;yyyy-MM-dd&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param dateFormat
	 *            변환할 포멧
	 * @return
	 * @throws Exception
	 */
	public static String getLastDayOfWeek(String dt, String dateFormat) throws Exception {
		return convertDateFormat(getLastDayOfWeek(dt), getDateFormat(dt), dateFormat);
	}

	/**
	 * 조건일 월의 시작일
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getFirstDayOfMonth(&quot;20081010&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @return
	 * @throws Exception
	 */
	public static String getFirstDayOfMonth(String dt) throws Exception {
		String dateFormat = getDateFormat(dt);
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, locale);

		dt = dt.substring(0, 6) + "01" + dt.substring(8);
		Calendar c = getCalendar(dt);

		return sdf.format(c.getTime());
	}

	/**
	 * 조건일 월의 시작일 포멧변경
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getFirstDayOfMonth(&quot;20081010&quot;, &quot;yyyy-MM-dd&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param dateFormat
	 *            변경할 포멧
	 * @return
	 * @throws Exception
	 */
	public static String getFirstDayOfMonth(String dt, String dateFormat) throws Exception {
		return convertDateFormat(getFirstDayOfMonth(dt), getDateFormat(dt), dateFormat);
	}

	/**
	 * 조건일 월의 종료일
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getLastDayOfMonth(&quot;20081010&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @return
	 * @throws Exception
	 */
	public static String getLastDayOfMonth(String dt) throws Exception {
		String dateFormat = getDateFormat(dt);
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, locale);

		Calendar c = getCalendar(dt);
		c.set(Calendar.DATE, c.getActualMaximum(Calendar.DAY_OF_MONTH));

		return sdf.format(c.getTime());
	}

	/**
	 * 조건일 월의 종료일 포멧변경
	 *
	 * <pre>
	 * 예제)
	 * String sampleDate = getLastDayOfMonth(&quot;20081010&quot;, &quot;yyyy-MM-dd&quot;);
	 * </pre>
	 *
	 * @param dt
	 *            날짜
	 * @param dateFormat
	 *            변경할 포멧
	 * @return
	 * @throws Exception
	 */
	public static String getLastDayOfMonth(String dt, String dateFormat) throws Exception {
		return convertDateFormat(getLastDayOfMonth(dt), getDateFormat(dt), dateFormat);
	}

	/**
	 * 두날짜 사이의 기간 구하기
	 *
	 * @param sDate
	 *            시작일
	 * @param eDate
	 *            종료일
	 * @return
	 * @throws Exception
	 */
	public static int getDatePeriod(String sDate, String eDate) throws Exception {
		getDateFormat(sDate);
		getDateFormat(eDate);

		Calendar c = getCalendar(sDate);
		long sDt = c.getTimeInMillis();

		c = getCalendar(eDate);
		long eDt = c.getTimeInMillis();

		long Result = (eDt - sDt) / (1000 * 60 * 60 * 24) + 1;

		return Integer.parseInt(Result + "");
	}

	/**
	 * 오늘날짜
	 *
	 * @param dateFormat
	 *            포멧
	 * @return
	 */
	public static String getDate(String dateFormat) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat, locale);
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		return sdf.format(c.getTime());
	}

	/**
	 * 오늘날짜 : yyyyMMdd
	 *
	 * @return
	 */
	public static String getDate() {
		/** 2016.01.19 public static String getDate(String dateFormat)  요청으로 이상없음 **/
		return getDate(yyyyMMdd);
	}

	/**
	 * 오늘날짜시간 : yyyyMMddHHmmss
	 *
	 * @return
	 */
	public static String getDateTime() {
		return getDate("yyyyMMddHHmmss");
	}

	/**
	 * 지정한 날짜의 해당월의 주차 구하기
	 *
	 * <pre>
	 * 예제)
	 * int jucha = getWeek(&quot;20081010&quot;);
	 * </pre>
	 *
	 * @param dt
	 * @return
	 * @throws Exception
	 */
	public static int getWeek(String dt) throws Exception {
		getDateFormat(dt);
		Calendar c = getCalendar(dt);
		return c.get(Calendar.WEEK_OF_MONTH);
	}

	/**
	 * 요일(일:1~토:7) 구하기
	 *
	 * @param dt
	 *            날짜
	 * @return
	 * @throws Exception
	 */
	public static int getWeekDay(String dt) throws Exception {
		getDateFormat(dt);
		Calendar c = getCalendar(dt);
		return c.get(Calendar.DAY_OF_WEEK);
	}

	/**
	 * 하루의 시간
	 */
	private static final long ONE_DATE_TIME = 24 * 60 * 60 * 1000;

	/**
	 * 현재 시간을 yyyyMMddhhmmssSSS(년월일시분초밀리초) 형태로 출력 <br/>
	 * 
	 * <pre></pre>
	 * 
	 * @return
	 */
	public static String getCurrentMiliTime() {
		String currentTime = null;
		try {
			Date date = Calendar.getInstance().getTime();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmssSSS");
			currentTime = formatter.format(date);
		} catch (Exception e) {
			System.out.println("예외발생");
		}
		return currentTime;
	}

	/**
	 * 현재 시간을 yyyyMMddhhmmss(년월일시분초) 형태로 출력 <br/>
	 * 
	 * <pre></pre>
	 * 
	 * @return
	 */
	public static String getCurrentTime() {
		String currentTime = null;
		
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmss");
		currentTime = formatter.format(date);
		
		return currentTime;
	}

	/**
	 * 현재 일자를 yyyy-MM-dd(년월일) 형태로 출력 <br/>
	 * 
	 * <pre></pre>
	 * 
	 * @return
	 */
	public static String getCurrentDate() {
		String currentDate = null;
		
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		currentDate = formatter.format(date);
		
		return currentDate;
	}

	/**
	 * 현재일 기준으로 입력된 숫자만큼의 일자를 입력된 형식으로 반환한다. <br/>
	 * 
	 * <pre></pre>
	 * 
	 * @param format
	 * @param day
	 * @return
	 */
	public static String getFormatDate(String format, long day) {
		String formatDate = null;
		
		Date date = new Date(Calendar.getInstance().getTime().getTime() + ONE_DATE_TIME * day);
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		formatDate = formatter.format(date);
		
		return formatDate;
	}

	/**
	 * 현재일 기준으로 한달전 일자를 입력된 형식으로 반환한다. <br/>
	 * 
	 * <pre></pre>
	 * 
	 * @param format
	 * @return
	 */
	public static String getOneMonBeforeFormatDate(String format) {
		String formatDate = null;
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		formatDate = formatter.format(cal.getTime());
		
		return formatDate;
	}

	/**
	 * 현재일 기준으로 입력된 숫자에 해당하는 월일자를 입력된 형식으로 반환한다. <br/>
	 * 
	 * <pre></pre>
	 * 
	 * @param format
	 * @return
	 */
	public static String getMonFormatDate(String format, int month) {
		String formatDate = null;
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, +month);
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		formatDate = formatter.format(cal.getTime());
		
		return formatDate;
	}
}