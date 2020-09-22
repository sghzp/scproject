$(function(){
	
	var ecutype = "";
	var ecuorder = "";
	var sjljh = "";
	var shzt = "";
	//var sbm = $("#sbm").val();
	var type = "scrq";
	var order = "desc"; 
	
	$.post("./QueryIni_byorder?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&shzt=" + encodeURI(encodeURI(shzt))
			+ "&ecuorder="+ encodeURI(encodeURI(ecuorder))+ "&order="+ encodeURI(encodeURI(order))+ "&type="+ encodeURI(encodeURI(type)),null,function(data){	
		 
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
			      
			      {field:'ECUOrder',title:'订货号',width:150,align:'left'},
			      {field:'ECUType',title:'ECU型号',width:150,align:'left'},
			      {field:'bz2',title:'发动机型号',width:150,align:'left'},
			      {field:'zcbm',title:'整车编码',width:150,align:'left'},
			      {field:'sbm',title:'识别码',width:150,align:'left'},
			      {field:'state',title:'识别码状态',width:150,align:'left'},
			      {field:'sjljh',title:'数据零件号',width:150,align:'left'},
			      {field:'times',title:'已刷写数',width:150,align:'left'},
			      {field:'scrgh',title:'上传人工号',width:150,align:'left'},
			      {field:'scr',title:'上传人',width:150,align:'left'},
			      {field:'scrq',title:'上传日期',width:150,align:'left'},
			      {field:'xgr',title:'修改人',width:150,align:'left'},
			      {field:'editDate',title:'修改日期',width:150,align:'left'},
			      {field:'shzt',title:'审核状态',width:150,align:'left'},
			      {field:'shr',title:'审核人',width:150,align:'left'},
			      {field:'INIFile',title:'INIFILE',width:150,align:'left'},
			      {field:'HEXParentID',title:'HEXParentID',width:150,align:'left'},
			      {field:'canWriteTimes',title:'可刷写次数',width:150,align:'left'},
			      {field:'bz1',title:'备注1',width:150,align:'left'},
			      {field:'INIID',title:'INIID',width:150,align:'left'}
			    ]]
			  })
	},"json");		
})

function query(){
	var ecutype = $("#ecutype").val();
	var ecuorder = $("#ecuorder").val();
	var sjljh = $("#sjljh").val();
	var shzt = $("#shzt option:selected").val();
	//var sbm = $("#sbm").val();
	
	$.post("./QueryIni?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&shzt=" + encodeURI(encodeURI(shzt))
			+ "&ecuorder="+ encodeURI(encodeURI(ecuorder)),null,function(data){	
		
		
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
			      
			      {field:'ECUOrder',title:'订货号',width:150,align:'left'},
			      {field:'ECUType',title:'ECU型号',width:150,align:'left'},
			      {field:'bz2',title:'发动机型号',width:150,align:'left'},
			      {field:'zcbm',title:'整车编码',width:150,align:'left'},
			      {field:'sbm',title:'识别码',width:150,align:'left'},
			      {field:'state',title:'识别码状态',width:150,align:'left'},
			      {field:'sjljh',title:'数据零件号',width:150,align:'left'},
			      {field:'times',title:'已刷写数',width:150,align:'left'},
			      {field:'scrgh',title:'上传人工号',width:150,align:'left'},
			      {field:'scr',title:'上传人',width:150,align:'left'},
			      {field:'scrq',title:'上传日期',width:150,align:'left'},
			      {field:'xgr',title:'修改人',width:150,align:'left'},
			      {field:'editDate',title:'修改日期',width:150,align:'left'},
			      {field:'shzt',title:'审核状态',width:150,align:'left'},
			      {field:'shr',title:'审核人',width:150,align:'left'},
			      {field:'INIFile',title:'INIFILE',width:150,align:'left'},
			      {field:'HEXParentID',title:'HEXParentID',width:150,align:'left'},
			      {field:'canWriteTimes',title:'可刷写次数',width:150,align:'left'},
			      {field:'bz1',title:'备注1',width:150,align:'left'},
			      {field:'INIID',title:'INIID',width:150,align:'left'}
			    ]]
			  })
	},"json");	
}



function querybyorder(){
	var ecutype = $("#ecutype").val();
	var ecuorder = $("#ecuorder").val();
	var sjljh = $("#sjljh").val();
	var shzt = $("#shzt option:selected").val();
	//var sbm = $("#sbm").val();
	var type = $("#type option:selected").val();;
	var order = $("#shunxu option:selected").val();; 
	
	$.post("./QueryIni_byorder?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&shzt=" + encodeURI(encodeURI(shzt))
			+ "&ecuorder="+ encodeURI(encodeURI(ecuorder))+ "&order="+ encodeURI(encodeURI(order))+ "&type="+ encodeURI(encodeURI(type)),null,function(data){	
		 
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
			      
			      {field:'ECUOrder',title:'订货号',width:150,align:'left'},
			      {field:'ECUType',title:'ECU型号',width:150,align:'left'},
			      {field:'bz2',title:'发动机型号',width:150,align:'left'},
			      {field:'zcbm',title:'整车编码',width:150,align:'left'},
			      {field:'sbm',title:'识别码',width:150,align:'left'},
			      {field:'state',title:'识别码状态',width:150,align:'left'},
			      {field:'sjljh',title:'数据零件号',width:150,align:'left'},
			      {field:'times',title:'已刷写数',width:150,align:'left'},
			      {field:'scrgh',title:'上传人工号',width:150,align:'left'},
			      {field:'scr',title:'上传人',width:150,align:'left'},
			      {field:'scrq',title:'上传日期',width:150,align:'left'},
			      {field:'xgr',title:'修改人',width:150,align:'left'},
			      {field:'editDate',title:'修改日期',width:150,align:'left'},
			      {field:'shzt',title:'审核状态',width:150,align:'left'},
			      {field:'shr',title:'审核人',width:150,align:'left'},
			      {field:'INIFile',title:'INIFILE',width:150,align:'left'},
			      {field:'HEXParentID',title:'HEXParentID',width:150,align:'left'},
			      {field:'canWriteTimes',title:'可刷写次数',width:150,align:'left'},
			      {field:'bz1',title:'备注1',width:150,align:'left'},
			      {field:'INIID',title:'INIID',width:150,align:'left'}
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