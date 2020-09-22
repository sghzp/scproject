$(function(){
	
	$.post("./QueryMessage?enginetype=" + "" +"&obdxh=" +"" +"&obdcj=" + "",null,function(data){
		  $("#box").datagrid({
			  	singleSelect: true,	
			  	loadMsg:'数据加载中,请稍后...',
			  	rownumbers: true,
			  	title:'查询结果表格',
			  	autoRowHeight:false,
			  	
			  	view:scrollview,
			  	pageSize:15,
			  	
			  	fitColumns: false,
			  	data:data,
			  	columns:[[
					      {field:'message',title:'消息',width:240,align:'left'},
					      {field:'state',title:'是/否读取',width:120,align:'left'}
					 
					    ]]
			  });
	},"json");	
});