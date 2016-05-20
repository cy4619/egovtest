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
    		height: 26px;
    	}
    </style>
    <script src="<c:url value="/plugin/axisj-1.1.2/jquery/jquery-.min.js"/>"></script>
    <script src="<c:url value="/plugin/axisj-1.1.2/dist/AXJ.all.js"/>"></script>
    
	<script type="text/javascript">
    var page_menu_id = "m020201";
    </script>
    <script type="text/javascript">
    var myMenu = new AXTopDownMenu();
    
    var fnObj = {
            pageStart: function(){
			    myMenu.setConfig({
			       menuBoxID:"ax-top-menu",        //{string} - 메뉴타겟 엘리먼트 아이디
			       parentMenu:{
			           className:"parentMenu"  //[string] - 1단계 메뉴의 CSS 클래스
			       },
			       childMenu:{
			           className:"childMenu",  //[String] - 2단계 메뉴의 CSS 클래스
			           align:"center",         //[string] - ('left'|'center'|'right')
			           valign:"top",           //[string] - ('top'|'bottom')
			           margin:{top:0, left:0},     //[object] - {top:0, left:0}|{bottom:0, left:0}
			           arrowClassName:"varrow2",   //[String] - 2단계 메뉴의 박스 화살표 CSS 클래스
			           arrowMargin:{top:1, left:0} //[object] - {top:0, left:0}|{bottom:0, left:0}
			       },
			       childsMenu:{
			           className:"childsMenu", //[String] - 3단계 메뉴 이상의 CSS 클래스
			           align:"left",           //[string] - ('left'|'center'|'right')
			           valign:"top",           //[string] - ('top'|'bottom')
			           margin:{top:-4, left:0},        //[object] - {top:0, left:0}|{bottom:0, left:0}
			           arrowClassName:"harrow",        //[String] - 3단계 메뉴의 박스 화살표 CSS 클래스
			           arrowMargin:{top:13, left:1}    //[object] - {top:0, left:0}|{bottom:0, left:0}
			       }
			   });
            }
    }
   $(document).ready(fnObj.pageStart);
    </script>
    
    <%-- <script src="<c:url value="/plugin/axu-1.1.1/theme/Barracks-cacao/admin/resource/admin.js"/>"></script> --%>
    <script type="text/javascript">
    var fnObj = {
        pageStart: function(){
            this.search.bind();
            this.grid.bind();
            this.modal.bind();
            this.bindEvent();
        },
        bindEvent: function(){
            var _this = this;
            axdom("#ax-search-btn-search").bind("click", function(){
                _this.search.submit();
            });
        },
        search: {
            target: new AXSearch(),
            get: function(){ return this.target },
            bind: function(){
                var _this = this;
                this.target.setConfig({
                    targetID:"page-search-box",
                    theme : "AXSearch",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    onsubmit: function(){
                        // 버튼이 선언되지 않았거나 submit 개체가 있는 경우 발동 합니다.
                    },
                    rows:[
                        {display:false, addClass:"gray", style:"", list:[
                            {label:"공개설정", labelWidth:"100", type:"link", width:"", key:"openType", addClass:"", valueBoxStyle:"", value:"open",
                                options:[
                                    {optionValue:"all", optionText:"전체보기"},
                                    {optionValue:"open", optionText:"공개"},
                                    {optionValue:"close", optionText:"비공개"},
                                    {optionValue:"close2", optionText:"비공개2", display:false},
                                    {optionValue:"close3", optionText:"비공개3", display:false},
                                    {optionValue:"close4", optionText:"비공개4", display:false}
                                ],
                                onChange: function(selectedObject, value){
                                    //아래 3개의 값을 사용 하실 수 있습니다.
                                    dialog.push(Object.toJSON(this));
                                    dialog.push(Object.toJSON(selectedObject));
                                    dialog.push(value);
                                }
                            }
                        ]},
                        {display:true, addClass:"", style:"", list:[
                            {label:"검색어", labelWidth:"100", type:"selectBox", width:"", key:"selectbox", addClass:"", valueBoxStyle:"", value:"close",
                                options:[{optionValue:"all", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                AXBind:{
                                    type:"select", config:{
                                        onChange:function(){
                                            //toast.push(Object.toJSON(this));

                                        }
                                    }
                                }
                            },
                            {label:"", labelWidth:"", type:"inputText", width:"150", key:"inputText", addClass:"secondItem", valueBoxStyle:"padding-left:0px;", value:"ABCD",
                                onChange: function(changedValue){
                                    //아래 2개의 값을 사용 하실 수 있습니다.
                                    dialog.push(Object.toJSON(this));
                                    //dialog.push(changedValue);
                                }
                            }
                        ]},
                        {display:false, addClass:"", style:"", list:[
                            {label:"체크박스류", labelWidth:"100", type:"checkBox", width:"", key:"checkbox", addClass:"asfasd", valueBoxStyle:"", value:"open,close",
                                options:[{optionValue:"all", optionText:"전체보기", title:"체크박스"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                onChange: function(selectedObject, value){
                                    //아래 3개의 값을 사용 하실 수 있습니다.
                                    dialog.push(Object.toJSON(this));
                                    dialog.push(Object.toJSON(selectedObject));
                                    dialog.push(value);
                                }
                            },
                            {label:"라디오류", labelWidth:"100", type:"radioBox", width:"", key:"radiobox", addClass:"secondItem", valueBoxStyle:"", value:"close",
                                options:[{optionValue:"all", optionText:"전체보기", title:"라디오타이틀"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                onChange: function(selectedObject, value){
                                    //아래 3개의 값을 사용 하실 수 있습니다.
                                    dialog.push(Object.toJSON(this));
                                    dialog.push(Object.toJSON(selectedObject));
                                    dialog.push(value);
                                }
                            }
                        ]},
                        {display:false, addClass:"", style:"", list:[
                            {label:"생각없이만들기", labelWidth:"100", type:"checkBox", width:"", key:"checkbox3", addClass:"", valueBoxStyle:"", value:"",
                                options:[{optionValue:"", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                onChange: function(){}
                            },
                            {label:"", labelWidth:"", type:"radioBox", width:"", key:"radiobox3", addClass:"secondItem", valueBoxStyle:"", value:"",
                                options:[{optionValue:"", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                onChange: function(){}
                            }
                        ]}
                    ]
                });
            },
            submit: function(){
                var pars = this.target.getParam();
                toast.push("콘솔창에 파라미터 정보를 출력하였습니다.");
                trace(pars);
            }
        },
        grid: {
            target: new AXGrid(),
            get: function(){ return this.target },
            bind: function(){

                this.target.setConfig({
                    targetID : "page-grid-box",
                    theme : "AXGrid",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    colGroup : [
                        {key:"no", label:"번호", width:"40", align:"center", formatter:"money"},
                        {key:"title", label:"제목", width:"200"},
                        {key:"writer", label:"작성자", width:"90", align:"center"},
                        {key:"regDate", label:"작성일", width:"90", align:"center"},
                        {key:"desc", label:"비고", width:"*"}
                    ],
                    view: {
                        label:true,
                        column: [ // col 은 4
                            {key:"title", label:"제목", col:4, addClass:"underLine"},
                            {key:"no", label:"번호", col:1},
                            {key:"desc", label:"비고", col:3},
                            {key:"writer", label:"작성자"},
                            {key:"regDate", label:"작성일"},
                            {key:"", label:"사용자연산", formatter: function(){
                                return (this.item.no * 987).money();
                            }}
                        ],
                        buttons: [
                            {addClass:"handle", onclick:function(){
                                toast.push("handle Click");
                                trace(this.item);
                            }}
                        ]
                    },
                    body : {
                        onclick: function(){
                            //toast.push(Object.toJSON({index:this.index, item:this.item}));
                            //alert(this.list);
                            //alert(this.page);
                            fnObj.modal.open("gridView", this.item);
                        }
                    },
                    page:{
                        paging:true,
                        pageNo:1,
                        pageSize:100,
                        status:{formatter: null}
                    }
                });

                this.target.setList({
                    ajaxUrl:"data/loadGrid.php", ajaxPars:"param1=1&param2=2", onLoad:function(){
                        //trace(this);
                    }
                });
            }
        },
        modal: {
            target: new AXModal(),
            get: function(){ return this.target },
            bind: function(){
                window.myModal = this.target;
                this.target.setConfig({
                    windowID:"myModalContainer",
                    mediaQuery: {
                        mx:{min:0, max:767}, dx:{min:767}
                    },
                    displayLoading:true
                });
            },
            open: function(type, item){
                this.target.open({
                    url:"modal.php",
                    pars:"a=1&b=2&c=3".queryToObject(),
                    top:100, width:600,
                    closeByEscKey:true
                });
            }
        }
    };
    </script>
</head>
<body>
	<div id="AXPage">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="content" />
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>