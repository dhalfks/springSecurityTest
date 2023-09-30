package com.ezen.myweb.service;

import com.ezen.myweb.security.MemberVO;

public interface MemberService {

	boolean updateLastLogin(String authEmail);

	int register(MemberVO mvo);

	int checkEmail(String email);

}
