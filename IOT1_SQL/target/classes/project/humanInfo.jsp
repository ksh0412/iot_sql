<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border='1' id = "table" >
    <tr>
    <th data-field = "humanNo" class = "text-center">사번</th>
    <th data-field = "humanKorName" class = "text-center">성명</th>
    <th data-field = "humanResidentNumber" class = "text-center">주민등록번호</th>
    <th data-field = "departmentName" class = "text-center">부서</th>
    <th data-field = "rankName" class = "text-center">직급</th>
    <th data-field = "humanEnteringDate" class = "text-center">입사일자</th>
    <th data-field = "humanAccountNumber" class = "text-center">계좌번호</th>
    <th data-field = "humanEmail" class = "text-center">이메일</th>
    <th data-field = "print" class = "text-center">인쇄</th>
    </tr>
    <tbody id="result_tbody"></tbody>
    </table>
    <input type = "button" id = "regist" value="신규등록"></br>
</body>
<script>
$(document).ready(function(){
	var param = {};
	movePageWithAjax(param, "/erp/hrmList/main", callBack);
});

function movePageWithAjax(pParam, url, callBack, pMethod){
var param = JSON.stringify(pParam);
$.ajax({ 
		type     : pMethod ? pMethod:"POST"
    ,   url      : url
    ,   dataType : "json" 
    ,   beforeSend: function(xhr) {
        xhr.setRequestHeader("Accept", "application/json");
        xhr.setRequestHeader("Content-Type", "application/json");
    }
    ,   data     : param
    ,   success : callBack
    ,   error : function(xhr, status, e) {
	    	alert("에러 : "+e);
	},
	complete  : function() {
	}
});
}
function callBack(result){
	var humanList = result.humanList;
	var str = "";
	for(var i=0, max=humanList.length; i<max; i++){
		str += "<tr data-view='"+humanList[i].humanNo+"'>";
		str += "<th class = 'text-center'>" + humanList[i].humanNo + "</th>";
		var humanNum = humanList[i].humanNo;
		str += "<th class = 'text-center'><a href='#javascript' onclick='goBoard(" + humanList[i].humanNo + ")'>" + humanList[i].humanKorName +"</th>";
		str += "<th class = 'text-center'>" + humanList[i].humanResidentNumber +"</th>";
		str += "<th class = 'text-center'>" + humanList[i].departmentName +"</th>";
		str += "<th class = 'text-center'>" + humanList[i].rankName +"</th>";
		str += "<th class = 'text-center'>" + humanList[i].humanEnteringDate + "</th>";
		str += "<th class = 'text-center'>" + humanList[i].humanAccountNumber +"</th>";
		str += "<th class = 'text-center'>" + humanList[i].humanEmail +"</th>";
		str += "<th class = 'text-center'> 인쇄 </th>";
		str += "</tr>";
	}
	$("#result_tbody").html(str);
}

function goBoard(humanNum){
	alert(humanNum);
	location.href="/erp/hrm/indfoDetail/" + humanNum;
}
</script>
</html>