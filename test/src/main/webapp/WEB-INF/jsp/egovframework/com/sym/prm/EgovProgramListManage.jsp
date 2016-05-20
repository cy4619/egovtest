<script type="text/javascript">
	/**
	 * Require Files for AXISJ UI Component...
	 * Based        : jQuery
	 * Javascript    : AXJ.js, AXGrid.js, AXInput.js, AXSelect.js
	 * CSS            : AXJ.css, AXGrid.css, AXButton.css, AXInput.css, AXSelect.css
	 */
	var pageID = "editor";
	var fnGridObj = {
		pageStart : function() {
			fnGridObj.grid.bind();
		},
		grid : {
			target : new AXGrid(),
			bind : function() {
				window.progrmGrid = fnGridObj.grid.target;

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
							console.log(progrmGrid.validateCheck('C'));
							progrmGrid.validateCheck('U');
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
		            }/* ,
		            selectList : function(pageNo,searchKeyword){
		 				$.ajax({
		 				    url : '/sym/prm/EgovProgramListManageSelect.do',
		 				    data : {
		 				    	pageIndex : pageNo,
		 				    	searchKeyword : searchKeyword
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
		 				    		        	callAjax(pageNo);	
		 				    		        }
		 				    		    }
		 				    	}
		 				    	progrmGrid.setData(gridData);
		 				    }
		 				});
		            } */
				});
				console.log(progrmGrid)
				console.log(fnGridObj);
				//progrmGrid.selectList(1,'');
				
 				var callAjax = function(pageNo,searchKeyword){
	 				$.ajax({
	 				    url : '/sym/prm/EgovProgramListManageSelect.do',
	 				    data : {
	 				    	pageIndex : pageNo,
	 				    	searchKeyword : searchKeyword
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
	 				    		        	callAjax(pageNo);	
	 				    		        }
	 				    		    }
	 				    	}
	 				    	progrmGrid.setData(gridData);
	 				    }
	 				});
				}
				callAjax(1);
				//progrmGrid.validateCheck('C');
				//fnGridObj.grid.selectItemList(1);

			},
			getExcel : function(type) {
				var obj = progrmGrid.getExcelFormat(type, function() {
					return this.key != "no" && this.key != "finder";
				});
				$("#printout").html(obj);
			},
			getSelectedItem : function() {
				trace(this.target.getSelectedItem());
				toast.push('콘솔창에 데이터를 출력하였습니다.');
			},
			append : function() {
				this.target.pushList({
					progrmFileNm : "",
					progrmKoreanNm : "",
					progrmStrePath : "",
					url : ""
				});
				this.target.setFocus(this.target.list.length - 1);
			},
			remove : function() {
				var checkedList = progrmGrid.getCheckedListWithIndex(0);// colSeq
				if (checkedList.length == 0) {
					alert("선택된 목록이 없습니다. 삭제하시려는 목록을 체크하세요");
					return;
				}
				this.target.removeListIndex(checkedList);
				// 전달한 개체와 비교하여 일치하는 대상을 제거 합니다. 이때 고유한 값이 아닌 항목을 전달 할 때에는 에러가 발생 할 수 있습니다.
			},
			submit : function(){
				
			},
			selectItemList : function(pageNo){
 				console.log(progrmGrid);
				console.log("test")
	 				$.ajax({
 				    url : '/sym/prm/EgovProgramListManageSelect.do',
 				    data : {
 				    	pageIndex : pageNo,
 				    	searchKeyword : searchKeyword
 				    },
 				    dataType : 'JSON',
 				    type : 'POST' ,
 				    success : function (res) {
 				    	var gridData={
 				    			list:res.data.list,
 				    		    page:{
 				    		        pageNo: res.paginationInfo.currentPageNo,
 				    		        pageSize: res.paginationInfo.pageSize,
 				    		        pageCount: res.paginationInfo.totalPageCount,
 				    		        listCount: res.paginationInfo.totalRecordCount,
 				    		        onchange: function(pageNo){
 				    		            //dialog.push(Object.toJSON(this));
 				    		        	progrmGrid.selectItemList(pageNo);	
 				    		        }
 				    		    }
 				    	}
 				    	progrmGrid.setData(gridData);
 				    }
 				});
			}
		}
	};
	jQuery(document.body).ready(function() {
		fnGridObj.pageStart();
		//fnGridObj.grid.selectItemList(1);
		//fnGridObj.grid.callAjax(1)
	});
</script>

<div class="ax-body">
	<div class="ax-wrap">
		<div class="ax-layer ax-title">
			<div class="ax-col-12 ax-content">
				<h1>프로그램</h1>
				<p class="desc">프로그램관리</p>
			</div>
			<div class="ax-clear"></div>
		</div>
		<div class="ax-layer">
			<div class="ax-col-12 ax-content">

				<div id="CXPage">
					<div class="ax-layer">
						<div class="ax-col-12">
							<div class="ax-unit">
								<div class="ax-box">
									<div>
										<!-- <div id="demoPageTabTarget" class="AXdemoPageTabTarget"></div> -->
										<div class="AXdemoPageContent">
												<h2>AXGrid</h2>
<!-- 												<div style="padding: 10px;">
													<input type="button" value="forExcel html with filter"
														class="AXButton" onclick="fnGridObj.grid.getExcel('html');" />
												</div> -->
												<div class="AXSearch dx">
													<div class="searchGroup">
														<div class="ax-col-6">
															<span>프로그램명</span>
															<input type="text" name="searchKeyword" title="" placeholder="" value="" class="AXInput searchInputTextItem" id="searchKeyword">
															<button type="button" class="AXButton Blue" id="ax-search-btn-search" onclick="fnGridObj.callAjax(1,'searchKeyword.value')"><i class="axi axi-ion-android-search"></i> 검색</button>
														</div>
														<div class="ax-col-6">
														<div class="right">
																    	<button type="button" class="AXButton Blue" onclick="fnGridObj.grid.append();"><i class="axi axi-plus-circle"></i>추가</button> 
																        <button type="button" class="AXButton Green" id="ax-grid-btn-regist"><i class="axi axi-bmg-value-fit"></i>적용</button>
																        <button type="button" class="AXButton Red" onclick="fnGridObj.grid.remove();"><i class="axi axi-minus-circle"></i> 삭제</button>
																    <!-- <div class="ax-clear"></div> -->
														</div>
														</div>
													</div>
												</div>

												<div id="PrgListGridTarget" style="height: 300px;"></div>
<!-- 												<div style="padding: 10px;">
													<input type="button" value="getSelectedItem"
														class="AXButton" onclick="fnGridObj.grid.getSelectedItem();" />
													<input type="button" value="추가하기" class="AXButton Red"
														onclick="fnGridObj.grid.append();" /> <input type="button"
														value="삭제하기" class="AXButton Red"
														onclick="fnGridObj.grid.remove();" />
												</div> -->

										</div>
									</div>
								</div>
								<!-- ax-box -->
							</div>
							<!-- ax-unit -->
						</div>
						<!-- ax-col-12 -->
					</div>
					<!-- ax-layer -->
				</div>
				<!-- CXPage -->
				
			</div>
		</div>
	</div>
</div>