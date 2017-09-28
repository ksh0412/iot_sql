<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리</title>
</head>
<p><br/><br/></p>
<body>
<!-- 인사등록카드 문구 출력 테이블 -->
<div id="humangrid" ></div><br/>	 
<!-- 칼럼그리드 -->
	<kendo:grid title="그리드" name="grid" pageable="true" sortable="true"  
		scrollable="true" geight="450" navegatable="incell"  dataBound="initEvent">	
		<kendo:grid-editable mode="incell" />
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="button" text="신규"/>
			<kendo:grid-toolbarItem name="save" text="저장" />
			<kendo:grid-toolbarItem name="cancel" text="취소" />
		</kendo:grid-toolbar>
		<kendo:grid-columns>
			<kendo:grid-column title="사번" field="humanNumber" />
			<kendo:grid-column title="성명" field="humanName" />
			<kendo:grid-column title="주민등록번호" field="residentNumber" />
			<kendo:grid-column title="부서" field="department" />
			<kendo:grid-column title="직급" field="gPosition" />
			<kendo:grid-column title="입사일자" field="enteringDate" />
			<kendo:grid-column title="계좌번호" field="bankNumber" />
			<kendo:grid-column title="이메일" field="eMail" />
			<kendo:grid-column title="인쇄" field="print" />
		</kendo:grid-columns>

<!-- 데이터타입지정&입력&수정 -->
		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="humanNumber">
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="humanNumber"
							type="number" editable="false" />
						<kendo:dataSource-schema-model-field name="humanName"
							type="string" editable="false" />
						<kendo:dataSource-schema-model-field name="residentNumber"
							type="number" editable="false" />
						<kendo:dataSource-schema-model-field name="department"
							editable="true" type="string" />
						<kendo:dataSource-schema-model-field name="gPosition"
							editable="true" type="string" />
						<kendo:dataSource-schema-model-field name="enteringDate"
							editable="false" type="date" />
						<kendo:dataSource-schema-model-field name="bankNumber"
							type="string" />
						<kendo:dataSource-schema-model-field name="eMail" editable="false"
							type="string" />
						<kendo:dataSource-schema-model-field name="print" type="string" />
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
		</kendo:dataSource>
	</kendo:grid>
</body>
<script>
$("a[field='humanNumber']").on("click", function(){
	location.href="/url/erd:humanInfo";
});
function initEvent(){
	alert($("a[role='button']").length);
	$("a[role='button']").on("click", function () {
		location.href="/url/erd:humanInfo";
	});
}
$("#grid").find("kendo:grid-toolbar").insertAfter($("#grid"))
$("#humangrid").kendoGrid({
	  columns: ["인사카드등록"]		//인사등록카드 문구 출력 테이블
	});
$(document).ready(function (){
		var humanNumber = 111;
		var humanName = "test";
		var residentNumber = 123123;
		var department = "test";
		var gPosition = "test";
		var enteringDate = 123123;
		var bankNumber = 123123;
		var eMail = "test";
		var print = "print";

		var param = {};
		param["humanNumber"] = humanNumber;
		param["humanName"] = humanName;
		param["residentNumber"] = residentNumber;
		param["department"] = department;
		param["gPosition"] = gPosition;
		param["enteringDate"] = enteringDate;
		param["bankNumber"] = bankNumber;
		param["eMail"] = eMail;
		param["print"] = print;

// 		try {
// 			$('#grid').kendoGrid('destroy').empty();
// 		} catch (e) {

// 		}
		var params = new Array();
		for(var i=0;i<8;i++){
		params[params.length] = param;
		}
// 		var jsonParam = JSON.stringify(params);
		var gridParam = {
// 			columns : [ {
// 				field : "humanNumber",		//캔도그리드할때 칼럼생성
// 				title : "사번" 
// 			}, {
// 				field : "humanName",
// 				title : "성명" 
// 			}, {
// 				field : "residentNumber",
// 				title : "주민등록번호"
// 			}, {
// 				field : "department",
// 				title : "부서" 
// 			}, {
// 				field : "gPosition",
// 				title : "직급" 
// 			}, {
// 				field : "enteringDate",
// 				title : "입사일자" 
// 			}, {
// 				field : "bankNumber",
// 				title : "계좌번호" 
// 			}, {
// 				field : "eMail",
// 				title : "이메일"
// 			}, {
// 				field : "print",
// 				title : "인쇄" 
// 			} ],
			dataSource : {
				data : params,
				pageSize : 5
			},
			editable : false,
			pageable : true
		}
		var grid = $("#grid").kendoGrid(gridParam); //리스트를 캔도그리드로 출력
})	
</script>
</html>