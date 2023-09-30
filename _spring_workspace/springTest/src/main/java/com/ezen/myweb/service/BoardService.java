package com.ezen.myweb.service;

import java.util.List;

import com.ezen.myweb.domain.BoardDTO;
import com.ezen.myweb.domain.BoardVO;
import com.ezen.myweb.domain.PagingVO;

public interface BoardService {

	int register(BoardDTO boardDTO);

	List<BoardVO> getList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

	BoardDTO getDetail(long bno);

	int modify(BoardDTO boardDTO);

	int remove(long bno);

	int removeFile(String uuid);

	

}
