<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:url var="readUrl" value="/goods/list" />
<c:url var="createUrl" value="/goods/create" />
<c:url var="updateUrl" value="/goods/update" />
<c:url var="destroyUrl" value="/goods/destroy" />
<title>Insert title here</title>
</head>
<body>
	<script>
		/*function callback(result){
		 alert(result.length);
		 str="<table border='1' align='center'>";
		 str += "<thead><tr><th data-field='giNum' class='text-center'>번호</th>";
		 str += "<th data-field='giName' class='text-center'>이름</th>";
		 str += "<th data-field='giName' class='text-center'>설명</th>";
		 str += "<th data-field='giName' class='text-center'>번호</th>";
		 str += "<th data-field='giName' class='text-center'>날짜</th>";
		 str += "<th data-field='giName' class='text-center'>시간</th>";
		 str += "</tr>";
		 str += "</thead>";
		 for(var i=0,max=result.length;i<max;i++){
		 var goods=result[i];
		
		 str += "<tr><td>"+ goods.giNum + "</td>";
		 str += "<td>" + goods.giName + "</td>";
		 str += "<td>" + goods.giDesc + "</td>";
		 str += "<td>" + goods.viNum + "</td>";
		 str += "<td>" + goods.giCredat + "</td>";
		 str += "<td>" + goods.giCretim + "</td>";
		 }
		 str += "</table>";
		 $("#s_div").html(str);
		 }
		 $(document).ready(function(){
		 $("input[type='button']").click(function(){
		 var au=new AjaxUtil("goods/list");
		 au.setCallbackSuccess(callback);
		 au.send();
		 })
		 })*/
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form action="${rootPath}/goods/list" method="post">
		<input type='button' value='전송'>
	</form>
	<div id=s_div></div>
	<kendo:grid title="그리드" name="grid" pageable="true" sortable="true"
		scrollable="true" height="450" navigatable="incell">
		<kendo:grid-editable mode="incell" />
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성" />
			<kendo:grid-toolbarItem name="save" text="저장" />
		</kendo:grid-toolbar>
		<kendo:grid-columns>
			<kendo:grid-column title="제품번호" field="giNum" />
			<kendo:grid-column title="제품이름" field="giName" />
			<kendo:grid-column title="제품설명" field="giDesc" />
			<kendo:grid-column title="회사번호" field="viNum" />
			<kendo:grid-column title="생산일자" field="giCredat" format="{0:yyyy-MM-dd}" />
			<kendo:grid-column title="생산시간" field="giCretim" />
			<kendo:grid-column command="destroy" title="삭제"/>
		</kendo:grid-columns>

		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url='${readUrl}' dataType="json" type="POST" contentType="application/json" />
				<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json"/>
				<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json" />
				<kendo:dataSource-transport-destroy url="${destroyUrl}" dataType="json" type="POST" contentType="application/json" />
				<kendo:dataSource-transport-parameterMap>
					<script>
					function parameterMap(options, type){	
						if(type==="read"){
							return JSON.stringify(options);
						}else{
							return JSON.stringify(options.models);
						}
					}
					</script>
				</kendo:dataSource-transport-parameterMap>
			</kendo:dataSource-transport>

			<kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="giNum">
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="giNum" type="number" editable="false"/>
						<kendo:dataSource-schema-model-field name="giName" type="string">
							<kendo:dataSource-schema-model-field-validation required="true" />
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="viNum" defaultValue="1">
							<kendo:dataSource-schema-model-field-validation required="true" min="1" />
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="giCredat" editable="true" type="date">
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="giCretim" editable="false" >
						</kendo:dataSource-schema-model-field>
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema> 
		</kendo:dataSource>
	</kendo:grid>
</body>
</html>