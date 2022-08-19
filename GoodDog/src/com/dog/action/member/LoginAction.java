package com.dog.action.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.PersistenceException;

import com.dog.action.Action;
import com.dog.exception.InvalidPasswordException;
import com.dog.exception.NotFoundIDException;
import com.dog.service.admin.AdminService;
import com.dog.service.member.MemberService;




public class LoginAction implements Action {
   
   private MemberService memberService;
   public void setMemberService(MemberService memberService) {
      this.memberService = memberService;
   }
   
   private AdminService adminService;
   public void setAdminService(AdminService adminService) {
      this.adminService = adminService;
   }
   
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception{

      String url = "redirect:/index.do";
      
      //입력
      String memId = request.getParameter("id");
      String memPw = request.getParameter("pwd");
      String adminId = request.getParameter("id");
      String adminPw = request.getParameter("pwd");
      
//      try {
//    	  adminService.login(adminId, adminPw);
//          
//          HttpSession session = request.getSession();
//          session.setAttribute("loginAdmin", adminService.getAdmin(adminId));
//          session.setMaxInactiveInterval(6*60);
//       }catch(InvalidPasswordException | NotFoundIDException e1) {
//    	  request.setAttribute("message", e1.getMessage());
//    	   System.out.println(e1.getMessage());
//      

      //처리
      try {
    	  if (adminService.getAdmin(adminId)!=null) {
    		  adminService.login(adminId, adminPw);
    	       HttpSession session = request.getSession();
    	          session.setAttribute("loginAdmin", adminService.getAdmin(adminId));
    	          session.setMaxInactiveInterval(6*60);
    	          return url;
    	  }
    	      	  
         memberService.login(memId, SHA256.encodeSha256(memPw));
         
         HttpSession session = request.getSession();
         session.setAttribute("loginUser", memberService.getMember(memId));
         session.setMaxInactiveInterval(6*60);
      } catch (SQLException e) {
         e.printStackTrace();
         throw e;
      }
      catch(InvalidPasswordException | NotFoundIDException e) {
         request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다");
         	System.out.println(e.getMessage());
			url = "/common/loginForm"; 
      }
      catch(PersistenceException | NullPointerException e) {
    	  url ="redirect:/loginForm.do";
      }
//       }
      return url;
   }

}