<html>
<head>
    <!-- META -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <meta name="apple-mobile-web-app-capable" content="yes">
	
	<title>샘플홈페이지 인덱스</title>
	<link href="<c:url value="/plugin/axicon/axicon.css"/>" rel="stylesheet">
    <link href="<c:url value="/plugin/axisj-1.1.2/ui/kakao/AXJ.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/plugin/axisj-1.1.2/ui/kakao/AXGrid.css"/>" rel="stylesheet">
    <link href="<c:url value="/plugin/axu-1.1.1/theme/Barracks-cacao/admin/ui/cacao/admin.css"/>" rel="stylesheet">
    <style type="text/css">
    	.AXInput{
    		height: 27px;
    	}
    </style>
    <!-- <link href="http://axu.axisj.com/theme/Barracks/admin/ui/cacao/admin.css" rel="stylesheet"> -->
    <!-- <link href="http://axu.axisj.com/theme/Barracks/admin/ui/custom.css" rel="stylesheet"> -->
    <script src="<c:url value="/plugin/axisj-1.1.2/jquery/jquery-.min.js"/>"></script>
    <script src="<c:url value="/plugin/axisj-1.1.2/dist/AXJ.all.js"/>"></script>
    <script type="text/javascript">
    function axConfirm(message, cbConfirm) {
        function fnCallCallback(data) {
            if ($.isFunction(cbConfirm)) {
                cbConfirm.call(this, data);
            }
            mask.close();
        }

        mask.open();
        dialog.push({
            title   : "Confirm",
            type    : "Caution",
            top     : (document.body.clientHeight / 2 - 180),
            body    : message,
            buttons : [
                { buttonValue: "예",   buttonClass: "Red W60", data: "Y", onClick: fnCallCallback },
                { buttonValue: "아니오",buttonClass: "Blue W60", data: "N",onClick: fnCallCallback }
            ]
        });
    }
    </script>
    <!-- <script src="http://axu.axisj.com/theme/Barracks/admin/resource/admin.js"></script> -->
</head>
<body>
	<div id="AXPage">
		<tiles:insertAttribute name="header" />
		<div class="ax-body">
			<div class="ax-wrap">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
	
</body>
</html>