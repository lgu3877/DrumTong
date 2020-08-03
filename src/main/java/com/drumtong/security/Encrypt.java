package com.drumtong.security;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encrypt {
	// 비밀번호를 암호화하여 해쉬값 반환[영경]
	public static String SecurePassword(String id, String pw){
		MessageDigest mdHash;
		try {
			mdHash = MessageDigest.getInstance("SHA-512");
			// Base64 : 8비트 이진 데이터를 문자 코드에 영향을 받지 않는 공통 ASCII 영역의 문자들로만 이루어진 일련의 문자열로 바꾸는 인코딩 방식
			// update() : 지정된 바이트 데이터를 사용해 다이제스트를 갱신
			mdHash.update(Base64.getEncoder().encode(id.getBytes()));
			mdHash.update(Base64.getEncoder().encode(pw.getBytes()));
			// digest() : 바이트배열로 해쉬를 반환한다.
			return String.format("%064x", new BigInteger(1, mdHash.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}
	
}
