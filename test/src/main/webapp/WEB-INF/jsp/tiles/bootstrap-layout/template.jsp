<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>공통컴포넌트</title>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/plugin/sb-admin2/bower_components/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="<c:url value="/plugin/sb-admin2/bower_components/metisMenu/dist/metisMenu.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/plugin/sb-admin2/dist/css/sb-admin-2.css"/>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/plugin/sb-admin2/bower_components/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
     <!-- checkbox CSS -->
    <link href="<c:url value="/plugin/sb-admin2/dist/css/awesome-bootstrap-checkbox.css"/>" rel="stylesheet">
	 <style>
	 	/* INPUT */
	    .input-group-addon {
		    min-width:150px;
		    text-align:left;
		}
	 
	 	 .table {
			min-width: 1000px;
		} 
		
		.table td {
		  max-width: 120px;
		  white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis;
		
		}
	 </style>    
    
    
    <!-- jQuery Version -->
    <script src="<c:url value="/plugin/sb-admin2/bower_components/jquery/dist/jquery.min.js"/>"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/plugin/sb-admin2/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script> 
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/plugin/sb-admin2/bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/plugin/sb-admin2/dist/js/sb-admin-2.js"></script>   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    	<script src="<c:url value="/plugin/html5/html5shiv.js"/>"></script>
    	<script src="<c:url value="/plugin/html5/respond.min.js"/>"></script>  
    <![endif]-->    
</head>
<body>
    <div id="wrapper">

	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="left" />
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="footer" />
	
	</div>
    <!-- /#wrapper -->
</body>
</html>