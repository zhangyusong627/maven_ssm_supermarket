<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>供应商管理页面</span>
  </div>
  <div class="search">
    <form method="post" action="" >
      <input name="method" value="query" type="hidden"> <span>供应商编码：</span> <input name="procode" type="text" value="" id="procode"> <span>供应商名称：</span>
      <input name="proname" type="text" id="proname"> <input value="查 询" type="button" id="searchbutton"> <a
        href="addProvider.do">添加供应商</a>
    </form>
  </div>
  <!--供应商操作表格-->
  <table class="providerTable" cellpadding="0" cellspacing="0" border="1">
    <tr class="firstTr">
      <th width="10%">供应商编码</th>
      <th width="20%">供应商名称</th>
      <th width="10%">联系人</th>
      <th width="10%">联系电话</th>
      <th width="10%">传真</th>
      <th width="10%">创建时间</th>
      <th width="30%">操作</th>
    </tr>

  </table>
   <p>&nbsp;</p>
    <div id="pageBut" class = "page">
        <ul>
            <li>首页</li>
            <li>上一页</li>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li>下一页</li>
            <li>尾页</li>
        </ul>
    </div>
</div>
</section>
<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
  <div class="removerChid">
    <h2>提示</h2>
    <div class="removeMain">
      <p>你确定要删除该供应商吗？</p>
      <a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
    </div>
  </div>
</div>
<%@include file="common/foot.jsp"%>
<script type="text/javascript" src="statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"> 

 
 $(function() {
	
	var procode =null;
	var proname =null;
	var page =  1; 
	var pagesize =5;
	    getEmpPage(page,pagesize,procode,proname);
	    
	    $("#searchbutton").click(function(){
	    	procode = $("#procode").val();
	    	proname = $("#proname").val();

			getEmpPage(page, pagesize,procode,proname);
		})			
	    
	});


		function getEmpPage(startPage, pageSize,procode,proname) {
		
		    $.post("getAllProvider.do", {
		        "startPage" : startPage,
		        "pageSize" : pageSize,
		        "procode": procode,
		        "proname": proname

		    }, function(data) {
		       
		        var pageSize = data.pageSize;
		        var pageNum = data.pageNum;
		        $("table>tbody>tr:gt(0)").remove();
		        $("#pageBut>ul>li").remove();
		        var str = '<li>首页</li><li>上一页</li>';
		        $.each(data.navigatepageNums, function() {
		            str += '<li>' + this + '</li>';
		        });
		        str += '<li>下一页</li><li>尾页</li>';
		        
		        $("#pageBut>ul").append($(str));
		        $("#pageBut>ul>li:eq("+(startPage-data.firstPage+2)+")").css("background-color","rgb(90,135,168)").siblings().css("background-color","#fff");
		        $(".page>ul>li").css({"float":"left","font-family":"微软黑体","font-size":"20px","margin":"10px","cursor":"pointer"});
		        $(".page>ul").css({"text-indent":"10px"});
		       
		        
		        $("#pageBut>ul>li").click(function() {
		            if ($(this).index() == 0) {//首页
		                getEmpPage(1, pageSize);
		            } else if ($(this).index() == 1) {//上一页
		                if(data.hasPreviousPage){
		                    getEmpPage(pageNum-1, pageSize);
		                }else{
		                    alert("没有了");
		                }
		            } else if ($(this).index() == $("#pageBut>ul>li").length - 2) {//下一页
		                if(data.hasNextPage){
		                    getEmpPage(pageNum+1, pageSize);
		                }else{
		                    alert("没有了");                        
		                }
		            } else if ($(this).index() == $("#pageBut>ul>li").length - 1) {//尾页
		                getEmpPage(data.pages,pageSize);
		            } else {
		                getEmpPage($(this).text(), pageSize);
		            }
		        });
		
		        
		        $.each(data.list,function(){
		     		var $tr =$('<tr>'
		     			      +'<td>'+this.procode+'</td>'
		     			      +'<td>'+this.proname+'</td>'
		     			      +'<td>'+this.procontact+'</td>'
		     			      +'<td>'+this.prophone+'</td>'
		     			      +'<td>'+this.profax+'</td>'
		     			      +'<td>'+this.createdate+'</td>'
		     			      +'<td>'
		    			      +'<span><a href="getProviderById.do?idno='+this.idno+'"><img src="statics/images/read.png" alt="查看" title="查看" /></a></span>'
		    			      +'<span><a href="updateProvider.do?idno='+this.idno+'"><img src="statics/images/xiugai.png" alt="修改" title="修改" /></a></span>'
		    			      +'<span class="delete">'
		    			      
		    			      +'<a class="deleteProvider" href="javascript:viod(0)" idno="'+this.idno+'"><img src="statics/images/schu.png" alt="删除" title="删除" /></a>'
		    			      +'</span>'
		     			      +'</td>'
		     			      +'</tr>');
		    				
		    			      ($tr).appendTo(".providerTable").find(".deleteProvider").click(function(){
		    		        	     var idno = $(this).attr("idno")
		    		        	     
		    		        	   var flag = window.confirm("确定删除吗？")
		    		        	   if(flag){
		    		        	     $.post("deleteProvider.do",{"idno":idno},function(data){
		    		        	        
		    		        	        if(data=="1"){
		    		        	             alert("删除成功！！！")
		    		        	             window.location.href="getAllProvider1.do";
		    		        	            }else{
		    		        	            alert("删除失败！")
		    		        	                }
		    		        	         });
		    		        	      }else{
		    		        	           alert("删除失败！")
		    		        	          }
		    			      });
		    		
		     		})
		
		})	

}

 </script> 