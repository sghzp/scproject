$(function(){
	var ecutype = "";
	var sjljh ="" ;
	var state = "";
	//var hclcj = $("#hclcj").val();
	var bz2 = "";
	var scr = "";
	var type = "scrq";
	var order = "desc";
	
	$.post("./QueryHex_byorder1?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
			 +"&bz2="+ encodeURI(encodeURI(bz2))+"&type="+ encodeURI(encodeURI(type))+"&order="+ encodeURI(encodeURI(order))+"&scr="+ encodeURI(encodeURI(scr)),null,function(data){	
		 
		for(var i= 0; i<data.length; i++){
			if(data[i].state == '-1') data[i].state = "空";
			if(data[i].state == '0') data[i].state = "正常";
			if(data[i].state == '1') data[i].state = "临时";
			if(data[i].state == '2') data[i].state = "套牌";
			if(data[i].state == '3') data[i].state = "备份";
			if(data[i].state == '4') data[i].state = "停用";
			if(data[i].state == '5') data[i].state = "临时超限";
			//alert(data[i].state);
			data[i].scrq = changedate(data[i].scrq);
			data[i].editDate = changedate(data[i].editDate);
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
			      			      
			      {field:'ECUType',title:'ECU型号',width:100,align:'left'},
			      {field:'bz2',title:'发动机型号',width:100,align:'left'},
			      {field:'sjljh',title:'数据零件号',width:100,align:'left'},
			      {field:'version',title:'数据版本',width:100,align:'left'},
			      {field:'state',title:'状态',width:100,align:'left'},
			      {field:'scz',title:'上传者',width:100,align:'left'},
			      {field:'scrq',title:'上传日期',width:120,align:'left'},
			      
			      {field:'yxq',title:'临时状态有效期',width:120,align:'left'},
			      {field:'canWriteTimes',title:'临时状态可刷写次数',width:120,align:'left'},
			      
			      {field:'editDate',title:'修改日期',width:120,align:'left'},
			      {field:'times',title:'已刷写数',width:100,align:'left'},
			      {field:'downloadtimes',title:'已下载数',width:100,align:'left'},
			      {field:'yt',title:'用途',width:160,align:'left'},
			      {field:'HEXFile',title:'HEX文件',width:100,align:'left'},
			      {field:'pfileName',title:'Pfile文件',width:150,align:'left'},
			      {field:'keyDataFileName',title:'Keyfile文件',width:100,align:'left'},
			      {field:'SBLFileName',title:'SBL文件',width:100,align:'left'},
			      {field:'SREFileName',title:'SRE文件',width:100,align:'left'},
			      {field:'zdds',title:'怠速',width:100,align:'left'},
			      {field:'wtdbgdbh',title:'委托单号',width:100,align:'left'},
			      {field:'bh',title:'HEX编号',width:100,align:'left'},
			      {field:'HEXID',title:'ID',width:100,align:'left'}
			    ]]
			  })
	},"json");	
		
})

function query(){
	var ecutype = $("#ecutype").val();
	var sjljh = $("#sjljh").val();
	var state = $("#state option:selected").val();
	//var hclcj = $("#hclcj").val();
	var bz2 = $("#bz2").val();
	var scr = $("#scr").val();
	
	$.post("./QueryHex1?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
			 +"&bz2="+ encodeURI(encodeURI(bz2))+"&scr="+ encodeURI(encodeURI(scr)),null,function(data){	
		  
		for(var i= 0; i<data.length; i++){
			if(data[i].state == '-1') data[i].state = "空";
			if(data[i].state == '0') data[i].state = "正常";
			if(data[i].state == '1') data[i].state = "临时";
			if(data[i].state == '2') data[i].state = "套牌";
			if(data[i].state == '3') data[i].state = "备份";
			if(data[i].state == '4') data[i].state = "停用";
			if(data[i].state == '5') data[i].state = "临时超限";
			data[i].scrq = changedate(data[i].scrq);
			data[i].editDate = changedate(data[i].editDate);
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
			      

			      {field:'ECUType',title:'ECU型号',width:100,align:'left',sortable:true},
			      {field:'bz2',title:'发动机型号',width:100,align:'left'},
			      {field:'sjljh',title:'数据零件号',width:100,align:'left'},
			      {field:'version',title:'数据版本',width:100,align:'left'},
			      {field:'state',title:'状态',width:100,align:'left'},
			      {field:'scz',title:'上传者',width:100,align:'left'},
			      {field:'scrq',title:'上传日期',width:120,align:'left'},
			      
			      {field:'yxq',title:'临时状态有效期',width:120,align:'left'},
			      {field:'canWriteTimes',title:'临时状态可刷写次数',width:120,align:'left'},
			      
			      {field:'editDate',title:'修改日期',width:120,align:'left'},
			      {field:'times',title:'已刷写数',width:100,align:'left'},
			      {field:'downloadtimes',title:'已下载数',width:100,align:'left'},
			      {field:'yt',title:'用途',width:160,align:'left'},
			      {field:'HEXFile',title:'HEX文件',width:100,align:'left'},
			      {field:'pfileName',title:'Pfile文件',width:150,align:'left'},
			      {field:'keyDataFileName',title:'Keyfile文件',width:100,align:'left'},
			      {field:'SBLFileName',title:'SBL文件',width:100,align:'left'},
			      {field:'SREFileName',title:'SRE文件',width:100,align:'left'},
			      {field:'zdds',title:'怠速',width:100,align:'left'},
			      {field:'wtdbgdbh',title:'委托单号',width:100,align:'left'},
			      {field:'bh',sortable:true,title:'HEX编号',width:100,align:'left'},
			      {field:'HEXID',title:'ID',width:100,align:'left'}
			    ]]
			  })
	},"json");	
}



function querybyorder(){
	
	var ecutype = $("#ecutype").val();
	var sjljh = $("#sjljh").val();
	var state = $("#state option:selected").val();
	//var hclcj = $("#hclcj").val();
	var bz2 = $("#bz2").val();
	var type = $("#type option:selected").val();;
	var order = $("#shunxu option:selected").val();;
	var scr = $("#scr").val();
	
	$.post("./QueryHex_byorder1?ecutype=" + encodeURI(encodeURI(ecutype)) +"&sjljh=" + encodeURI(encodeURI(sjljh)) +"&state=" + encodeURI(encodeURI(state))
			 +"&bz2="+ encodeURI(encodeURI(bz2))+"&type="+ encodeURI(encodeURI(type))+"&order="+ encodeURI(encodeURI(order))+"&scr="+ encodeURI(encodeURI(scr)),null,function(data){	
		 
		
		for(var i= 0; i<data.length; i++){
			if(data[i].state == '-1') data[i].state = "空";
			if(data[i].state == '0') data[i].state = "正常";
			if(data[i].state == '1') data[i].state = "临时";
			if(data[i].state == '2') data[i].state = "套牌";
			if(data[i].state == '3') data[i].state = "备份";
			if(data[i].state == '4') data[i].state = "停用";
			if(data[i].state == '5') data[i].state = "临时超限";
			data[i].scrq = changedate(data[i].scrq);
			data[i].editDate = changedate(data[i].editDate);
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
			      

			      {field:'ECUType',title:'ECU型号',width:100,align:'left'},
			      {field:'bz2',title:'发动机型号',width:100,align:'left'},
			      {field:'sjljh',title:'数据零件号',width:100,align:'left'},
			      {field:'version',title:'数据版本',width:100,align:'left'},
			      {field:'state',title:'状态',width:100,align:'left'},
			      {field:'scz',title:'上传者',width:100,align:'left'},
			      {field:'scrq',title:'上传日期',width:120,align:'left'},
			      
			      {field:'yxq',title:'临时状态有效期',width:120,align:'left'},
			      {field:'canWriteTimes',title:'临时状态可刷写次数',width:120,align:'left'},
			      
			      {field:'editDate',title:'修改日期',width:120,align:'left'},
			      {field:'times',title:'已刷写数',width:100,align:'left'},
			      {field:'downloadtimes',title:'已下载数',width:100,align:'left'},
			      {field:'yt',title:'用途',width:160,align:'left'},
			      {field:'HEXFile',title:'HEX文件',width:100,align:'left'},
			      {field:'pfileName',title:'Pfile文件',width:150,align:'left'},
			      {field:'keyDataFileName',title:'Keyfile文件',width:100,align:'left'},
			      {field:'SBLFileName',title:'SBL文件',width:100,align:'left'},
			      {field:'SREFileName',title:'SRE文件',width:100,align:'left'},
			      {field:'zdds',title:'怠速',width:100,align:'left'},
			      {field:'wtdbgdbh',title:'委托单号',width:100,align:'left'},
			      {field:'bh',title:'HEX编号',width:100,align:'left'},
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

function changedate(date){
	var res = 
		date.substring(0,4)+'-'+date.substring(4,6)+'-'+date.substring(6,8)
		+' '+date.substring(8,10)+':'+date.substring(10,12)+':'+date.substring(12,14);
	return res;
}

