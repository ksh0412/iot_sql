<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/topmenu.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<script type="text/javascript">
	function insertValue(id, id2, id3) {
		var inTd = id.id;
		var outTd = id2.id;
		var myModal = id3.id;
		var str = "<input type='button' data-toggle='modal' data-target='#"
				+ myModal + "' value="
				+ document.getElementById(inTd).innerHTML + " />";
		$("#" + outTd).html(str);
		$('.modal').modal('hide');
	}

	function deletePic() {
		$('#uploadPreview').attr('src', '');
	}

	function PreviewImage() {
		var oFReader = new FileReader();
		oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

		oFReader.onload = function(oFREvent) {
			document.getElementById("uploadPreview").src = oFREvent.target.result;
		};
	};

	function searchAddress() {
		window
				.open(
						'/erp/address',
						'winname',
						'directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no');
	}

	function initEvent(){
		$("#careerTable > tbody > tr > td").click(function(){
			str = "<input type='button' data-toggle='modal' data-target='#"
				+ myModal + "' value="
				+ this.innerHTML + " />";
			$("#outTd1").html(str);
			alert(this.innerHTML);
		})
	}
	
	$(document).ready(
			function() {
				$('div').each(function(){
					  if(this.id.indexOf("outTd")==0){
						  $("#"+this.id).click(function(){
							  var aul = new AjaxUtilList("hrm/career","careerTable", "careerName",null, null, initEvent);
								aul.send();
								
								var careerNo = $("#careerNo").value;
								
								alert(this.id);
						  });
					  }
					});
// 				$("#outTd1").click(
// 						function() {
// 							var aul = new AjaxUtilList("hrm/career","careerTable", "careerName",null, null, initEvent);
// 							aul.send();
							
// 							var careerNo = $("#careerNo").value;
// 						})
			});
</script>
<br />
<p></p>
<br />
<div class="container">
	<table id="table" data-height="460"
		class="table table-bordered table-hover">
		<tr>
			<td rowspan="9" align="center" style="vertical-align: middle"><img
				id="uploadPreview" style="width: 200px; height: 350px;" /></td>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">사원번호</td>
			<td class="col-md-2"><input type="text" class="form-control" /></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">성명</td>
			<td class="col-md-4"><input type="text" class="form-control" /></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">영어
				성명</td>
			<td class="col-md-2"><input type="text" class="form-control" /></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">제2외국어성명</td>
			<td class="col-md-4"><input type="text" class="form-control" /></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">주민등록번호</td>
			<td class="col-md-2"><input type="text"
				class="form-control form-min" size="6" /> - <input type="text"
				class="form-control form-min" size="7" /></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">세대주
				여부</td>
			<td class="col-md-4"><input placeholder="팝업창 출력" /></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">입사일자</td>
			<td class="col-md-2"><input type="date" class="form-control" /></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">입사구분</td>
			<td class="col-md-4"><div id="outTd1">
					<input type="button" data-toggle="modal" data-target="#myModal"
						value="선택되지않음" />
				</div> <!-- 모달 팝업 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">입사구분</h4>
							</div>
							<div class="modal-body">
								<table class="tableList" id="careerTable">
									<thead>
										<tr>
											<th data-field="careerCode">그룹 코드</th>
											<th data-field="careerName">그룹명</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<input type="hidden" id="careerName">
								<table id="table" data-height="460"
									class="table table-bordered table-hover">
									<tr>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">그룹코드</td>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">그룹명</td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd1, outTd1, myModal)">001</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd1, outTd1, myModal)" id="inTd1">경력</a></td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd2, outTd1, myModal)">002</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd2, outTd1, myModal)" id="inTd2">신입</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">직위/직급</td>
			<td class="col-md-2"><div id="outTd2">
					<input type="button" data-toggle="modal" data-target="#myModal2"
						value="선택되지않음" />
				</div> <!-- 모달 팝업 -->
				<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel2">직위/직급</h4>
							</div>
							<div class="modal-body">
								<table id="table" data-height="460"
									class="table table-bordered table-hover">
									<tr>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">직급코드</td>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">직급명</td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd3, outTd2, myModal2)">001</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd3, outTd2, myModal2)" id="inTd3">사장</a></td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd4, outTd2, myModal2)">002</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd4, outTd2, myModal2)" id="inTd4">주임</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">직책</td>
			<td class="col-md-4"><div id="outTd3">
					<input type="button" data-toggle="modal" data-target="#myModal3"
						value="선택되지않음" />
				</div> <!-- 모달 팝업 -->
				<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel3">직책</h4>
							</div>
							<div class="modal-body">
								<table id="table" data-height="460"
									class="table table-bordered table-hover">
									<tr>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">그룹코드</td>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">그룹명</td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd5, outTd3, myModal3)">001</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd5, outTd3, myModal3)" id="inTd5">팀원</a></td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd6, outTd3, myModal3)">002</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd6, outTd3, myModal3)" id="inTd6">팀장</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">퇴사일자</td>
			<td class="col-md-2"><input type="date" class="form-control" /></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">퇴사사유</td>
			<td class="col-md-4"><input type="text" class="form-control" /></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">전화</td>
			<td class="col-md-2"><input type="text" class="form-control" /></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">휴대폰</td>
			<td class="col-md-4"><input type="text" class="form-control" /></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">여권번호</td>
			<td class="col-md-2"><input type="text" class="form-control" /></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">Email</td>
			<td class="col-md-4"><input type="email" class="form-control" /></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">부서코드</td>
			<td class="col-md-3"><div id="outTd4">
					<input type="button" data-toggle="modal" data-target="#myModal4"
						value="선택되지않음" />
				</div> <!-- 모달 팝업 -->
				<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel4">부서코드</h4>
							</div>
							<div class="modal-body">
								<table id="table" data-height="460"
									class="table table-bordered table-hover">
									<tr>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">부서코드</td>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">부서명</td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd7, outTd4, myModal4)">001</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd7, outTd4, myModal4)" id="inTd7">개발팀</a></td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd8, outTd4, myModal4)">002</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd8, outTd4, myModal4)" id="inTd8">고객지원팀</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div></td>

			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">프로젝트</td>
			<td class="col-md-4"><div id="outTd5">
					<input type="button" data-toggle="modal" data-target="#myModal5"
						value="선택되지않음" />
				</div> <!-- 모달 팝업 -->
				<div class="modal fade" id="myModal5" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel5">프로젝트</h4>
							</div>
							<div class="modal-body">
								<table id="table" data-height="460"
									class="table table-bordered table-hover">
									<tr>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">프로젝트코드</td>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">프로젝트명</td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd9, outTd5, myModal5)">001</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd9, outTd5, myModal5)" id="inTd9">프로젝트A</a></td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd10, outTd5, myModal5)">002</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd10, outTd5, myModal5)" id="inTd10">프로젝트Z</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div></td>
		</tr>


		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">급여통장</td>
			<td class="col-md-4" colspan="4">은행명 :
				<div style="display: inline" id="outTd7">
					<input type="button" data-toggle="modal" data-target="#myModal7"
						value="선택되지않음" />
				</div> <!-- 모달 팝업 -->
				<div class="modal fade" id="myModal7" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel7">은행검색</h4>
							</div>
							<div class="modal-body">
								<table id="table" data-height="460"
									class="table table-bordered table-hover">
									<tr>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">은행코드</td>
										<td align="center" style="vertical-align: middle"
											bgcolor="cccccc">은행명</td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd13, outTd7, myModal7)">001</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd13, outTd7, myModal7)" id="inTd13">남자은행</a></td>
									</tr>
									<tr>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd14, outTd7, myModal7)">002</a></td>
										<td align="center" style="vertical-align: middle"><a
											onclick="insertValue(inTd14, outTd7, myModal7)" id="inTd14">나무은행</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div> 계좌번호 : <input type="text" class="form-control form-min2">
				예금주 : <input type="text" class="form-control form-min2">
			</td>
		</tr>

		<tr>
			<td class="col-md-2" rowspan="2" style="vertical-align: middle"
				bgcolor="cccccc">주소</td>
			<td class="col-md-4" colspan="4"><a href='#javascript'
				onclick='searchAddress()'><input type="text"
					class="form-control">우편번호검색 <input /></a></td>
		<tr>
			<td class="col-md-4" colspan="4"><input type="text"
				class="form-control">상세주소 <input /></td>
		</tr>
		</tr>


		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">적요</td>
			<td class="col-md-4" colspan="4"><input type="text"
				class="form-control"></input></td>
		</tr>


		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">사진</td>
			<td class="col-md-4" colspan="4"><input id="uploadImage"
				type="file" name="myPhoto" onchange="PreviewImage()"
				style="float: left" /><a onclick="deletePic()" style="float: left">사진삭제</a></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">첨부파일</td>
			<td class="col-md-4" colspan="4"><input type="file" /></td>
		</tr>

		<tr>
			<td class="col-md-2" style="vertical-align: middle" bgcolor="cccccc">개인파일함</td>
			<td class="col-md-4" colspan="4"><input type="file" /></td>
		</tr>
	</table>
	<input type="button" value="저장" /><input type="button" value="신규" /><input
		type="button" value="삭제" /><input type="button" value="리스트" />
</div>


<!-- 		<button type="button" data-toggle="modal" data-target="#myModal" > Launch demo modal </button> -->
<!-- 모달 팝업 -->
<!-- 		 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >  -->
<!-- 		 <div class="modal-dialog"> <div class="modal-content">  -->
<!-- 		 <div class="modal-header">  -->
<!-- 		 <button type="button" class="close" data-dismiss="modal"> -->
<!-- 		 <span aria-hidden="true">×</span><span class="sr-only">Close</span></button>  -->
<!-- 		 <h4 class="modal-title" id="myModalLabel">Modal title</h4> </div> <div class="modal-body"> ... </div>  -->
<!-- 		 <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  -->
<!-- 		 <button type="button" class="btn btn-primary">Save changes</button> </div> </div> </div> </div>  -->


<style>
.form-control.form-min {
	width: 124px;
	display: inline;
}

.form-control.form-min2 {
	width: 300px;
	display: inline;
}

.modal-backdrop {
	z-index: -1;
}
</style>
