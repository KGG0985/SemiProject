<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script>
	alert("봉사등록에 성공했습니다.\n 봉사리스트 페이지로 이동합니다.");
	window.opener.location.href="<%=request.getContextPath()%>/vol/calendarList.do";
 	window.close();
</script>