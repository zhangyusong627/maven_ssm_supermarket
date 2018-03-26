<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>供应商管理页面 >> 供应商添加页面</span>
  </div>
  <div class="providerAdd">
    <form id="providerForm" name="providerForm" method="post" action="">
      <input type="hidden" name="method" value="add">
      <!--div的class 为error是验证错误，ok是验证成功-->
      <div class="">
        <label for="proCode">供应商编码：</label> <input type="text" name="procode" id="proCode" value="">
        <!-- 放置提示信息 -->
        <font color="red"></font>
      </div>
      <div>
        <label for="proName">供应商名称：</label> <input type="text" name="proname" id="proName" value="">  <font color="red"></font>
      </div>
      <div>
        <label for="proContact">联系人：</label> <input type="text" name="procontact" id="proContact" value="">  <font color="red"></font>
      </div>
      <div>
        <label for="proPhone">联系电话：</label> <input type="text" name="prophone" id="proPhone" value="">  <font color="red"></font>
      </div>
      <div>
        <label for="proAddress">联系地址：</label> <input type="text" name="proaddress" id="proAddress" value="">  <font color="red"></font>
      </div>
      <div>
        <label for="proFax">传真：</label> <input type="text" name="profax" id="proFax" value="">  <font color="red"></font>
      </div>
      <div>
        <label for="proDesc">描述：</label> <input type="text" name="prodesc" id="proDesc" value="">  <font color="red"></font>
      </div>
      <div class="providerAddBtn">
        <input type="button" name="add" id="add"  value="保存"> <input type="button" id="back" name="back" value="返回">
      </div>
      <font color="red"></font>
    </form>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<script type="text/javascript" src="js/provideradd.js"></script>
<script type="text/javascript">
$(function(){
	
	//返回上一步
	$("#back").click(function(){
		
		window.history.go(-1);
	});
	
	//ajax同步
	$.ajaxSetup({  
	      async : false  
	  	});


		
	$("#proCode").next().text("*")
	$("#proName").next().text("*")
	$("#proContact").next().text("*")
	$("#proPhone").next().text("*")
	$("#proAddress").next().text("*")
	$("#proFax").next().text("*")
	$("#proDesc").next().text("*")
	$(".providerAddBtn").next().text("带*号必填内容")
	var result=0;
	
	//验证供应商编码
	$("#proCode").blur(function(){
		
		var regcode = $("#proCode").val().trim();
		if(regcode==""||regcode==null){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 供应商编码不能为空");
		result=1;
		}else{
			//验证订单编码是否存在
			
			$.post("findCode.do",{"procode":regcode},function(data){
				
				if(data=="0"){
					$("#proCode").next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
					result=0;
					}else{
						$("#proCode").next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 编码已经存在");
						result=1;
						}
			})
			
		}
	})
	
	//验证供应商名称
	$("#proName").blur(function(){
		var regname= $("#proName").val().trim();
		var flag = /^[\u4e00-\u9fa5]{5,20}$/;
		if(regname==null||regname==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 供应商名称不能为空");
			result=1;
			}else if(!flag.test(regname)){
				$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 供应商称在5-20个中文以内");
				result=1;
				}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
	})
	    //验证联系人
		$("#proContact").blur(function(){
		var regcontact= $("#proContact").val().trim();
		var flag = /^[\u4e00-\u9fa5]{1,5}$/;
		if(regcontact==null||regcontact==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 联系人不能为空");
			result=1;
			}else if(!flag.test(regcontact)){
				$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 联系人在5个中文以内");
				result=1;
				}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
	})
	    
	//验证联系电话
		$("#proPhone").blur(function(){
		var regphone= $("#proPhone").val().trim();
		var flag = /^\d{11}$/;
		if(regphone==null||regphone==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 联系电话不能为空");
			result=1;
			}else if(!flag.test(regphone)){
				
				$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 联系电话为11位数字");
				result=1;
				}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
	})
	   
	//验证联系地址
		$("#proAddress").blur(function(){
		var regaddress= $("#proAddress").val().trim();
		var flag = /^[\u4e00-\u9fa5]{5,20}$/;
		if(regaddress==null||regaddress==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 联系地址不能为空");
			result=1;
			}else if(!flag.test(regaddress)){
				$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 联系地址在5-20个中文以内");
				result=1;
				}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
	})
	
	//验证传真
		$("#proFax").blur(function(){
		var regfax= $("#proFax").val().trim();
		var flag = /\d{3}-\d{8}|\d{4}-\d{7}/;
		if(regfax==null||regfax==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 传真不能为空");
			result=1;
			}else if(!flag.test(regfax)){
				$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 请输入正确的传真格式,例：027-11111111(8位),0712-1111111(7位)");
				result=1;
				}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
	})
	
	//验证描述
		$("#proDesc").blur(function(){
		var regdesc= $("#proDesc").val().trim();
		var flag = /^[\u4e00-\u9fa5]{5,30}$/;
		if(regdesc==null||regdesc==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 描述不能为空");
			result=1;
			}else if(!flag.test(regdesc)){
				$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 描述在5-30个中文以内");
				result=1;
				}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
	});
	
// 	$("#providerForm").submit(function(){
// 		alert(1111);
// 		if(result==0){
// 			if(regcode==""||regcode==null && regname==null||regname=="" && regcontact==null||regcontact=="" && regphone==null||regphone=="" && regaddress==null||regaddress=="" && regfax==null||regfax=="" && regdesc==null||regdesc==""){
// 				alert("带*号是必填内容");
// 			    return false;
// 		}else{
			
// 			return true;
// 		}
// 	}else{
// 		return false;
// 	}
// 	});
	
	
	//点击事件添加数据并判断值为空，验证条件不满足时就跳转不了
	$("#add").click(function(){
		
	    var procode =$("#proCode").val();
	    var proname =$("#proName").val();
	    var procontact =$("#proContact").val();
	    var prophone =$("#proPhone").val();
	    var proaddress =$("#proAddress").val();
	    var profax =$("#proFax").val();
	    var prodesc =$("#proDesc").val();
        if(procode==""||procode==null && proname==null||proname=="" && procontact==null||procontact=="" && prophone==null||prophone=="" && proaddress==null||proaddress=="" && profax==null||profax=="" && prodesc==null||prodesc==""){
        	
        }else if(result==1){
        	
        }
        else{
        	
	    $.post("addProvider1.do",{"procode":procode,"proname":proname,"procontact":procontact,"prophone":prophone,"proaddress":proaddress,"profax":profax,"prodesc":prodesc},function(data){
		
			if(data==1){
				
				location="getAllProvider1.do";
			}else{
				location="addProvider.do";
			}
		})
        }
	    
			
	})
})
</script>