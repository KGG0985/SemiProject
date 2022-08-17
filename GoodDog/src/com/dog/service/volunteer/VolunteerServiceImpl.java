package com.dog.service.volunteer;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dog.command.Criteria;
import com.dog.command.PageMaker;
import com.dog.dao.volunteer.VolunteerDAO;
import com.dog.vo.member.MemberVO;
import com.dog.vo.volunteer.VolunteerVO;

public class VolunteerServiceImpl implements VolunteerService {
	
	private VolunteerDAO volunteerDAO;
	public void setVolunteerDAO(VolunteerDAO volunteerDAO) {
		this.volunteerDAO = volunteerDAO;
	}
	@Override
	public Map<String,Object> getVolWantMemberList(Criteria cri) throws SQLException {
		// 봉사신청명단조회
		Map<String,Object> dataMap =null;
		
		//처리.......
		List<MemberVO> volunteerList = volunteerDAO.selectVolWantMemberList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(volunteerDAO.selectVolWantMemberListCount(cri));
		
		dataMap = new HashMap<String,Object>();
		dataMap.put("volunteerList", volunteerList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}
	
	@Override
	public void insertVol(VolunteerVO volVo) throws SQLException {
		System.out.println(volVo.getVolTitle());
		System.out.println(volVo.getVolDate());
		System.out.println(volVo.getVolType());
		System.out.println(volVo.getVolContent());
		volunteerDAO.insertVol(volVo);
		
	}

	@Override
	public void insertVolWantMember(String memId) throws SQLException {
		volunteerDAO.insertVolWantMember(memId);
	}
	
	@Override
	public Map<String,Object> getVolList(Criteria cri) throws SQLException { //등록된 봉사 목록 조회
		Map<String, Object> dataMap = null;
		
		List<VolunteerVO> volList = volunteerDAO.selectVolList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(volunteerDAO.selectVolListCount(cri));
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("volList", volList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}
	@Override
	public VolunteerVO getVolunteer(String volTitle) throws SQLException {
		VolunteerVO volunteer = volunteerDAO.selectVolunteerByTitle(volTitle);
		
		return volunteer;
	}

	@Override
	public Map<String,Object> getVolList(Criteria cri) throws SQLException { //등록된 봉사 목록 조회
		Map<String, Object> dataMap = null;
		
		List<VolunteerVO> volList = volunteerDAO.selectVolList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(volunteerDAO.selectVolListCount(cri));
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("volList", volList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}

}
