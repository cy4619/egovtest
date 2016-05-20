/**
 * Created by tom on 2014. 5. 19..
 */

var topMenu_data = [
	{_id:"m01", label:"대시보드", url:"index.html"},
	{_id:"m02", label:"컨텐츠페이지", url:"#ax", cn:[
		{_id:"m0201", label:"서브페이지", url:"#ax"},
		{_id:"m0202", label:"서브페이지 두번째", url:"#ax", cn:[
			{_id:"m020201", label:"서브페이지 1-0", url:"content.html"},
			{_id:"m020202", label:"서브페이지 1-1", url:"content.html"},
			{_id:"m020203", label:"서브페이지 1-2", url:"content.html"}
		]},
		{_id:"m0203", label:"서브페이지 세번째", url:"content.html"}
	]},
	{_id:"m03", label:"레이아웃", url:"content.html"},
	{_id:"m04", label:"페이지", url:"content.html"},
	{_id:"m05", label:"사이트맵", url:"content.html"},
	{_id:"m06", label:"모듈", url:"content.html"},
	{_id:"m07", label:"접속통계", url:"content.html"}
];
var sideMenu_data = [
	{label:'<i class="fa fa-windows"></i> 대시보드', url:"index.html", target:"_self"},
	{label:'<i class="fa fa-asterisk"></i> 관리자설정', url:"content.html", target:"_self"},
	{label:'<i class="fa fa-columns"></i> 레이아웃', url:"content.html", target:"_self"},
	{label:'<i class="fa fa-pagelines"></i> 페이지', url:"content.html", target:"_self"},
	{label:'<i class="fa fa-sitemap"></i> 사이트맵', url:"content.html", target:"_self"},
	{label:'<i class="fa fa-archive"></i> 모듈', url:"content.html", target:"_self"},
	{label:'<i class="fa fa-bar-chart-o"></i> 접속통계', url:"content.html", target:"_self"}
];

var topMenu = new AXTopDownMenu();
var mobileMenu = new AXMobileMenu();
var loginInfoModal = new AXMobileModal();
var fcObj = {
	pageStart: function(){
		fcObj.bindEvent();
		fcObj.bindTopMenu();
		fcObj.bindSideMenu();
		try {
			fnObj.pageStart();
		}catch(e){

		}
	},
	pageResize: function(){
		fcObj.setAsideMenu();
	},
	setAsideMenu: function(){
		if(!jQuery(".ax-aside-box").data("status")){
			if(axf.clientWidth() <= 1024 && axf.clientWidth() >= 767){
				jQuery(".ax-aside-menu").addClass("on");
				jQuery(".ax-aside-box").hide();
			}else if(axf.clientWidth() > 1024){
				jQuery(".ax-aside-menu").removeClass("on");
				jQuery(".ax-aside-box").show();
			}
		}
	},
	bindEvent: function(){
		fcObj.setAsideMenu();

		axdom(".AXCheckbox").find("input").bind("click", function(){
			if(this.checked)this.checked = true;else this.checked = false;
			if(jQuery(this).parent().hasClass("checked")) jQuery(this).parent().removeClass("checked");
			else jQuery(this).parent().addClass("checked");
		});

		axdom(".ax-aside-menu").bind("click", function(){
			var elem = jQuery(".ax-aside-box");
			elem.toggle();
			if ( elem.css('display')=='none' ) {
				elem.data("status", "open");
				jQuery(".ax-content").addClass("expand");
				jQuery(".ax-aside-menu").addClass("on");
			}else{
				elem.data("status", "close");
				jQuery(".ax-content").removeClass("expand");
				jQuery(".ax-aside-menu").removeClass("on");
			}
			axdom(window).resize();
		});
	},
	bindTopMenu: function(){
		topMenu.setConfig({
			targetID:"ax-top-menu",
			parentMenu:{
				className:"parentMenu"
			},
			childMenu:{
				className:"childMenu",
				hasChildClassName:"expand", // script 방식에서만 지원 됩니다.
				align:"center",
				valign:"top",
				margin:{top:0, left:0},
				arrowClassName:"varrow2",
				arrowMargin:{top:1, left:0}
			},
			childsMenu:{
				className:"childsMenu",
				hasChildClassName:"expand",
				align:"left",
				valign:"top",
				margin:{top:-4, left:0},
				arrowClassName:"harrow",
				arrowMargin:{top:13, left:1}
			},
			onComplete: function(){
				if(window.page_menu_id) topMenu.setHighLightOriginID( window.page_menu_id );
			}
		});
		topMenu.setTree(topMenu_data);


		axdom("#mx-top-menu-handle").bind("click", function(){
			mobileMenu.open();
		});

		mobileMenu.setConfig({
			reserveKeys:{
				primaryKey:"parent_srl",
				labelKey:"label",
				urlKey:"link",
				targetKey:"target",
				addClassKey:"ac",
				subMenuKey:"cn"
			},
			onclick: function(){ // 메뉴 클릭 이벤트
				mobileMenu.close();
				location.href = this.url;
			}
		});
		mobileMenu.setTree(topMenu_data);


		loginInfoModal.setConfig({
			width:300, height:160,
			head:{
				close:{
					onclick:function(){

					}
				}
			},
			onclose: function(){
				trace("close bind");
			}
		});
		axdom("#mx-loginfo-handle").bind("click", function(){
			var obj = loginInfoModal.open();
			obj.modalHead.html( '<div class="modal-log-info-title">Login Info</div>' );
			obj.modalBody.html( '<div class="modal-log-info-wrap"><ul class="ax-loginfo">' + axdom("#ax-loginfo").html() + '</ul><div style="clear:both;"></div></div>' );
		});

	},
	bindSideMenu: function(){
		var po = [], _target = axdom("#ax-aside-ul");
		for(var mi=0;mi<sideMenu_data.length;mi++){
			po.push('<li><a href="'+ sideMenu_data[mi].url +'" target="'+ sideMenu_data[mi].target +'">');
				po.push(sideMenu_data[mi].label);
			po.push('</a></li>')
		}
		_target.empty();
		_target.append(po.join(''));
	}
};
jQuery(document).ready(fcObj.pageStart.delay(0.1));
jQuery(window).resize(fcObj.pageResize);