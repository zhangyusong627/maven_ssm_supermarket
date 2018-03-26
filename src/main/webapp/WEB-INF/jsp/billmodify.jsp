<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>订单管理页面 >> 订单修改页面</span>
  </div>
  <div class="providerAdd">
    <form id="billForm" name="billForm" method="post" action="updatebill.do">
      <input type="hidden" name="method" value="modifysave"> <input type="hidden" name="id" value="">
      <!--div的class 为error是验证错误，ok是验证成功-->
      <div class="">
        <label for="billCode">订单编码：</label> <input style="background-color:rgb(240,240,240) " type="text" name="billcode" id="billCode" value="${BillById.billcode}" readonly="readonly">
      </div>
      <div>
        <label for="productName">商品名称：</label> <input type="text" name="productname" id="productName" value="${BillById.productname}"> <font
          color="red"></font>
      </div>
      <div>
        <label for="productUnit">商品单位：</label> <input type="text" name="productunit" id="productUnit" value="${BillById.productunit}"> <font
          color="red"></font>
      </div>
      <div>
        <label for="productCount">商品数量：</label> <input type="text" name="productcount" id="productCount" value="${BillById.productcount}"> <font
          color="red"></font>
      </div>
      <div>
        <label for="totalPrice">总金额：</label> <input type="text" name="totalprice" id="totalPrice" value="${BillById.totalprice}"> <font
          color="red"></font>
      </div>
      <div>
        <label for="providerId">供应商：</label>
        <input type="hidden" value="" id="pid" /> 
        <select name="providerid" id="providerId">
  <c:forEach items="${marList}" var="bill">
  <option value="${bill.providerid }">${bill.providerName }</option>
  </c:forEach>
        </select>
         <font color="red"></font>
      </div>
      <div>
        <label>是否付款：</label>
         <c:if test="${BillById.ispayment == 1 }">
          <input type="radio" name="ispayment" value="1" checked="checked">未付款
		  <input type="radio" name="ispayment" value="2">已付款
		</c:if>
        <c:if test="${BillById.ispayment == 2 }">
          <input type="radio" name="ispayment" value="1">未付款
		  <input type="radio" name="ispayment" value="2" checked="checked">已付款
		</c:if>
      </div>
      <div class="providerAddBtn">
        <input type="submit" name="save" id="save" value="保存">
         <input type="button" id="back" name="back" value="返回">
      </div>
    </form>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<!-- <script type="text/javascript" src="js/billmodify.js"></script> -->
<script type="text/javascript" src="../../statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){

	$("#back").click(function(){
//	 	alert(222)
		window.history.back(-1)
	})

	
		var billcode=null;
	var productName=null;
	var productunit=null;
	var productcount=null;
	var totalPrice=null;
	
	
	
	var result=0;
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
// 			alert(result)
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
		
		
	
	})
	
	
	

</script>