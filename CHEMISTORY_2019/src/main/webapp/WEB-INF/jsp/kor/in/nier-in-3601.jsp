<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/assets/kor/js/jquery.blockUI.js"></script>
<script type="text/javascript">
$(function() {
	<c:if test="${not empty param.pos}">
		showpage('<c:out value='${param.pos}'/>',0);
	</c:if>
	<c:if test="${empty param.pos}">
	init();
	</c:if>
	
});
function showpage(fileNm , num){
	  var url = "/showorg.do";
	  $.ajax({
          type: 'post'
        , data : {fileNm:fileNm,num:num}
        , url: url
        , dataType : 'html'
       	,beforeSend : function(){
       		$.blockUI({ 
       			message: ''
       			//message: '<img src="/assets/kor/js/dist/img/theme/jennifer/xtable-loading.gif" alt="잠시만기다려주세요." />',
       			/* css: { 
       	        border: 'none', 
       	        padding: '15px', 
       	        backgroundColor: '#000', 
       	        '-webkit-border-radius': '10px', 
       	        '-moz-border-radius': '10px', 
       	        opacity: .5, 
       	        color: '#fff' } */
       	      }); 
   		}
        , success: function(data) {
        	$('#showorg').html(data);
        	$('#contents').hide();
        	$('#showorg').show();
        	$.unblockUI();
        }
  });	
}
function init(){
  	$('#contents').show();
  	$('#showorg').hide();
}
</script>
<div id="contents" style="display:none;">	
	<div class="organGraph clearfix">
    	<div class="level1">원장</div>
        <ul class="level2 left">
        	<li><a href="javascript:showpage('orgDept1',0)">연구지원과</a></li>
            <li><a href="javascript:showpage('orgDept2',0)">연구전략기획과</a></li>
        </ul>
        <ul class="level2 right">
        	<li><a href="javascript:showpage('orgDept8',0)">교통환경연구소</a></li>
            <li><a href="javascript:showpage('orgDept9',0)">4대강물환경연구소</a></li>
            <li><a href="javascript:showpage('orgDept10',0)">국립습지센터</a></li>
        </ul>
        <ul class="level3">
        	<li>
            	<dl>
                	<dt><a href="javascript:showpage('orgDept3',0)">환경건강<br />연구부</a></dt>
                    <dd><a href="javascript:showpage('orgDept3',1)">환경보건연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept3',2)">위해성평가연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept3',3)" class="team">화학물질등록평가팀</a></dd>
                    <dd><a href="javascript:showpage('orgDept3',4)">화학물질연구과</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
                	<dt><a href="javascript:showpage('orgDept4',0)">기후대기<br />연구부</a></dt>
                    <dd><a href="javascript:showpage('orgDept4',1)">대기환경연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept4',2)">지구환경연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept4',3)">대기공학연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept4',4)">대기질통합예보센터</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
                	<dt><a href="javascript:showpage('orgDept5',0)">물환경<br />연구부</a></dt>
                    <dd><a href="javascript:showpage('orgDept5',1)">유역총량연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept5',2)">물환경공학연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept5',3)" class="team">유역생태연구팀</a></dd>
                    <dd><a href="javascript:showpage('orgDept5',4)">물환경평가연구과</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
                	<dt><a href="javascript:showpage('orgDept6',0)">환경자원<br />연구부</a></dt>
                    <dd><a href="javascript:showpage('orgDept6',1)">자원순환연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept6',2)">폐자원에너지연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept6',3)">자연환경연구과</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
                	<dt><a href="javascript:showpage('orgDept7',0)">환경기반<br />연구부</a></dt>
                    <dd><a href="javascript:showpage('orgDept7',1)">생활환경연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept7',2)">상하수도연구과</a></dd>
                    <dd><a href="javascript:showpage('orgDept7',4)">환경측정분석센터</a></dd>
                    <dd><a href="javascript:showpage('orgDept7',3)">토양지하수연구과</a></dd>
                </dl>
            </li>
        </ul>
    </div><!--//organGraph-->
    <div class="organTotal clearfix">
    	<div class="total1">
        	<h2>인력구성</h2>
        	- 연구직 : 250명 <br />
- 기술·행정직 등 : 73명<br />
- 전문위원 등 : 523명
        </div>
        <div class="total2">
        	<h2>근무지별 직원현황</h2>
        	<ul>
            	<li>- 본원 : 552명</li>
                <li>- 금강물환경연구소 : 72명</li>
                <li>- 한강물환경연구소 : 52명</li>
                <li>- 영산강물환경연구소 : 54명</li>
                <li>- 낙동강물환경연구소 : 72명</li>
                <li>- 국립습지센터 : 20명</li>
            </ul>
        </div>
        <div class="totalbox">
        	총원<br /><span>846명</span>
        </div>
    </div><!--//organTotal-->
    
</div>
<!-- //content-body -->
<div id="showorg" style="display:none;">	

</div>