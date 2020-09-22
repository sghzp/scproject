$(function(){
	
	$.post("./QueryManagement_log?radio=" +  "datalog" +"&guanjianzi=" + "",null,function(data){	
		for(var i= 0; i<data.length; i++){
			data[i].time = changedate(data[i].time);
		} 
		
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
			      {field:'time',title:'维护时间',width:300,align:'left'},
			      {field:'datalog',title:'维护内容',width:500,align:'left'}
			    ]]
			  })
	},"json");	
})

function query(){
	var radio = $('input:radio[name="tiaojian"]:checked').val();
	var guanjianzi = $("#guanjianzi").val();
	//alert(guanjianzi);
	//alert(radio);
	$.post("./QueryManagement_log?radio=" + encodeURI(encodeURI(radio)) +"&guanjianzi=" + encodeURI(encodeURI(guanjianzi)),null,function(data){	
		  
		for(var i= 0; i<data.length; i++){
			data[i].time = changedate(data[i].time);
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
			              	{field:'time',title:'维护时间',width:300,align:'left'},
			              	{field:'datalog',title:'维护内容',width:500,align:'left'}
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
