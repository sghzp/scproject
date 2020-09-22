
	$(function(){
		var ecutype = "";
		var sjljh ="";
		var state = "";
		var shzt = "";
		//var hclcj = $("#hclcj").val();
		var bz2 ="";
		var type = "scrq";
		var order = "desc";
		
		$.post("./QueryHex_byorder?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
				 +"&bz2="+ encodeURI(encodeURI(bz2))+"&shzt="+ encodeURI(encodeURI(shzt))+"&type="+ encodeURI(encodeURI(type))+"&order="+ encodeURI(encodeURI(order)),null,function(data){	
			  
			for(var i= 0; i<data.length; i++){
				if(data[i].state == '0') data[i].state = "正常";
				if(data[i].state == '1') data[i].state = "临时";
				if(data[i].state == '2') data[i].state = "TP";
				if(data[i].state == '3') data[i].state = "备份";
				if(data[i].state == '4') data[i].state = "停用";
				//alert(data[i].state);
			}
			
			$("#box").datagrid({
				  	rownumbers: true,
				    data:data,
				  	singleSelect: true,	
				  	loadMsg:'数据加载中,请稍后...',
				  	title:'查询结果表格',
				  	autoRowHeight:false,
				  	
				  	view:scrollview,
				  	pageSize:15,
				  	
				  	fitColumns: false,
				    
				    columns:[[
				      
				              {field:'bh',title:'HEX编号',width:100,align:'left'},
						      {field:'ECUType',title:'ECU型号',width:100,align:'left'},
						      {field:'bz2',title:'发动机型号',width:100,align:'left'},
						      {field:'sjljh',title:'数据零件号',width:100,align:'left'},
						      {field:'shzt',title:'审核状态',width:100,align:'left'},
						      {field:'shr',title:'审核人',width:100,align:'left'},
						      {field:'shrq',title:'审核日期',width:100,align:'left'},
						      {field:'times',title:'已刷写数',width:100,align:'left'},
						      {field:'yt',title:'用途',width:160,align:'left'},
						      {field:'HEXFile',title:'HEX文件',width:100,align:'left'},
						      {field:'zdds',title:'怠速',width:100,align:'left'},
						      {field:'wtdbgdbh',title:'委托单号',width:100,align:'left'},
						      {field:'version',title:'软件版本',width:100,align:'left'},
						      {field:'state',title:'状态',width:100,align:'left'},
						      {field:'scz',title:'上传者',width:100,align:'left'},
						      {field:'scrq',title:'上传日期',width:100,align:'left'},
						      {field:'HEXID',title:'ID',width:100,align:'left'}
				    ]]
				  })
		},"json");	
		
	})

	function query(){
		var ecutype = $("#ecutype").val();
		var sjljh = $("#sjljh").val();
		var state = $("#state option:selected").val();
		var shzt = $("#shzt option:selected").val();
		//var hclcj = $("#hclcj").val();
		var bz2 = $("#bz2").val();
		
		$.post("./QueryHex?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
		+ "&bz2="+ encodeURI(encodeURI(bz2)) +"&shzt="+ encodeURI(encodeURI(shzt)),null,function(data){	
			 
			for(var i= 0; i<data.length; i++){
				if(data[i].state == '0') data[i].state = "正常";
				if(data[i].state == '1') data[i].state = "临时";
				if(data[i].state == '2') data[i].state = "TP";
				if(data[i].state == '3') data[i].state = "备份";
				if(data[i].state == '4') data[i].state = "停用";
				//alert(data[i].state);
			}
			
			$("#box").datagrid({
				  	rownumbers: true,
				    data:data,
				  	singleSelect: true,	
				  	loadMsg:'数据加载中,请稍后...',
				  	title:'查询结果表格',
				  	autoRowHeight:false,
				  	
				  	view:scrollview,
				  	pageSize:15,
				  	
				  	fitColumns: false,
				    
				    columns:[[
						      
						      {field:'bh',title:'HEX编号',width:100,align:'left'},
						      {field:'ECUType',title:'ECU型号',width:100,align:'left'},
						      {field:'bz2',title:'发动机型号',width:100,align:'left'},
						      {field:'sjljh',title:'数据零件号',width:100,align:'left'},
						      {field:'shzt',title:'审核状态',width:100,align:'left'},
						      {field:'shr',title:'审核人',width:100,align:'left'},
						      {field:'shrq',title:'审核日期',width:100,align:'left'},
						      {field:'times',title:'已刷写数',width:100,align:'left'},
						      {field:'yt',title:'用途',width:160,align:'left'},
						      {field:'HEXFile',title:'HEX文件',width:100,align:'left'},
						      {field:'zdds',title:'怠速',width:100,align:'left'},
						      {field:'wtdbgdbh',title:'委托单号',width:100,align:'left'},
						      {field:'version',title:'软件版本',width:100,align:'left'},
						      {field:'state',title:'状态',width:100,align:'left'},
						      {field:'scz',title:'上传者',width:100,align:'left'},
						      {field:'scrq',title:'上传日期',width:100,align:'left'},
						      {field:'HEXID',title:'ID',width:100,align:'left'}
				    ]]
				  })
		},"json");	
	}


	
	
	
	
	
	
	
	function querybyorder(){
		
		var ecutype = $("#ecutype").val();
		var sjljh = $("#sjljh").val();
		var state = $("#state option:selected").val();
		var shzt = $("#shzt option:selected").val();
		//var hclcj = $("#hclcj").val();
		var bz2 = $("#bz2").val();
		var type = $("#type option:selected").val();;
		var order = $("#shunxu option:selected").val();;
		
		$.post("./QueryHex_byorder?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
				 +"&bz2="+ encodeURI(encodeURI(bz2))+"&shzt="+ encodeURI(encodeURI(shzt))+"&type="+ encodeURI(encodeURI(type))+"&order="+ encodeURI(encodeURI(order)),null,function(data){	
			 
			for(var i= 0; i<data.length; i++){
				if(data[i].state == '0') data[i].state = "正常";
				if(data[i].state == '1') data[i].state = "临时";
				if(data[i].state == '2') data[i].state = "TP";
				if(data[i].state == '3') data[i].state = "备份";
				if(data[i].state == '4') data[i].state = "停用";
				//alert(data[i].state);
			}
			
			$("#box").datagrid({
				  	rownumbers: true,
				    data:data,
				  	singleSelect: true,	
				  	loadMsg:'数据加载中,请稍后...',
				  	title:'查询结果表格',
				  	autoRowHeight:false,
				  	
				  	view:scrollview,
				  	pageSize:15,
				  	
				  	fitColumns: false,
				    
				    columns:[[
				      
				              {field:'bh',title:'HEX编号',width:100,align:'left'},
						      {field:'ECUType',title:'ECU型号',width:100,align:'left'},
						      {field:'bz2',title:'发动机型号',width:100,align:'left'},
						      {field:'sjljh',title:'数据零件号',width:100,align:'left'},
						      {field:'shzt',title:'审核状态',width:100,align:'left'},
						      {field:'shr',title:'审核人',width:100,align:'left'},
						      {field:'shrq',title:'审核日期',width:100,align:'left'},
						      {field:'times',title:'已刷写数',width:100,align:'left'},
						      {field:'yt',title:'用途',width:160,align:'left'},
						      {field:'HEXFile',title:'HEX文件',width:100,align:'left'},
						      {field:'zdds',title:'怠速',width:100,align:'left'},
						      {field:'wtdbgdbh',title:'委托单号',width:100,align:'left'},
						      {field:'version',title:'软件版本',width:100,align:'left'},
						      {field:'state',title:'状态',width:100,align:'left'},
						      {field:'scz',title:'上传者',width:100,align:'left'},
						      {field:'scrq',title:'上传日期',width:100,align:'left'},
						      {field:'HEXID',title:'ID',width:100,align:'left'}
				    ]]
				  })
		},"json");	
		
	}

	function keydownEvent() {

	    var e = window.event || arguments.callee.caller.arguments[0];

	    if (e && e.keyCode == 13 ) {

	        query();

	    }

	}


