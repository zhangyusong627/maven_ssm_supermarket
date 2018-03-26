<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>供应商管理页面 >> 供应商修改页</span>
  </div>
  <div class="providerAdd">
    <form id="providerForm" name="providerForm" method="post" action="updateProvider1.do">
      <!--div的class 为error是验证错误，ok是验证成功-->
      <div class="">
        <label for="proCode">供应商编码：</label> <input type="text" name="procode" id="proCode" value="${providerById.procode }" readonly="readonly">
      </div>
      <div>
        <label for="proName">供应商名称：</label> <input type="text" name="proname" id="proName" value="${providerById.proname }"> <font color="red"></font>
      </div>
      <div>
        <label for="proContact">联系人：</label> <input type="text" name="procontact" id="proContact" value="${providerById.procontact }"> <font
          color="red"></font>
      </div>
      <div>
        <label for="proPhone">联系电话：</label> <input type="text" name="prophone" id="proPhone" value="${providerById.prophone }"> <font color="red"></font>
      </div>
      <div>
        <label for="proAddress">联系地址：</label> <input type="text" name="proaddress" id="proAddress" value="${providerById.proaddress }">
      </div>
      <div>
        <label for="proFax">传真：</label> <input type="text" name="profax" id="proFax" value="${providerById.profax }">
      </div>
      <div>
        <label for="proDesc">描述：</label> <input type="text" name="prodesc" id="proDesc" value="${providerById.prodesc }">
      </div>
      <div class="providerAddBtn">
        <input type="button" name="save" id="save" value="保存"> <input type="button" id="back" name="back" value="返回" >
      </div>
    </form>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<script type="text/javascript" src="js/providermodify.js"></script>

<script type="text/javascript">
$(function(){
	$("#back").click(function(){
		
		window.history.go(-1);
	})
	
	$("#save").click(function(){
		alert("确认修改吗？")
		var procode = $("#proCode").val();
		var proname = $("#proName").val();
		var procontact = $("#proContact").val();
		var prophone = $("#proPhone").val();
		var proaddress = $("#proAddress").val();
		var profax = $("#proFax").val();
		var prodesc = $("#proDesc").val();
		$.post("updateProvider1.do",{"procode":procode,"proname":proname,"procontact":procontact,"prophone":prophone,"proaddress":proaddress,"profax":profax,"prodesc":prodesc,},function(data){
			if(data==1){
				alert("修改成功");
				location="getAllProvider1.do";
			}else{
				alert("修改失败");
				location="updateProvider.do";
			}
		})
	})
	
	
})
</script>
