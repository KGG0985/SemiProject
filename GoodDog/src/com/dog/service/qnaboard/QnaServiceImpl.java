package com.dog.service.qnaboard;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dog.command.PageMaker;
import com.dog.dao.qnaboard.QnaDAO;
import com.dog.command.Criteria;
import com.dog.dto.qnaboard.QnaVO;

public class QnaServiceImpl implements QnaService {

	private QnaDAO qnaDAO;
	public void setQnaDAO(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}



	@Override
	public Map<String, Object> getQnaBoardList(Criteria cri) throws SQLException {
		System.out.println("service-getQnaBoardList 호출");
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<QnaVO> qnaBoardList = qnaDAO.selectSearchBoardList(cri);


		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(qnaDAO.selectSearchBoardListCount(cri));

		dataMap.put("qnaBoardList", qnaBoardList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;

	}

//	@Override
//	public QnaVO getBoardForModify(int bno) throws SQLException {
//		QnaVO board = qnaDAO.selectBoardByBno(bno);
//
//		return board;
//	}

//	@Override
//	public void regist(QnaVO board) throws SQLException {
//
//		int qnaNo = qnaDAO.selectBoardSequenceNextValue();
//		board.setQnaNo(qnaNo);
//		qnaDAO.insertBoard(board);
//	}

	@Override
	public void modify(QnaVO board) throws SQLException {
		qnaDAO.updateBoard(board);
	}

	@Override
	public void remove(int bno) throws SQLException {
		qnaDAO.deleteBoard(bno);
	}




	@Override
	public void regist(QnaVO board) throws SQLException {
		// TODO Auto-generated method stub

	}



	@Override
	public QnaVO getQnaBoard(int qnaNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
}