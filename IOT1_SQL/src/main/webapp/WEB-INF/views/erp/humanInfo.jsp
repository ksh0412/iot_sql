<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border='1' id = "table" >
    <tr>
    <th data-field = "humanNumber" class = "text-center">사번</th>
    <th data-field = "humanName" class = "text-center">성명</th>
    <th data-field = "residentNumber" class = "text-center">주민등록번호</th>
    <th data-field = "department" class = "text-center">부서</th>
    <th data-field = "gPosition" class = "text-center">직급</th>
    <th data-field = "enteringDate" class = "text-center">입사일자</th>
    <th data-field = "bankNumber" class = "text-center">계좌번호</th>
    <th data-field = "eMail" class = "text-center">이메일</th>
    <th data-field = "print" class = "text-center">인쇄</th>
    </tr>
    <tbody id="result_tbody"></tbody>
    </table>
    <input type = "button" id = "regist" value="신규등록"></br>
</body>
</html>