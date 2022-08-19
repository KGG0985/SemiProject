package com.dog.service.qnaboard;

import java.sql.SQLException;
import java.util.Map;

import com.dog.command.Criteria;
import com.dog.dto.qnaboard.QnaVO;

public interface QnaService {

	// 목록 조회
	Map<String, Object> getQnaBoardList(Criteria cri) throws SQLException;

	// 게시글 조회
	QnaVO getQnaBoard(int qnaNo) throws SQLException;

	// 수정화면 상세
	//QnaVO getBoardForModify(int bno) throws SQLException;

	// 등록
	public void regist(QnaVO qnaBoard) throws SQLException;

	// 수정
	public void modify(QnaVO qnaBoard) throws SQLException;

	// 삭제
	public void remove(int qnaNo) throws SQLException;

} 