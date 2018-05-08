package com.goloyalty.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BaseUtil {
	private static String userCode = "03";
	private static String dealCode = "04";
	private static String merchantCode = "13";
	private static String rewardCode = "18";
	/**
     * To generate current date (format yyyyMMddHHmmss)
     */
	public static String generateCurrentDt() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date uDate = new Date();
        
        return sdf.format(uDate);
	}
	
	/**
     * To generate random number (format yyyyMMddHHmmssXX)
     */
	public static String generateUserRandomNumber() {
        return generateCurrentDt() + userCode;
	}
	
	/**
     * To generate random number (format yyyyMMddHHmmssXX)
     */
	public static String generateDealRandomNumber() {
		return generateCurrentDt() + dealCode;
	}
	
	/**
     * To generate random number (format yyyyMMddHHmmssXX)
     */
	public static String generateMerchantRandomNumber() {
		return generateCurrentDt() + merchantCode;
	}
	
	/**
     * To generate random number (format yyyyMMddHHmmssXX)
     */
	public static String generateRewardRandomNumber() {
		return generateCurrentDt() + rewardCode;
	}
}
