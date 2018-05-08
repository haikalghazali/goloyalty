package com.goloyalty.util;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.goloyalty.exception.InvalidFileException;

public class FileUtil {
	private static Logger logger = LogManager.getLogger(FileUtil.class);
	
	private static final String validExtensions = "jpg,jpeg,gif,png";
	
	public static String handleFileName(String fileName, String uploadDirectory, String deal_id) throws InvalidFileException {
		String cleanFileName = fileName.replaceAll("[^A-Za-z0-9.()]", "");		
	    String extension = getFileExtension(cleanFileName);
			
	    if(!isValidExtension(cleanFileName)) {
	    	throw new InvalidFileException("Invalid File Extension");
	    };
	    
//	    String base = cleanFileName.substring(0, cleanFileName.length() - extension.length() - 1);
	    String base = deal_id;
	    cleanFileName =  base + "." + extension;
	    
//	    int openParIndex = getOpenParenthesisIndex(base);
//	    if(openParIndex > 0) {
//	    	base = base.substring(0, openParIndex);
//	    	cleanFileName =  base + "." + extension;
//	    }
	    
//	    if(Files.exists(Paths.get(uploadDirectory, cleanFileName))) {
//	        cleanFileName =  base + "(1)." + extension;
//	    }
//	  		
//	    while(Files.exists(Paths.get(uploadDirectory, cleanFileName))) {
//	        String nString = cleanFileName.substring(base.length() + 1, cleanFileName.length()-extension.length()-2);
//	        int n = Integer.parseInt(nString) + 1;
//	        cleanFileName =  base + "(" + n + ")." + extension;
//	    }
	  		
	    return cleanFileName;
	}
	
	public static String getFileExtension(String fileName) {
	    int dotIndex = fileName.lastIndexOf(".");
	    if(dotIndex < 0) {
	    	return null;
	    }
	    
	    return fileName.substring(dotIndex + 1);
	}
	
	static boolean isValidExtension(String fileName) throws InvalidFileException {
		String fileExtension = getFileExtension(fileName);
		
		if (fileExtension == null) {
			throw new InvalidFileException("No File Extension");
		}
		
		fileExtension = fileExtension.toLowerCase();
		
		for (String validExtension : validExtensions.split(",")) {
			if (fileExtension.equals(validExtension)) {
				return true;
			}
		}
		
		return false;
	}
	
	private static int getOpenParenthesisIndex(String baseFileName) {
	    int openParIndex = baseFileName.lastIndexOf("(");
	    int closeParIndex = baseFileName.lastIndexOf(")");
	    boolean isParenthesis = openParIndex > 0 && closeParIndex == baseFileName.length()- 1;
			
	    if(isParenthesis && baseFileName.substring(openParIndex + 1, closeParIndex).matches("[1-9][0-9]*")) {
	    	return openParIndex;
	    } else {
	    	return -1;
	    }
	}
}
