package com.dog.dao.qnaboard;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dog.command.Criteria;
import com.dog.dto.qnaboard.QnaVO;

public class QnaDAOImpl implements QnaDAO {

	private SqlSessionFactory SqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.SqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<QnaVO> selectSearchBoardList(Criteria cri) throws SQLException {
		System.out.println("DAO-selectSearchBoardList 호출");
		SqlSession session = SqlSessionFactory.openSession();
		try {
			int offset = cri.getStartRowNum();
			int limit = cri.getPerPageNum();
			RowBounds rowBounds = new RowBounds(offset,limit);

		List<QnaVO> qnaList = session.selectList("QnaBoard-Mapper.selectSearchBoardList",cri,rowBounds);
		return qnaList;
		}catch(Exception e) {
			throw e;
		}finally {
			if(session != null)session.close();
		}

	}

	@Override
	public int selectSearchBoardListCount(Criteria cri) throws SQLException {
		SqlSession session = SqlSessionFactory.openSession();
		try {

			int count = session.selectOne("QnaBoard-Mapper.selectSearchBoardListCount",cri);			
			return count;
		}catch(Exception e) {
			//����ó��
			throw e;
		}finally {
			if(session != null)session.close();
		}

	}

	@Override
	public QnaVO selectBoardByBno(int bno) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public int selectBoardSequenceNextValue() throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}

//	@Override
//	public void increaseViewCount(int bno) throws SQLException {
//		// TODO Auto-generated method stub
//
//	}

	@Override
	public void insertBoard(QnaVO board) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBoard(QnaVO board) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoard(int bno) throws SQLException {
		// TODO Auto-generated method stub

	}


}