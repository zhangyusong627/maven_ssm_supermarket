<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>订单管理页面</span>
  </div>
  <div class="search">
    <form method="post" >
      <input name="method" value="query" class="input-text" type="hidden">
       <span>商品名称：</span><input name="productname" id="productname" type="text" value=""> 
       <span>供应商:</span>
      <select name="providerid" id= "providerid">
        <option value="0">--请选择--</option>
        <c:forEach items="${marList}" var="bill">
        <option value="${bill.providerid}" >${bill.providerName}</option>
        </c:forEach>
      </select>
      <span>是否付款：</span>
      <select name="ispayment" id="ispayment">
        <option value="0">--请选择--</option>
        <option value="1">未付款</option>
        <option value="2">已付款</option>
      </select>
      <input value="查 询" type="button" id="searchbutton"> <a href="addbill.do">添加订单</a>
    </form>
  </div>
  <!--账单表格 样式和供应商公用-->
  

  <table class="providerTable" cellpadding="0" cellspacing="0" border="1" id="table1">
    <tr class="firstTr">
      <th width="5%">序号</th>
      <th width="15%">订单编码</th>
      <th width="10%">商品名称</th>
      <th width="20%">供应商</th>
      <th width="10%">订单金额</th>
      <th width="10%">是否付款</th>
      <th width="15%">创建时间</th>
      <th width="30%">操作</th>
    </tr>
     
  </table>
<!--   <p>&nbsp;</p> -->
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
<div class="remove" id="removeBi">
  <div class="removerChid">
    <h2>提示</h2>
    <div class="removeMain">
      <p>你确定要删除该订单吗？</p>
      <a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
    </div>
  </div>
</div>
<%@include file="common/foot.jsp"%>
<!-- <script type="text/javascript" src="js/billlist.js"></script> -->
<script type="text/javascript" src="statics/js/jquery-1.8.3.min.js"></script>
<!-- <link rel="stylesheet" href="static/css/jquery.dataTables.min.css" /> -->

<!-- <script src="static/js/jquery.dataTables.min.js"></script> -->


<script>




    $(function() {
//     	alert(222)
    	var productname =null;
    	var providerid =null;
    	var ispayment = null;
    	var page =  1; 
    	var pagesize = 5;
     getEmpPage(1, 5,productname,providerid,ispayment);
    	    
    	    $("#searchbutton").click(function(){

    	    	productname = $("#productname").val();
    	    	providerid = $("#providerid").val();
    	    	ispayment = $("#ispayment").val();
    	    	//alert(productname);
    	    	// alert(providerid);
    	    	//alert(ispayment); 
    	    	
    			getEmpPage(page, pagesize,productname,providerid,ispayment);
    		})			
    	    
    	});
    

    


   function getEmpPage(startPage, pageSize,productname, providerid, ispayment) {
    $.post("getBillByParements.do", {
        "startPage" : startPage,
        "pageSize" : pageSize,
        "productname":productname,
        "providerid":providerid,
        "ispayment":ispayment
    }, function(data) {
//         alert(data.list)
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
        $(".page>ul>li").css({"float":"left","font-family":"微软雅黑","font-size":"15px","margin":"10px 5px","cursor":"pointer"});
        $(".page>ul").css({"text-indent":"10px"});
        $("#body").css({"cursor":"pointer"});
        
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
         var i=1 ;
//          alert(JSON.stringify(data))
        $.each(data.list, function() {
            var $tr = $( '<tr>'+
                          '<td>'+(i++)+'</td>'+
                          '<td>'+this.billcode+'</td>'+
                          '<td>'+this.productname+'</td>'+
                          '<td>'+this.providerName+'</td>'+
                          '<td>'+this.totalprice.toFixed(2)+'</td>'+
                          '<td>'+(this.ispayment==1?"未支付":"已支付")+'</td>'+
                          '<td>'+this.createDate+'</td>'+
                          '<td>'+
                          '<span>'+
                          '<a class="viewProvider" href="selectBill.do?idno='+this.idno+'" ><img src="statics/images/read.png" alt="查看" title="查看" /></a>'+
                          '</span>' +
                          '<span>'+
                          '<a class="modifyProvider" href="billmodify.do?idno='+this.idno+'" ><img src="statics/images/xiugai.png" alt="修改" title="修改" /></a>'+
                          '</span>'+
                          '<span id = "delete">'+
                          
                          '<a class="deleteProvider" href="javascript:viod(0)" idno="'+this.idno+'" ><img src="statics/images/schu.png" alt="删除" title="删除" /></a>'+
                          '</td>'+
                          '</tr>');
//             $("#table1").append($tr);
//                alert($tr)
        ($tr).appendTo("#table1").find(".deleteProvider").click(function(){
//             alert(222)
        	     var idno = $(this).attr("idno");
        	     
        	   var flag = window.confirm("亲，确定删除吗？")
        	   if(flag){
        	     $.post("deletebill.do",{"idno":idno},function(data){
        	        
        	        if(data=="1"){
        	             alert("亲，删除成功！！！")
        	             window.location.href="billlist.do";
        	            }else{
        	            alert("亲，删除失败！")
        	                }
        	         });
        	      }else{
        	           alert("亲，删除失败！")
        	          }
               })
        });
    });
}



</script>


