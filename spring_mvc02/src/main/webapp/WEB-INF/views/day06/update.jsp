<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
		
	    text-align:center;
	    padding:4px 10px;
	    background-color: #F6F6F6;
	}
	
th {
		width:120px;
	    text-align:center;
	    padding:4px 10px;
	    background-color: #B2CCFF;
	}
table {
	width: 700px;
}	
th, td {margin: 5px; padding: 10px;}

table caption {
	font-size: 20px;
	font-weight: bold;
	margin: 30px 0px;
}
</style>
<script type="text/javascript">
    <c:if test="${pwdchk =='fail' }">
    	alert("비밀번호 틀림");
    </c:if>
</script>
</head>
<body>
	<div align="center">
	<form method="post" action="board_update_ok" enctype="multipart/form-data">
		<table summary="게시판 상세보기">
		<caption>Board 게시판 상세보기</caption>
		<tbody>
		<tr>
			<th bgcolor="#B2EBF4">작성자</th>
			<td><input type="text" name="writer" size="12" value="${boardVO.writer }"></td>
		</tr>
		
		<tr>
			<th bgcolor="#B2EBF4">제목</th>
			<td><input type="text" name="title" size="12" value="${boardVO.title }"> </td>
		</tr>
		<%-- <tr>
			<th bgcolor="#B2EBF4">날짜</th>
			<td><input type="text" name="regdate" size="12" value="${boardVO.regdate }"> </td>
		</tr> --%>
		<tr>
			<th bgcolor="#B2EBF4">내용</th>
			<td><textarea name="content" cols="50" rows="8">${boardVO.content }</textarea></td>
		</tr>
		<tr>
			<th bgcolor="#B2EBF4">첨부파일</th>
			<c:choose>
				<c:when test="${empty boardVO.f_name}">
					<td>
					<input type="file" name="file_name"><b>첨부파일없음</b>
					<input type="hidden" name="old_f_name" value=""> 
					
					</td>
				</c:when>
			    <c:otherwise>
			    	<td> 
			    		<input type="file" name="file_name"><b><br>(${boardVO.f_name})</b>
					    <input type="hidden" name="old_f_name" value="${boardVO.f_name}">
			    	</td>
			    </c:otherwise>
			</c:choose>
		</tr>
		<tr>
  <th>비밀번호 확인</th>
  <td><input type="password" name="pwd" /></td>
</tr>
		</tbody>
		<tr>
					
		<tfoot>
		
		<tr>
		 
	     <td colspan="2">
	     
	        <input type="button" value="목록" onclick="board_list(this.form)" />
	        <input type="button" value="답글" onclick="board_ans_write(this.form)" />
	        <input type="button" value="수정" onclick="board_update_ok(this.form)" />
	        <input type="button" value="삭제" onclick="board_delete(this.form)" />
	        <input type="hidden" name="b_idx" value="${boardVO.b_idx}" />
		    <input type="hidden" name="cPage" value="${cPage}" />
		   <%--  <input type="hidden" name="pwd" value="${boardVO.pwd}" /> --%>
	     </td>
		</tr>
		
		</tfoot>
		</table>
	</form>
	</div>
	<script type="text/javascript">
		function board_list(f) {
			f.action="/day06";
			f.submit();
		}
		function board_ans_write(f) {
			f.action="/board_ans_write";
			f.submit();
		}
		function board_update_ok(f) {
			f.action="/board_update_ok";
			f.submit();
		}
		function board_delete(f) {
			f.action="/board_delete";
			f.submit();
		}
		
	</script>
	
</body>
</html>