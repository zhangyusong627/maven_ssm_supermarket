<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="common/head.jsp"%>

<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>订单管理页面 >> 订单添加页面</span>
     </div>
     <div class="providerAdd">
         <form action="add.do" id="billForm" name="billForm" method="post" >
             <!--div的class 为error是验证错误，ok是验证成功-->
             <input type="hidden" name="method" value="add">
             <div>
                 <label >订单编码：</label>
                 <input type="text" name="billcode" class="text" id="billCode" value=""> 
				 <!-- 放置提示信息 -->
				 <font color="red"></font>
             </div>
             <div>
                 <label >商品名称：</label>
                 <input type="text" name="productname" id="productName" value=""> 
                 <font color="red"></font>
             </div>
             <div>
                 <label >商品单位：</label>
                 <input type="text" name="productunit" id="productUnit" value=""> 
                 <font color="red"></font>
             </div>             
             <div>
                 <label >商品数量：</label>
                 <input type="text" name="productcount" id="productCount" value=""> 
                 <font color="red"></font>
             </div>
             <div>
                 <label >总金额：</label>
                 <input type="text" name="totalprice" id="totalPrice" value=""> 
                 <font color="red"></font>
             </div>
             <div>
                 <label >供应商：</label>
                 <select name="providerid" id="providerId">
                 <option value="0">请选择</option>
                 <c:forEach items="${marList}" var="bill">
                 <option value="${bill.providerid }">${bill.providerName}</option>
                 </c:forEach>
                 </select>
                 <font color="red" style="width:15px,   " ></font>
             </div>
             <div>
                 <label >是否付款:</label>
              <input type="radio" name="ispayment" value="1" checked="checked">未付款  
			  <input type="radio" name="ispayment" value="2" >已付款
             </div>
             <div class="providerAddBtn">
                  <input type="submit" name="add" id="add" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
             </div>
             <font color="red"></font>
             
         </form>
     </div>
 </div>
</section>
<%@include file="common/foot.jsp" %>
<!-- <script type="text/javascript" src="js/billadd.js"></script> -->
<script type="text/javascript" src="statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">




$(function(){
	$("#back").click(function(){
		window.history.back(-1);
	});
	//ajax设为同步
	$.ajaxSetup({  
      async : false  
  	});

	var billcode=null;
	var productName=null;
	var productunit=null;
	var productcount=null;
	var totalPrice=null;
	
	
$("#billCode").next().text("*")
$("#productName").next().text("*")
$("#productUnit").next().text("*")
$("#productCount").next().text("*")
$("#totalPrice").next().text("*")
$("#providerId").next().text("*")
$(".providerAddBtn").next().text("带*号必填内容")
var result=0;


// $("input[name=billcode]").focus();


$("input[name=billcode]").blur(function(){
 		 billcode = $("input[name=billcode]").val().trim();
	if(billcode==""){
	$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 订单编码不能为空");
	result=1;
		}else{
	//验证订单编码是否存在
 	$.post("findeBillCode.do",{"code":billcode},function(data){
//  	 	alert(data)
		if(data=="0"){
			$("input[name=billcode]").next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
			result=0;
			}else{
				$("input[name=billcode]").next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 编码已经存在");
				result=1;
				}
		}); 
		}
});

//验证商品名称
$("input[name=productname]").blur(function(){
	productName = $("input[name=productname]").val().trim();
	var flag = /^[\u4e00-\u9fa5]{1,5}$/;
	if(productName==null||productName==""){
	$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品名称不能为空");
	result=1;
	}else if(!flag.test(productName)){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品名称在5个字以内");
		result=1;
		}else{
      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
      result=0;
		}
})

//验证上面单位
$("input[name=productunit]").blur(function(){
	 productunit = $("input[name=productunit]").val().trim();
	var flag = /^[\u4e00-\u9fa5]{1,5}$/;
	if(productunit==null||productunit==""){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品单位不能为空");
		result=1;
	}else if(!flag.test(productunit)){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品单位在5个汉子以内");
		result=1;
		}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
})
//验证商品数量
$("input[name=productcount]").blur(function(){
	productcount = $("input[name=productcount]").val().trim();
	var flag = /^[0-9]*$/;
	if(productcount==null||productcount==""){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品数量不能为空");
		result=1;
	}else if(!flag.test(productcount)){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品数量只能输入数字");
		result=1;
		}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
})
//验证商品价格
$("input[name=totalprice]").blur(function(){
	totalPrice = $("input[name=totalprice]").val().trim(); 
	var flag = /^[0-9]*$/;
	if(totalPrice==null||totalPrice==""){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品价格不能为空");
		result=1;
	}else if(!flag.test(totalPrice)){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 商品价格只能输入数字");
		result=1;
		}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
});

$("#billForm").submit(function(){
// 	alert(result)
	if(result==0){
		if(totalPrice==null||totalPrice==""&&productcount==null||productcount==""&&productunit==null||productunit==""&&productName==null||productName==""&&billcode==""||billcode==null){
	     alert("带*号是必填内容")
		     return false;
			}else{
		    return true;
			}
	}else{
		return false;
	}

});
});





			







</script>