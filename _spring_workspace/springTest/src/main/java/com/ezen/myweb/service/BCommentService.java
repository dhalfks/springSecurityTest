package com.ezen.myweb.service;

import com.ezen.myweb.domain.BCommentVO;
import com.ezen.myweb.domain.PagingVO;
import com.ezen.myweb.handler.PagingHandler;

public interface BCommentService {

	int register(BCommentVO cvo);

	PagingHandler getList(long bno, PagingVO pgvo);

	int modify(BCommentVO cvo);

	int remove(long cno);

}
