package egovframework.com.cop.api.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DayVO {

	private static final int RESERVE_UNABLE = 0;
	private int year;
	private int month;
	private int day;
	private boolean holiday;
	private String name;
	private int solarLunar;
	private int reserve;
	private int peoples;
	private boolean period;
	  
	public DayVO(int year, int month, int day){
	    this.year = year;
	    this.month = month;
	    this.day = day;
	    this.reserve = 0;
	    this.peoples = 0;
	    this.period = false;
	}
	  
	public DayVO(int year, int month, int day, int solarLunar, String name, boolean holiday){
	    this.year = year;
	    this.month = month;
	    this.day = day;
	    this.holiday = holiday;
	    this.solarLunar = solarLunar;
	    this.name = name;
	    this.period = false;
	}
	
	
	public static Date getDateYmd(int year, int month, int day)
	{
	    Calendar cal = Calendar.getInstance();
	    cal.set(year, month - 1, day);
	    return cal.getTime();
	}
	
	public String getYmd()
	{
	    return DayComUtil.getStrYmd(this.year, this.month, this.day);
	}
	  
	public String getYmd(int year)
	{
	    return DayComUtil.getStrYmd(year, this.month, this.day);
	}
	  
	public Date getDateYmd()
	{
	    return this.getDateYmd(this.year, this.month, this.day);
	}
	  
	public int getPrevYear(int year)
	{
	    if (this.year == 0) {
	      return year;
	    }
	    return year - 1;
	}
	  
	public int getYear()
	{
	    return this.year;
	}
	  
	public void setYear(int year)
	{
	    this.year = year;
	}
	  
	public int getMonth()
	{
	    return this.month;
	}
	  
	public void setMonth(int month)
	{
	   this.month = month;
	}
	  
	public int getDay()
	{
	    return this.day;
	}
	  
	public void setDay(int day)
	{
	    this.day = day;
	}
	  
	  public boolean isHoliday()
	  {
	    return this.holiday;
	  }
	  
	  public void setHoliday(boolean holiday)
	  {
	    this.holiday = holiday;
	  }
	  
	  public String getName()
	  {
	    return this.name;
	  }
	  
	  public void setName(String name)
	  {
	    this.name = name;
	  }
	  
	  public int getSolarLunar()
	  {
	    return this.solarLunar;
	  }
	  
	  public void setSolarLunar(int solarLunar)
	  {
	    this.solarLunar = solarLunar;
	  }
	  
	  public int getReserve()
	  {
	    return this.reserve;
	  }
	  
	  public void setReserve(int reserve)
	  {
	    this.reserve = reserve;
	  }
	  
	  public int getPeoples()
	  {
	    return this.peoples;
	  }
	  
	  public void setPeoples(int peoples)
	  {
	    this.peoples = peoples;
	  }
	  
	  public boolean isPeriod()
	  {
	    return this.period;
	  }
	  
	  public void setPeriod(boolean period)
	  {
	    this.period = period;
	  }
}
