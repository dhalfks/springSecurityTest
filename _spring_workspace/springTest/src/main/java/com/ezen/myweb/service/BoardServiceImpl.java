package com.ezen.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.myweb.domain.BFileVO;
import com.ezen.myweb.domain.BoardDTO;
import com.ezen.myweb.domain.BoardVO;
import com.ezen.myweb.domain.PagingVO;
import com.ezen.myweb.repository.BCommentDAO;
import com.ezen.myweb.repository.BFileDAO;
import com.ezen.myweb.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bdao;
	@Inject
	private BFileDAO bfdao;
	@Inject
	private BCommentDAO cdao;
	
	@Transactional
	@Override
	public int register(BoardDTO bdto) {
		int isUp = bdao.insertBoard(bdto.getBvo());
		if(isUp > 0 && bdto.getBfList().size()>0) {
			long bno = bdao.selectOneBno();
			for(BFileVO bfvo : bdto.getBfList()) {
				bfvo.setBno(bno);
				isUp *= bfdao.insertBFile(bfvo);
			}
		}
		return isUp;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		return bdao.selectlistBoardPaging(pgvo);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.selectOneTotalCount(pgvo);
	}

	@Transactional
	@Override
	public BoardDTO getDetail(long bno) {
		bdao.updateBoardReadCount(bno,1);
		BoardVO bvo = bdao.selectOneBoard(bno);
		
		return new BoardDTO(bvo,bfdao.selectListBFile(bno));
	}

	@Override
	public int modify(BoardDTO bdto) {
		int isUp = bdao.updateBoard(bdto.getBvo());
		if (bdto.getBfList() != null) {
			if (isUp > 0 && bdto.getBfList().size() > 0) {
				long bno = bdto.getBvo().getBno();
				for (BFileVO bfvo : bdto.getBfList()) {
					bfvo.setBno(bno);
					isUp *= bfdao.insertBFile(bfvo);
				}
			}
		}
		bdao.updateBoardReadCount(bdto.getBvo().getBno(), -2); 
		//2개 빼는 이유? 수정 후 detail에 한번더 접근하기 때문
		return isUp;
	}

	@Override
	public int remove(long bno) {
		cdao.deleteAllBComment(bno);
		return bdao.deleteBoard(bno);
	}

	//commit확정된 데이터만 읽기 허용
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public int removeFile(String uuid) {
		long bno = bfdao.selectOneBno(uuid);
		int isDel = bfdao.deleteBFile(uuid);
		int cnt = bfdao.selectOneFileCount(bno);
		bdao.updateBoardFileCount(bno, cnt);
		return isDel;
	}

}
