<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<script>
$(document).ready(function(){
	$("#btn").click(function(){
		var list = [
				{col1:"data1-1", col2:"data2-1"},
				{col1:"data1-2", col2:"data2-2"},
				{col1:"data1-3", col2:"data2-3"},
				{col1:"data1-4", col2:"data2-4"},
				{col1:"data1-5", col2:"data2-5"}
			];
		var gridParam = {
		  		dataSource: {
		    	      data: list ,
		    	      pageSize: 2
		    	    },
		    	    editable: false,
		    	    sortable: true,
		    	    pageable:true	    
		  	}
	  	var grid = $("#test").kendoGrid(gridParam);
	})
})
</script>
</body>
</html>
