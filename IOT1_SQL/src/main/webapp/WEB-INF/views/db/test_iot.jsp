<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ page session="false"%>
<c:set var="dbTreeJsp" value="/WEB-INF/views/db/tanle_info.jsp" />
<c:set var="tableInfoJsp" value="/WEB-INF/views/db/table_info.jsp" />
<c:set var="tabJsp" value="/WEB-INF/views/db/tab.jsp" /> //jsp를 바라볼땐 set(실제경로가 있어야되서)
<c:url var="tableInfoUrl" value=/db/table/info " /> //이건 url
<title>Insert title here</title>
<script>
var treeview

function onBound(){
	treeview=$("#treeview").data("kendoTreeView");
}

function treeSelect(){
	window.selectedNode=treeview.select();
	var data=treeview.dataItem(window.selectedNode);
	if(data.database && !data.hasChildren){
		var au=new AjaxUtil("db/table/list");
		var param={};
		param["database"]=data.database;
		au.param=JSON.stringify(param);
		au.setCallbackSuccess(callbackForTreeItem2);
		au.send();else if(data.tableName){
			var ki=new KendoItem(treeview, $("#tableInfoGrid"), "@{tableInfoUrl}","tableName");
			ki.send();
		}
	}
}

function callbackForTreeItem(result){
	if(result.error){
		alert(result.error);
		return;
	}
	for(var i=0, max=result.databaseList.length; i<max; i++){
		var database=result.databaseList[i];
		treeview.appen({
			database: database.database
		}, treeview.select());
	}
	$("#btnConnect").text("접속해제");
}
</script>
<body>
	<c:import url="${menuUrl }" />
	<kendo:splitter name="vertical" orientaion="vertical">
		<kendo:splitter-panes>
			<kendo:splitter-pane id="top-pane" collapsible="false">
				<kendo:splitter-pane-content>
					<kendo:splitter name="horizontal" style="height: 100%; width: 100%">
						<kendo:splitter-panes>
							<kendo:splitter-pane id="left-pane" collapsible="true"
								size="220px">
								<kendo:splitter-pane-content>
									<div class="pane-content">
										<c:import url="${dbTreeJsp }" />
									</div>
								</kendo:splitter-pane-content>
							</kendo:splitter-pane>
							<kendo:splitter-pane id="center-pane" collapsible="false">
								<kendo:splitter-pane-content>
									<kendo:splitter name="vertical1" orientation="vertical"
										style="height: 100%; width: 100%;">
										<kendo:splitter-panes>
											<kendo:splitter-pane id="top-pane" collapsible="false">
												<div class="pane-content">
													<c:import url="${tabJsp }" />
												</div>
											</kendo:splitter-pane>
											<kendo:splitter-pane id="middle-pane" collapsible="true">
												<div class="pane-content">
													<c:import url="${tableInfoJsp }" />
												</div>
											</kendo:splitter-pane>
										</kendo:splitter-panes>
									</kendo:splitter>
								</kendo:splitter-pane-content>
							</kendo:splitter-pane>
						</kendo:splitter-panes>
					</kendo:splitter>
				</kendo:splitter-pane-content>
			</kendo:splitter-pane>
			<kendo:splitter-pane id="middle-pane" collapsible="false"
				size="100px">
				<kendo:splitter-pane-content>
					<div class="pane-content">
						<h3>Outer splitter/middle pane</h3>
						<p>Resizable only.</p>
					</div>
				</kendo:splitter-pane-content>
			</kendo:splitter-pane>
			<kendo:splitter-pane id="bottom-pane" collapsible="false"
				resizable="false" size="20px" scrollable="false">
				<kendo:splitter-pane-content>
					<b>MySql Tool For Web</b>
				</kendo:splitter-pane-content>
			</kendo:splitter-pane>
		</kendo:splitter-panes>
	</kendo:splitter>
</body>
</html>