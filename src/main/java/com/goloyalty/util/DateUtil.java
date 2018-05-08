package com.goloyalty.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	/**
     * To get current server date (format yyyy-MM-dd)
     */
    public static String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date uDate = new Date();
        
        return sdf.format(uDate);
    }
    
    /**
     * To get current server date (format dd/MM/yyyy)
     */
    public static String getCurrentJspDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date uDate = new Date();
        
        return sdf.format(uDate);
    }
    
    /**
     * To get current server date (format yyMM)
     */
    public static String getCurrentYearMonth() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyMM");
        Date uDate = new Date();
        
        return sdf.format(uDate);
    }
    
    /** 
     * To get current server date (format yyyy/MM/dd HH:mm:ss)
     */
    public final static String getCurrentDateTime() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date uDate = new Date();
        
        return dateFormat.format(uDate);
    }
    
    /** 
     * To get current server date (format yyyy/MM/dd HH:mm:ss)
     */
    public final static Timestamp getCurrentDateTimeStamp() {
    	Date date = new Date(System.currentTimeMillis());
    	Timestamp timestamp = new Timestamp(date.getTime());
        
        return timestamp;
    }
    
    /** 
     * To format date (format yyyy-MM-dd HH:mm)
     */
    public static String formatDate(Date date) {
        SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return (date == null) ? "" : dfs.format(date);
    }
    
    /** 
     * To format date (format dd/MM/yyyy)
     */
    public static String formatJspDate(Date date) {
    	if(date == null) {
    		return null;
    	} else {
    		SimpleDateFormat dfs = new SimpleDateFormat("dd/MM/yyyy");
    		String formatDate = dfs.format(date);
    		
    		return formatDate;
    	}
    }
    
    /** 
     * To format date (format dd/MM/yyyy)
     */
    public static Date formatDate(String date) {
        SimpleDateFormat dfs = new SimpleDateFormat("dd/MM/yyyy");
        try {
            return (date == null) ? null : dfs.parse(date);
        } catch (ParseException ex) {
            return null;
        }
    }
    
    /** 
     * To format date (format yyyy-MM-dd)
     */
    public static Date formatStringDate(String dateString) {
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return (dateString == null) ? null : formatter.parse(dateString);
        } catch (ParseException ex) {
            return null;
        }
    }
    
    /** 
     * To format date (format yyyy-MM-dd HH:mm)
     */
    public static Date formatDateTime(Date date) {
    	Date fDate = null;
    	
    	if(date == null) {
    		return null;
    	} else {
    		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    		String formatDate = dfs.format(date);
    		
    		try {
    			fDate = dfs.parse(formatDate);
    		} catch(Exception ex) {
    			return null;
    		}
    		
    		return fDate;
    	}
    }
}
