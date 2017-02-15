<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap 实例</title>
  <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
  <!-- jquery名字一定要写对啊，少一个q都不行 -->
  <script src="jquery/jquery-3.1.1.js"></script>
  <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

  <script type="text/javascript">
  $(document).ready(function(){
  	//让左边的列表一开始加载css样式
  	$("#left-ul li a").css("background-color","white");
	$("#left-ul li a").css("color","#00BFFF");
	//默认第一个为蓝底白字
	$("#left-ul li a:first").css("background-color","#00BFFF");//蓝底
	$("#left-ul li a:first").css("color","white");//白字

	//当点击某个之后，改变其他的样式都变为白底蓝字，以及改变自己的样式为蓝底白字
	//这样子浏览器要执行多次操作，效率很低，代码太烂了，我也不想的
	$("#left-ul li a").click(function(){
	  	$("#left-ul li a").css("background-color","white");
	  	$("#left-ul li a").css("color","#00BFFF");
	    $(this).css("background-color","#00BFFF");
	    $(this).css("color","white");
	    $("#current-device").text($(this).text());//将当前选中的列表项的设备赋值给"current-device"的文本内容
	  });

	  $("#lizhiji").click(function(){
	  	// $(this).css("color","black");
	  	$("#maindiv").css("color","red");
	  	//AJAX（阿假克思）是要有服务器才能生效啊 摔！ =_=！
	  	$("#maindiv").load('index.jsp');
	  });
	  
	  $("#bt-connectwifi").click(function(){
	    $('#text').load('servlet/ConnectWiFi');//当Servelt改了名字之后相应的web.xml配置文件也要改名字，否则找不到路径
	  });
	  $("#bt-checkwifi").click(function(){
	    $('#text').load('servlet/CheckWiFi');
	  });
	  $("#bt-cutwifi").click(function(){
	    $('#text').load('servlet/CutWiFi');
	  });
	  $("#bt-pushfile").click(function(){
	    $('#text').load('servlet/PushFile',{device:$('#current-device').text()});
	  });
	  $("#bt-barcode1d").click(function(){
	    $('#text').load('servlet/Barcode1D',{device:$('#current-device').text()});
	  });
	  
	  $("#bt-bluetooth").click(function(){
	    $('#text').load('servlet/FileIO');
	  });
	  
	  $(".btn").click(function(){
	  	$('#text').text("正在输出信息，请稍后......");
	  });

	});	
  </script>

  <style>
  #homepage:hover{
  	color : #FFFF00;
  }
  .btn-info{
  	background-color:#00BFFF;/*设置信息按钮颜色默认为青蓝色*/
  }
  #btn-rfid{
  	background-color:#87CEFA;
  }
  #btn-bluetooth{
  	background-color:#87CEEB;
  }
  </style>
</head>

<body>
<div class="container-fluid">
<!-- 这里讲container改为xontainer-fluid，使得容器占满浏览器100%宽度 -->
<!-- 上 -->
	<div class="row clearfix" style="background-color: black;margin-left :-15px;margin-right:-15px;">
		<div class="col-md-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 column">	<a class="navbar-brand" href="#" id="homepage"><span class="glyphicon glyphicon-home"></span>终端自动化测试系统</a>	
		</div>

		<div class="col-md-5 col-lg-5 col-md-5 col-sm-5 col-xs-5 column">
		<!-- 为了占据宽度而设置，没啥用 --></div>

		<div class="col-md-1 col-lg-1 col-md-1 col-sm-1 col-xs-1 column">
			<a href="test2.html"><span class="glyphicon glyphicon-user"></span> User</a>
		</div>
	</div>
		
<!-- 中 -->
	<div class="row clearfix">
		<!-- 后面加“col-lg-1 col-md-1 col-sm-1 col-xs-1 column”使得页面缩小时，组件不会往下滑产生变形效果，下同 -->
		<!-- 中左 -->
		<div class="col-md-2 col-lg-2 col-md-2 col-sm-2 col-xs-2 column">
			<ul class="nav menu" id="left-ul">
				<span class="glyphicon glyphicon-dashboard"></span> 请选择设备：
				<br>
				<hr>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>C4000 </a></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>C40508909 </a></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>C40506782 </a></li>	
				<li><a href="http://apple.com" target="mainframe"><span class="glyphicon glyphicon-phone"></span>IPhone </a></li>	
				<li><a href="http://meizu.com/" target="mainframe"><span class="glyphicon glyphicon-phone"></span>魅族 </a></li>	
				<li><a href="http://xiaomi.com" target="mainframe"><span class="glyphicon glyphicon-phone"></span>小米 </a></li>	
				<li><a href="http://oppo.com" target="mainframe"><span class="glyphicon glyphicon-phone"></span>OPPO </a></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>更多请点击…… </a></li>	
				<hr>
				<li><a href="#" id="lizhiji"><span class="glyphicon glyphicon-user"></span> @lizhiji</a></li>
			</ul>
		</div>

		<!-- 中右 -->
		<div class="col-md-10 col-lg-10 col-md-10 col-sm-10 col-xs-10 column" id="maindiv" style="border:1px red;height:1000px">
			<div class="tabbable" id="tabs-958265">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-480219" data-toggle="tab">DeviceAPI</a>
					</li>
					<li>
						 <a href="#panel-558432" data-toggle="tab">UIAutomator</a>
					</li>
				</ul>
				<p>当前设备：<span id="current-device" class="danger" style="color:#00BFFF;">C4000</span></p>
				<div class="tab-content">
					<button type="button" class="btn btn-primary" id="bt-connectwifi">WIFI连接</button> 
					<button type="button" class="btn btn-info" id="bt-checkwifi">检查连接</button> 
					<button type="button" class="btn btn-danger" id="bt-cutwifi">断开连接</button> 
					<div class="tab-pane active" id="panel-480219">
						<hr>
						<button type="button" class="btn btn-success" id="bt-pushfile">导入文件</button> 
						<button type="button" class="btn btn-info" id="bt-barcode1d">Barcode1D</button> 
						<button type="button" class="btn btn-info" id="bt-rfid">RFID</button> 
						<button type="button" class="btn btn-info" id="bt-bluetooth">BlueTooth</button> 
						<hr>
						
					</div>
					<div class="tab-pane" id="panel-558432">
						<hr>
						<button type="button" class="btn btn-success" id="bt-pushfile-2">导入文件</button> 
						<hr>
						<button type="button" class="btn btn-info" id="bt-barcode1d">TestUseCase01</button> 
						<button type="button" class="btn btn-info" id="bt-rfid">TestUseCase02</button> 
						<button type="button" class="btn btn-info" id="bt-bluetooth">TestUseCase03</button> 
						<hr>
					</div>
				</div>
				输出信息：<hr>
				<div id="text" ></div>
			</div>
		</div>
		
	</div>

<!-- 下 -->
<!--  	
	<div class="row clearfix">
		<div class="col-md-12 column">

		</div>
	</div>
-->
</div>

</body>
</html>

