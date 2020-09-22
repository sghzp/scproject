/*$(function(){
	
	$.post("./QueryUserInfoPro?num=" + "" +"&obdxh=" +"" +"&obdcj=" + "",null,function(data){	
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
					      {field:'id',title:'ID',width:90,align:'left'},
					      {field:'enginetype',title:'发动机型号',width:120,align:'left'},
					      {field:'OBDXH',title:'OBD型号',width:120,align:'left'},
					      {field:'OBDCJ',title:'OBD厂家',width:150,align:'left'}
					    ]]
			  });
	},"json");	
});*/



function query(){
	
	var num = $("#num").val();
	var name = $("#name").val();
	var department = $("#department").val();
		
	$.post("./QueryUserInfoPro?num=" + encodeURI(encodeURI(num)) +"&name=" + encodeURI(encodeURI(name)) +"&department=" + encodeURI(encodeURI(department))
				 ,null,function(data){	
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
				      {field:'num',title:'工号',width:90,align:'left'},
				      {field:'name',title:'用户名',width:120,align:'left'},
				      {field:'mail',title:'邮箱',width:120,align:'left'},
				      {field:'department',title:'部门',width:150,align:'left'}
				    ]]
				  });
		},"json");	
	
}







function keydownEvent() {

    var e = window.event || arguments.callee.caller.arguments[0];

    if (e && e.keyCode == 13 ) {

        query();

    }

}