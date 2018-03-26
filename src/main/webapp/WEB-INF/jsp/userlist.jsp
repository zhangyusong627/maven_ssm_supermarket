<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

			
		
	
<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>
	</div>
	<div class="search">
		<form method="get" >
		<input name="method" value="query" class="input-text" type="hidden">
		<span>用户名：</span> <input name="username" class="input-text"type="text" value="" id="username"> 
		<span>用户角色：</span> 
		<select name="roleid" id="roleid">
				<option value="0">--请选择--</option>
				<option value="1">管理员</option>
				<option value="2">经理</option>
				<option value="3">员工</option>
		</select> 
		
		<input value="查 询" type="button" id="searchbutton"> 
		<a href="useradd.do">添加用户</a>
		</form>
	</div>
	<!--用户-->
	<table class="providerTable" cellpadding="0" cellspacing="0" border="1" id="table1">
		<tr class="firstTr">
			<th width="10%">用户编码</th>
			<th width="20%">用户名称</th>
			<th width="10%">性别</th>
			<th width="10%">年龄</th>
			<th width="10%">电话</th>
			<th width="10%">用户角色</th>
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
<!--点击删除按钮后弹出的页面 -->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
	<div class="removerChid">
		<h2>提示</h2>
		<div class="removeMain">
			<p>你确定要删除该用户吗？</p>
			<a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
		</div>
	</div>
</div>
<%@include file="common/foot.jsp"%>
<!-- <script type="text/javascript" src="js/userlist.js"></script> -->
<script type="text/javascript" src="../../statics/js/jquery-1.8.3.min.js"></script>
<script src="../../static/js/jquery.pagination.min.js"></script>
<script >

// $(function(){
// 	getUser(null,null);
// 	$("#searchbutton").click(function(){
// 		var username = $("#username").val().trim();
// 		var roleid = $("#roleid").val().trim();
// 		getUser(username,roleid);
// 	})			
// })

$(function() {
	
	var username =null;
	var roleid =null;
	var page =  1; 
	var pagesize = 10;
	    getEmpPage(1, 5,username,roleid);
	    
	    $("#searchbutton").click(function(){

			 username = $("#username").val();
			 roleid = $("#roleid").val();

			getEmpPage(page, pagesize,username,roleid);
		})			
	    
	});

// function getUser(username,roleid){
// 	//alert(222)
// 	$("#table1>tbody>tr:gt(0)").remove();
// 	$.post("listUser.do",{"username":username,"roleid":roleid},function(data){
		function getEmpPage(startPage, pageSize,username,roleid) {
		//	$("#table1>tbody>tr:gt(0)").remove();
		    $.post("listUser.do", {
		        "startPage" : startPage,
		        "pageSize" : pageSize,
		        "username": username,
		        "roleid": roleid
		        //"productname":$("#productname").val(),
		        //"providerid":$("#providerid").val(),
		        //"ispayment":$("#ispayment").val()
		    }, function(data) {
		        //alert(data.list)
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
		
		//alert(data)
		var st="";
		var i =1;
			//alert(JSON.stringify(data))
		$.each(data.list,function(){
		  var $tr =$('<tr>'
				+'<td>'+this.usercode+'</td>'
				+'<td>'+this.username+'</td>'
				+'<td>'+(this.gender==1?"男":"女")+'</td>'
				+'<td>'+this.age+'</td>'
				+'<td>'+this.phone+'</td>'
				+'<td>'+(this.userrole==1?"管理员":this.userrole==2?"经理":"员工")+'</td>'
				+'<td >'
				+'<span><a href="viewUser.do?idno='+this.idno+'"><img src="statics/images/read.png" alt="查看" title="查看" /></a></span>'
				+'<span><a href="updateUsers.do?idno='+this.idno+'"><img src="statics/images/xiugai.png" alt="修改" title="修改" /></a></span>'
				+'<span class="delete">'
			    
			    +'<a class="deleteUser" href="javascript:viod(0)" idno="'+this.idno+'"><img src="statics/images/schu.png" alt="删除" title="删除" /></a>'
			    +'</span>'
				+'</td>'
				+'</tr>');
			
			($tr).appendTo("#table1").find(".deleteUser").click(function(){
	        	     var idno = $(this).attr("idno");
	        	     
				 var flag = window.confirm("确定删除吗？")
	        	   if(flag){
	        	     $.post("deleteUser.do",{"idno":idno},function(data){
	        	        
	        	        if(data=="1"){
	        	             alert("删除成功！！！")
	        	             window.location.href="userlist.do";
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
