package com.dog.dao.qnaboard;

import java.sql.SQLException;
import java.util.List;

import com.dog.command.Criteria;
import com.dog.dto.qnaboard.QnaVO;

public interface QnaDAO {
	List<QnaVO> selectSearchBoardList(Criteria cri) throws SQLException;

	// 목록 개수
	int selectSearchBoardListCount(Criteria cri) throws SQLException;

	// 게시글 조회
	QnaVO selectBoardByBno(int qnaNo) throws SQLException;


	// 시퀀스 가져오기 
	//int selectBoardSequenceNextValue() throws SQLException;


	// 조회수 증가
	//void increaseViewCount(int bno) throws SQLException;

	// 작성
	public void insertBoard(QnaVO qnaBoard) throws SQLException;

	// 수정
	public void updateBoard(QnaVO qnaBoard) throws SQLException;

	// 삭제
	public void deleteBoard(int qnaNo) throws SQLException;


}