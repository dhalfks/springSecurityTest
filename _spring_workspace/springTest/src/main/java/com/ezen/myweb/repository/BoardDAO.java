package com.ezen.myweb.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.myweb.domain.BoardVO;
import com.ezen.myweb.domain.PagingVO;

public interface BoardDAO {

	int insertBoard(BoardVO bvo);

	long selectOneBno();

	List<BoardVO> selectlistBoardPaging(PagingVO pgvo);

	int selectOneTotalCount(PagingVO pgvo);

	void updateBoardReadCount(@Param("bno")long bno, @Param("cnt")int cnt);

	BoardVO selectOneBoard(long bno);

	void updateBoardCmtQty(@Param("bno")long bno, @Param("cnt")int cnt);

	int updateBoard(BoardVO bvo);

	int deleteBoard(long bno);

	void updateBoardFileCount(@Param("bno")long bno, @Param("cnt")int cnt);

}
