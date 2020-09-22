$(function(){
	
	$.post("./QueryUserInfo",null,function(data){
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
					      {field:'num',title:'工号',width:90,align:'left'},
					      {field:'name',title:'用户名',width:120,align:'left'},
					      {field:'mail',title:'邮箱',width:120,align:'left'},
					      {field:'department',title:'部门',width:120,align:'left'}
					 
					    ]]
			  });
	},"json");	
});