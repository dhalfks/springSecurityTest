package com.ezen.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.myweb.domain.BCommentVO;
import com.ezen.myweb.domain.PagingVO;
import com.ezen.myweb.handler.PagingHandler;
import com.ezen.myweb.repository.BCommentDAO;
import com.ezen.myweb.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BCommentServiceImpl implements BCommentService {
	
	@Inject
	private BCommentDAO cdao;
	
	@Inject
	private BoardDAO bdao;
	
	@Transactional
	@Override
	public int register(BCommentVO cvo) {
		int isUp = cdao.insertBComment(cvo);
		bdao.updateBoardCmtQty(cvo.getBno(), 1);
		return isUp;
	}

	@Override
	public PagingHandler getList(long bno, PagingVO pgvo) {
		int totalCount = cdao.selectOneBCommentTotalCount(bno);
		List<BCommentVO> list = cdao.selectListBComment(bno, pgvo);
		PagingHandler phd = new PagingHandler(pgvo, totalCount, list);
		return phd; 
	}

	@Override
	public int modify(BCommentVO cvo) {
		return cdao.updateBComment(cvo);
	}

	@Override
	public int remove(long cno) {
		long bno = cdao.selectOneBno(cno);
		int isUp = cdao.deleteOneBComment(cno);
		bdao.updateBoardCmtQty(bno, -1);
		return isUp;
	}

	
}
