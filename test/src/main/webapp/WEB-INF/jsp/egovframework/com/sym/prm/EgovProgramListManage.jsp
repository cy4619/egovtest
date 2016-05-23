<script type="text/javascript">

/* Program Grid */
	var progrmListCallAjax = function(pageNo,searchKeyword){
			$.ajax({
			    url : '/sym/prm/EgovProgramListManageSelect.do',
			    data : {
			    	pageIndex : pageNo,
			    	searchKeyword : $('#searchKeyword').val()
			    },
			    dataType : 'JSON',
			    type : 'POST' ,
			    success : function (res) {
			    	mask.close();
			    	var gridData={
			    			list:res.data.list,
			    		    page:{
			    		        pageNo: res.paginationInfo.currentPageNo,
			    		        pageSize: res.paginationInfo.pageSize,
			    		        pageCount: res.paginationInfo.totalPageCount,
			    		        listCount: res.paginationInfo.totalRecordCount,
			    		        onchange: function(pageNo){
			    		        	mask.open();
			    		            //dialog.push(Object.toJSON(this));
			    		        	progrmListCallAjax(pageNo,searchKeyword);	
			    		        }
			    		    }
			    	}
			    	progrmGrid.setData(gridData);
			    }
			});
	}

	var pageID = "editor";
	var progrmGridObj = {
		pageStart : function() {
			progrmGridObj.grid.bind();
		},
		grid : {
			target : new AXGrid(),
			bind : function() {
				window.progrmGrid = progrmGridObj.grid.target;

				progrmGrid.setConfig({
					targetID : "PrgListGridTarget",
	                passiveMode:true,
	                passiveRemoveHide:false,
					sort : false,
					fixedColSeq : 1,
					fitToWidth:true,
					colGroup : [
                    {
                        key:"no", label:"checkbox", width:"30", align:"center", formatter:"checkbox"
                    },
                    {
                        key: "_CUD", label: "상태", width: "50", align: "center"
                    },
					{
						key : "progrmFileNm",
						label : "프로그램명(영문명)",
						width : "200",
						editor: {
							type : "text",
							updateEdit : false,
							notEmpty: true,
							engOnly: true,
							updateWith: ["_CD"]
						}
					}, {
						key : "progrmKoreanNm",
						label : "프로그램명(한글명)",
						width : "200",
						editor: {
							type : "text",
							notEmpty: true,
							updateWith: ["_CUD"]
						}
					}, {
						key : "progrmStrePath",
						label : "프로그램경로",
						width : "200",
						editor: {
							type : "text",
							notEmpty: true,
							updateWith: ["_CUD"]
						}
					}, {
						key : "url",
						label : "URL",
						width : "200",
						editor: {
							type : "text",
							notEmpty: true,
							updateWith: ["_CUD"]
						}
					} ],
					colHeadAlign : "center", // 헤드의 기본 정렬 값 ( colHeadAlign 을 지정하면 colGroup 에서 정의한 정렬이 무시되고 colHeadAlign : false 이거나 없으면 colGroup 에서 정의한 속성이 적용됩니다.
					body : {
	                    addClass: function(){
	                        if(this.item._CUD == "C"){
	                            return "blue";
	                        }else if(this.item._CUD == "D"){
	                            return "red";
	                        }else if(this.item._CUD == "U"){
	                            return "green";
	                        }else{
	                            return "";
	                        }
	                    },
						onclick : function() {
							//toast.push(Object.toJSON({ "event": "click", "index": this.index, "r": this.r, "c": this.c, "item": this.item }));
							//progrmGrid.validateCheck('U');
							//mask.open(); // 열기 명령
/* 							mask.blink([
								{css:{opacity: "0.1"}, time:500},
								{css:{opacity: "0.8"}, time:500}
							]); */
							//mask.close(); // 닫기 명령
							//trace(this.index);
						}
					},
					page : {
				        paging  : true // {Boolean} -- 페이징 사용여부를 설정합니다.
					},
	                filter:function(id){
	                    return true;
		            }
				});
				
				
				progrmListCallAjax(1);
				//progrmGrid.validateCheck('C');
				//progrmGridObj.grid.selectItemList(1);
			},
			getExcel : function(type) {
				var obj = progrmGrid.getExcelFormat(type, function() {
					return this.key != "no" && this.key != "finder";
				});
				$("#printout").html(obj);
			},
			getSelectedItem : function() {
			},
			append : function() {
				//추가버튼 클릭시 이벤트
				this.target.pushList({
					progrmFileNm : "",
					progrmKoreanNm : "",
					progrmStrePath : "",
					url : ""
				});
				this.target.setFocus(this.target.list.length - 1);
			},
			remove : function() {
				//삭제버튼 클릭시 이벤트
				var checkedList=[];
				checkedList.push(this.target.getSelectedItem());
				this.target.removeListIndex(checkedList);
			},
			submit : function(){
				//적용버튼 클릭시 이벤트
				
				//유효성검증
				if(progrmGrid.validateCheck('U') && progrmGrid.validateCheck('C')){
					//적용이벤트
					 axConfirm("변경내역을 적용하시겠습니까?", function(data){
	        			if (data == "Y") { 
	        				console.log(progrmGrid.list)
	        				return;
	        			}
					 });
				}
			}
		}
	};
	/* Program Grid End */
	
	/* AuthorRole Grid */
		var authorRoleListCallAjax = function(pageNo,searchKeyword){
			$.ajax({
			    url : '/sec/ram/EgovAuthorRoleList.do',
			    data : {
			    	pageIndex : pageNo,
			    	searchKeyword : $('#searchKeyword').val()
			    },
			    dataType : 'JSON',
			    type : 'POST' ,
			    success : function (res) {
			    	mask.close();
			    	var gridData={
			    			list:res.data.list,
			    		    page:{
			    		        pageNo: res.paginationInfo.currentPageNo,
			    		        pageSize: res.paginationInfo.pageSize,
			    		        pageCount: res.paginationInfo.totalPageCount,
			    		        listCount: res.paginationInfo.totalRecordCount,
			    		        onchange: function(pageNo){
			    		        	mask.open();
			    		            //dialog.push(Object.toJSON(this));
			    		        	authorRoleListCallAjax(pageNo,searchKeyword);	
			    		        }
			    		    }
			    	}
			    	authorRoleGrid.setData(gridData);
			    }
			});
	}

	var authorRoleGridObj = {
		pageStart : function() {
			authorRoleGridObj.grid.bind();
		},
		grid : {
			target : new AXGrid(),
			bind : function() {
				window.authorRoleGrid = authorRoleGridObj.grid.target;

				authorRoleGrid.setConfig({
					targetID : "AuthorRoleGridTarget",
	                passiveMode:true,
	                passiveRemoveHide:false,
					sort : false,
					fixedColSeq : 1,
					fitToWidth:true,
					colGroup : [
                    {
                        key:"no", label:"checkbox", width:"30", align:"center", formatter:"checkbox"
                    },
                    {
                        key: "_CUD", label: "상태", width: "50", align: "center"
                    },
					{
						key : "roleCode",
						label : "롤코드",
						width : "200",
						editor: {
							type : "text",
							updateEdit : false,
							notEmpty: true,
							engOnly: true,
							updateWith: ["_CD"]
						}
					}, {
						key : "roleNm",
						label : "롤명",
						width : "200",
						editor: {
							type : "text",
							notEmpty: true,
							updateWith: ["_CUD"]
						}
					}, {
						key : "rolePtn",
						label : "롤패턴",
						width : "200",
						editor: {
							type : "text",
							notEmpty: true,
							updateWith: ["_CUD"]
						}
					}
					],
					colHeadAlign : "center", // 헤드의 기본 정렬 값 ( colHeadAlign 을 지정하면 colGroup 에서 정의한 정렬이 무시되고 colHeadAlign : false 이거나 없으면 colGroup 에서 정의한 속성이 적용됩니다.
					body : {
	                    addClass: function(){
	                        if(this.item._CUD == "C"){
	                            return "blue";
	                        }else if(this.item._CUD == "D"){
	                            return "red";
	                        }else if(this.item._CUD == "U"){
	                            return "green";
	                        }else{
	                            return "";
	                        }
	                    },
						onclick : function() {
						}
					},
					page : {
				        paging  : true // {Boolean} -- 페이징 사용여부를 설정합니다.
					},
	                filter:function(id){
	                    return true;
		            }
				});
				
				
				authorRoleListCallAjax(1);
				//authorRoleGrid.validateCheck('C');
				//authorRoleGridObj.grid.selectItemList(1);
			},
			getExcel : function(type) {
				var obj = authorRoleGrid.getExcelFormat(type, function() {
					return this.key != "no" && this.key != "finder";
				});
				$("#printout").html(obj);
			},
			getSelectedItem : function() {
			},
			append : function() {
				//추가버튼 클릭시 이벤트
				this.target.pushList({
					roleCode : "",
					roleNm : "",
					rolePtn : ""
				});
				this.target.setFocus(this.target.list.length - 1);
			},
			remove : function() {
				//삭제버튼 클릭시 이벤트
				var checkedList=[];
				checkedList.push(this.target.getSelectedItem());
				this.target.removeListIndex(checkedList);
			},
			submit : function(){
				//적용버튼 클릭시 이벤트
				
				//유효성검증
				if(authorRoleGrid.validateCheck('U') && authorRoleGrid.validateCheck('C')){
					//적용이벤트
					 axConfirm("변경내역을 적용하시겠습니까?", function(data){
	        			if (data == "Y") { 
	        				console.log(authorRoleGrid.list)
	        				return;
	        			}
					 });
				}
			}
		}
	};
	/* Author Grid End */
	
	
	jQuery(document.body).ready(function() {
		progrmGridObj.pageStart();
		authorRoleGridObj.pageStart();
	});
</script>
			<div class="ax-layer ax-title">
				<div class="ax-col-12 ax-content">
					<h1>대시보드</h1>
					<p class="desc">웹 사이트의 전체적인 상황을 추척하고 보여줍니다.</p>
				</div>
				<div class="ax-clear"></div>
			</div>

			<div class="ax-layer">
				<div class="ax-col-12 ax-content">

					<!-- s.CXPage -->
					<div id="CXPage">
						<div class="ax-layer">
							<div class="ax-col-12">
								<div class="ax-unit">
									<div class="ax-box">
										<div class="ax-box-wrap">
										         <div class="AXSearch dx">
													<div class="searchGroup">
															<span>프로그램명</span>
															<input type="text" name="searchKeyword" title="" placeholder="" value="" class="AXInput searchInputTextItem" id="searchKeyword">
															<button type="button" class="AXButton Blue" id="ax-search-btn-search" onclick="progrmListCallAjax('1');"><i class="axi axi-ion-android-search"></i> 검색</button>
																    	<button type="button" class="AXButton Blue" onclick="progrmGridObj.grid.append();"><i class="axi axi-plus-circle"></i>추가</button> 
																        <button type="button" class="AXButton Green" id="ax-grid-btn-regist" onclick="progrmGridObj.grid.submit();"><i class="axi axi-bmg-value-fit"></i>적용</button>
																        <button type="button" class="AXButton Red" onclick="progrmGridObj.grid.remove();"><i class="axi axi-minus-circle"></i> 삭제</button>
																    <div class="ax-clear"></div>
														</div>
												</div>
												<div id="PrgListGridTarget"></div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="ax-col-12">
								<div class="ax-unit">
									<div class="ax-box">
										<div class="ax-box-wrap">
<!-- 												 <div class="AXSearch dx">
													<div class="searchGroup">
															<span>프로그램명</span>
															<input type="text" name="searchKeyword" title="" placeholder="" value="" class="AXInput searchInputTextItem" id="searchKeyword">
															<button type="button" class="AXButton Blue" id="ax-search-btn-search" onclick="progrmListCallAjax('1');"><i class="axi axi-ion-android-search"></i> 검색</button>
																    	<button type="button" class="AXButton Blue" onclick="progrmGridObj.grid.append();"><i class="axi axi-plus-circle"></i>추가</button> 
																        <button type="button" class="AXButton Green" id="ax-grid-btn-regist" onclick="progrmGridObj.grid.submit();"><i class="axi axi-bmg-value-fit"></i>적용</button>
																        <button type="button" class="AXButton Red" onclick="progrmGridObj.grid.remove();"><i class="axi axi-minus-circle"></i> 삭제</button>
																    <div class="ax-clear"></div>
														</div>
												</div> -->
												<div class="AXSearch dx">
													<div class="searchGroup">
														<span>권한명</span>
													</div>
												</div>
												<div id="AuthorRoleGridTarget"></div>
										</div>
									</div>
								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>



