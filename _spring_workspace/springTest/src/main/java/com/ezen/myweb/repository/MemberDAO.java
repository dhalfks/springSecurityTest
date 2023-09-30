package com.ezen.myweb.repository;

import java.util.List;

import com.ezen.myweb.security.AuthVO;
import com.ezen.myweb.security.MemberVO;

public interface MemberDAO {

	MemberVO selectEmail(String username);

	List<AuthVO> selectAuths(String username);

	int updateLastLogin(String authEmail);

	void insertMember(MemberVO mvo);

	int insertAuthInit(String email);

	int checkEmail(String email);


}
