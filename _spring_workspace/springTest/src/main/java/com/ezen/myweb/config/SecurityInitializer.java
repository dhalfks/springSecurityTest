package com.ezen.myweb.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SecurityInitializer extends AbstractSecurityWebApplicationInitializer {

	//AbstractSecurityWebApplicationInitializer를 상속받는 클래스를 작성해야 스프링 시큐리티 필터들이 활성화된다.

}
