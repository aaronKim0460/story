<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<link rel="stylesheet" href="<c:url value='/css/zTree/zTreeStyle.css' />" type="text/css">

<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.core-3.5.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.excheck-3.5.js' />"></script>

<script language="javascript" type="text/javascript">

	var tempSearchStr = "";
	var searchLength = 0;
	var searchIdx = 0;
	
	var setting = {
		check: {
			enable: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: fnClick
		}	
	};

	var zNodes =[];

	$(document).ready(function(){
		
		// 메뉴 펼치기, 닫기
		$("#btn_expand_t, #btn_expand_f").click(function(){
			
			var expandFlag = $(this).attr("id") == "btn_expand_t" ? true : false;
			
			$.fn.zTree.getZTreeObj("menuTree").expandAll(expandFlag);
		});
		
		// 메뉴명 찾기
		$("#btn_search_menu").click(function(){
			
			var searchStr = $("#searchStr").val();
			
			var zTree = $.fn.zTree.getZTreeObj("menuTree");		
			var nodeList = zTree.getNodesByParamFuzzy("name", searchStr);
			
			if(nodeList.length > 0){
				
				if(tempSearchStr == searchStr){
					searchIdx++;
				}else{
					searchIdx = 0;
				}
				
				if(searchIdx >= nodeList.length){
					searchIdx = 0;
				}
				
				zTree.selectNode(nodeList[searchIdx]);
				
				searchLength = nodeList.length;
				tempSearchStr = searchStr;
				
			}else{
				searchIdx = 0;
				searchLength = 0;
				tempSearchStr = "";
			}
			
			$("#searchStr").focus();
			
		});
		
		// 메뉴명 찾기 엔터 
		$("#searchStr").keyup(function(e){
			
			if(e.keyCode == 13 && $(this).val() != "")$("#btn_search_menu").click();
		});
		
		fnGetMenuTree();
		fnMenuTreeInit();
		
	});
	
	function fnGetMenuTree(){
		var params = {};
		params["searchKeyword"] = "<c:out value='${searchKeyword}'/>"; 
		
		fnGetSyncAjaxData("<c:url value='/sym/mnu/mpm/menuTree.do'/>", params, fnCbSetMenuTree, false, "조회중입니다." );
	} 
	
	function fnCbSetMenuTree(data){
		
		if (data.msg != "Y"){
			alert("메뉴정보를 확인할 수 없습니다.");
			return;
		}
	
		zNodes = new Array(data.resultMap.length);
	
		for (var i = 0; i < data.resultMap.length ;i ++){
	
			zNodes[i] = {
					id:data.resultMap[i].menuNo,
					pId:data.resultMap[i].upperMenuNo,
					name:data.resultMap[i].menuNm
			};
		}
	}
	
	function fnMenuTreeInit(){
		
		$.fn.zTree.init($("#menuTree"), setting, zNodes);
		setCheck();
		$("#py").bind("change", setCheck);
		$("#sy").bind("change", setCheck);
		$("#pn").bind("change", setCheck);
		$("#sn").bind("change", setCheck);
		
		//$.fn.zTree.getZTreeObj("menuTree").expandAll(true);
	}
	

	function setCheck() {
		var zTree = $.fn.zTree.getZTreeObj("menuTree"),
			py = $("#py").attr("checked")? "p":"",
			sy = $("#sy").attr("checked")? "s":"",
			pn = $("#pn").attr("checked")? "p":"",
			n = $("#sn").attr("checked")? "s":"",

		type = { "Y":"ps", "N":"ps"};
		zTree.setting.check.chkboxType = type;
	}
	
	function fnClick(e,treeId, treeNode){
		
		var id = treeNode.id + "";
		
		if(id == ""){
			alert("메뉴번호가 존재하지 않습니다.");
			return;
		}
		
		opener.$("#upperMenuId").val(id);
		
		self.close();
		
	}
	
</script>
</head>
<body style="overflow-x:hidden;overflow-y:auto">

<div class="content-body">
<div class="board-list">
	
	<table class="board-write">
	<caption>메뉴 생성</caption>
		<colgroup>
		    <col style="width:110px;" />
		    <col />
		</colgroup>
	    <tbody>
		<tr>
		    <th class="board-write-th">메뉴명</th>
		    <td class="board-write-td">
		    	<input id="searchStr" name="searchStr" type="text" size="30"  maxlength="30" title="메뉴명" />
		    	<a href="#" id="btn_search_menu" class="btn-sm btn-primary">찾기</a>
		    </td>
		</tr>
		<tr>
		    <th class="board-write-th" valign="top" style="padding-top: 10px;">
		    	<a href="#" id="btn_expand_t" class="btn-sm btn-primary">+</a>
		    	<a href="#" id="btn_expand_f" class="btn-sm btn-warning">-</a>
		    </th>
		    <td class="board-write-td" style="padding-top: 5px; padding-bottom: 5px;">
		    	<div class="zTreeDemoBackground left" style="width:99%;">
					<ul id="menuTree" class="ztree" style="margin:0 auto; overflow-y:auto; height:500px;"></ul>
				</div>
		    </td>
		</tr>
		</tbody>
	</table>
</div>
</div>


</body>
</html>

