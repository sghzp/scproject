
$("#chaxunbiaoge tr").first().nextAll().click(function () {            	       	          	
   });






$(function () {
			//默认设置第一行数据变红
			$("#chaxunbiaoge tr").first().next().addClass("on");
            //除了表头（第一行）以外所有的行添加click事件.

            $("#chaxunbiaoge tr").first().nextAll().click(function () {   
				$(this).addClass("on").siblings("tr").removeClass("on");
            });
            
            //**************我是华丽的分割线*********以上是添加了表格行的单击事件*************
            
            

       });