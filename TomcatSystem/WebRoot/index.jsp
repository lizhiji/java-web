<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap ʵ��</title>
  <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
  <!-- jquery����һ��Ҫд�԰�����һ��q������ -->
  <script src="jquery/jquery-3.1.1.js"></script>
  <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

  <script type="text/javascript">
  $(document).ready(function(){
  	//����ߵ��б�һ��ʼ����css��ʽ
  	$("#left-ul li a").css("background-color","white");
	$("#left-ul li a").css("color","#00BFFF");
	//Ĭ�ϵ�һ��Ϊ���װ���
	$("#left-ul li a:first").css("background-color","#00BFFF");//����
	$("#left-ul li a:first").css("color","white");//����

	//�����ĳ��֮�󣬸ı���������ʽ����Ϊ�׵����֣��Լ��ı��Լ�����ʽΪ���װ���
	//�����������Ҫִ�ж�β�����Ч�ʺܵͣ�����̫���ˣ���Ҳ�����
	$("#left-ul li a").click(function(){
	  	$("#left-ul li a").css("background-color","white");
	  	$("#left-ul li a").css("color","#00BFFF");
	    $(this).css("background-color","#00BFFF");
	    $(this).css("color","white");
	    $("#current-device").text($(this).text());//����ǰѡ�е��б�����豸��ֵ��"current-device"���ı�����
	  });

	  $("#lizhiji").click(function(){
	  	// $(this).css("color","black");
	  	$("#maindiv").css("color","red");
	  	//AJAX�����ٿ�˼����Ҫ�з�����������Ч�� ˤ�� =_=��
	  	$("#maindiv").load('index.jsp');
	  });
	  
	  $("#bt-connectwifi").click(function(){
	    $('#text').load('servlet/ConnectWiFi');//��Servelt��������֮����Ӧ��web.xml�����ļ�ҲҪ�����֣������Ҳ���·��
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
	  	$('#text').text("���������Ϣ�����Ժ�......");
	  });

	});	
  </script>

  <style>
  #homepage:hover{
  	color : #FFFF00;
  }
  .btn-info{
  	background-color:#00BFFF;/*������Ϣ��ť��ɫĬ��Ϊ����ɫ*/
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
<!-- ���ｲcontainer��Ϊxontainer-fluid��ʹ������ռ�������100%��� -->
<!-- �� -->
	<div class="row clearfix" style="background-color: black;margin-left :-15px;margin-right:-15px;">
		<div class="col-md-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 column">	<a class="navbar-brand" href="#" id="homepage"><span class="glyphicon glyphicon-home"></span>�ն��Զ�������ϵͳ</a>	
		</div>

		<div class="col-md-5 col-lg-5 col-md-5 col-sm-5 col-xs-5 column">
		<!-- Ϊ��ռ�ݿ�ȶ����ã�ûɶ�� --></div>

		<div class="col-md-1 col-lg-1 col-md-1 col-sm-1 col-xs-1 column">
			<a href="test2.html"><span class="glyphicon glyphicon-user"></span> User</a>
		</div>
	</div>
		
<!-- �� -->
	<div class="row clearfix">
		<!-- ����ӡ�col-lg-1 col-md-1 col-sm-1 col-xs-1 column��ʹ��ҳ����Сʱ������������»���������Ч������ͬ -->
		<!-- ���� -->
		<div class="col-md-2 col-lg-2 col-md-2 col-sm-2 col-xs-2 column">
			<ul class="nav menu" id="left-ul">
				<span class="glyphicon glyphicon-dashboard"></span> ��ѡ���豸��
				<br>
				<hr>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>C4000 </a></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>C40508909 </a></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>C40506782 </a></li>	
				<li><a href="http://apple.com" target="mainframe"><span class="glyphicon glyphicon-phone"></span>IPhone </a></li>	
				<li><a href="http://meizu.com/" target="mainframe"><span class="glyphicon glyphicon-phone"></span>���� </a></li>	
				<li><a href="http://xiaomi.com" target="mainframe"><span class="glyphicon glyphicon-phone"></span>С�� </a></li>	
				<li><a href="http://oppo.com" target="mainframe"><span class="glyphicon glyphicon-phone"></span>OPPO </a></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone"></span>������������ </a></li>	
				<hr>
				<li><a href="#" id="lizhiji"><span class="glyphicon glyphicon-user"></span> @lizhiji</a></li>
			</ul>
		</div>

		<!-- ���� -->
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
				<p>��ǰ�豸��<span id="current-device" class="danger" style="color:#00BFFF;">C4000</span></p>
				<div class="tab-content">
					<button type="button" class="btn btn-primary" id="bt-connectwifi">WIFI����</button> 
					<button type="button" class="btn btn-info" id="bt-checkwifi">�������</button> 
					<button type="button" class="btn btn-danger" id="bt-cutwifi">�Ͽ�����</button> 
					<div class="tab-pane active" id="panel-480219">
						<hr>
						<button type="button" class="btn btn-success" id="bt-pushfile">�����ļ�</button> 
						<button type="button" class="btn btn-info" id="bt-barcode1d">Barcode1D</button> 
						<button type="button" class="btn btn-info" id="bt-rfid">RFID</button> 
						<button type="button" class="btn btn-info" id="bt-bluetooth">BlueTooth</button> 
						<hr>
						
					</div>
					<div class="tab-pane" id="panel-558432">
						<hr>
						<button type="button" class="btn btn-success" id="bt-pushfile-2">�����ļ�</button> 
						<hr>
						<button type="button" class="btn btn-info" id="bt-barcode1d">TestUseCase01</button> 
						<button type="button" class="btn btn-info" id="bt-rfid">TestUseCase02</button> 
						<button type="button" class="btn btn-info" id="bt-bluetooth">TestUseCase03</button> 
						<hr>
					</div>
				</div>
				�����Ϣ��<hr>
				<div id="text" ></div>
			</div>
		</div>
		
	</div>

<!-- �� -->
<!--  	
	<div class="row clearfix">
		<div class="col-md-12 column">

		</div>
	</div>
-->
</div>

</body>
</html>

