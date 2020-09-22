
$(function(){
	$.post("./QueryWriteRecord?radio=" + "ecuorder" +"&guanjianzi=" + "",null,function(data){	
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
			      {field:'ecuorder',title:'订货号',width:150,align:'left'},
			      {field:'ecusn',title:'识别码',width:150,align:'left'},
			      {field:'ecutype',title:'机型',width:150,align:'left'},
			      {field:'ecuid',title:'主机号',width:150,align:'left'},
			      {field:'obdtype',title:'ECU序列号',width:150,align:'left'},
			      {field:'iqa',title:'IQA/QR码',width:150,align:'left'},
			      {field:'hex',title:'HEX/PFILE文件',width:150,align:'left'},
			      {field:'ini',title:'INI文件',width:150,align:'left'},
			      {field:'location',title:'数据零件号',width:150,align:'left'},
			      {field:'obdmanufacturer',title:'数据零件号版本',width:150,align:'left'},
			      {field:'operator',title:'操作员',width:150,align:'left'},
			      {field:'ecudate',title:'刷写时间',width:150,align:'left'}
			    ]]
			  });
			  
	},"json");
	
})

function query(){
	var radio = $('input:radio[name="tiaojian"]:checked').val();
	var guanjianzi = $("#guanjianzi").val();
	$.post("./QueryWriteRecord?radio=" + encodeURI(encodeURI(radio)) +"&guanjianzi=" + encodeURI(encodeURI(guanjianzi)),null,function(data){	
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
			      {field:'ecuorder',title:'订货号',width:150,align:'left'},
			      {field:'ecusn',title:'识别码',width:150,align:'left'},
			      {field:'ecutype',title:'机型',width:150,align:'left'},
			      {field:'ecuid',title:'主机号',width:150,align:'left'},
			      {field:'obdtype',title:'ECU序列号',width:150,align:'left'},
			      {field:'iqa',title:'IQA/QR码',width:150,align:'left'},
			      {field:'hex',title:'HEX/PFILE文件',width:150,align:'left'},
			      {field:'ini',title:'INI文件',width:150,align:'left'},
			      {field:'location',title:'数据零件号',width:150,align:'left'},
			      {field:'obdmanufacturer',title:'数据零件号版本',width:150,align:'left'},
			      {field:'operator',title:'操作员',width:150,align:'left'},
			      {field:'ecudate',title:'刷写时间',width:150,align:'left'}
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
