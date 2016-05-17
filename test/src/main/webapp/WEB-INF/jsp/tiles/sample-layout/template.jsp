<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
	<title>샘플홈페이지 인덱스</title>
    
    <style>
    body {
        padding-top: 70px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    }
    </style>
    
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/plugin/sb-admin2/bower_components/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value="/plugin/sb-admin2/dist/css/sb-admin-2.css"/>" rel="stylesheet">
    
    <!-- jQuery Version -->
    <script src="<c:url value="/plugin/sb-admin2/bower_components/jquery/dist/jquery.min.js"/>"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/plugin/sb-admin2/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="footer" />
</body>
</html>