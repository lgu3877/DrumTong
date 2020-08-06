package com.drumtong.security;

import javax.servlet.http.HttpServletRequest;

public class GetIPAddress {
	public static String getIP(HttpServletRequest request) {
		String IP = request.getHeader("X-Forwarded-For");
		if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("Proxy-Client-IP"); }
		if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("WL-Proxy-Client-IP"); }
		if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("HTTP_CLIENT_IP"); }
		if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("HTTP_X_FORWARDED_FOR"); }
		if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getRemoteAddr(); }
		return IP;
	}
}
