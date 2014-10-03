<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<style type="text/css">
/*背景图片调整*/
.bg {
	background-image: url(images/web2.jpg);
	background-repeat: no-repeat;
	background-position: 50% 30%;
	width: 100%;
	height: 155px;
	background-size: cover;
}
/*空格填充，方便调整按钮位置*/
.fill {
	float: left;
	position: relative;
	height: 400px;
	width: 44%;
}
/*调整按钮的上下位置*/
.btn-setting {
	padding-top: 115px;
	height: 22px;
}
/*调整微博图片的上下位置*/
.weibo-setting {
	padding-top: 22px;
	height: 10px;
}
/*空格填充，方便调整微博图片的左右位置*/
.fill2 {
	float: left;
	position: relative;
	height: 100px;
	width: 6%;
}
/*生成区域图片调整*/
.produce {
	background-image: url(images/div.jpg);
	background-repeat: no-repeat;
	background-position: 12% 30%;
	width: 100%;
	height: 380px;
	padding:0;
	margin:0;
}
/*调整生成按钮的左右位置*/
.fill3 {
	float: left;
	position: relative;
	height: 100px;
	width: 43%;
}
/*调整生成按钮的上下位置*/
.producebtn-setting {
	padding-top: 6px;
	height: 22px;
}
/*调整保存按钮的上下位置*/
.savebtn-setting {
	padding-top: 50px;
	height: 22px;
}
/*调整保存按钮的左右位置*/
.fill4 {
	float: left;
	position: relative;
	height: 400px;
	width: 42%;
}

/*调整分享按钮的上下位置*/
.sharebtn-setting {
	padding-top: 60px;
	height: 22px;
}
/*调整分享按钮的左右位置*/
.fill5 {
	float: left;
	position: relative;
	height: 400px;
	width: 93%;
}

/*左边部分*/
#left-part {
	height: 380px;
	width: 1000px;
	float: left;
	padding:0px;
	margin:0px;
}

/*右边部分*/
#right-part {
	height: 380px;
	width: 110px;
	float: right;
	padding:0px;
	margin:0px;
}
</style>
<title>标签云效果</title>
<script src="js/d3.js"></script>
<script src="js/d3.layout.cloud.js"></script>
<script type="text/javascript">
	/*
	function doit() {
		var data =*/
<%-- String array = (String) request.getAttribute("array");
			out.print("\"" + array.replace("\"", "'") + "\""); --%>
	/*;

		var jsonobject = eval('(' + data + ')');

		alert(jsonobject.length);
		var arr = new Array();
		for ( var i = 0; i < jsonobject.length; i++) {
			arr[i] = jsonobject[i].text;
		}
		var fill = d3.scale.category20();

		d3.layout.cloud().size([ 900, 500 ]).words(arr.map(function(d) {
			return {
				text : d,
				size : 10 + Math.random() * 60
			};
		})).padding(5).rotate(function() {
			return ~~(Math.random() * 2) * 90;
		}).font("Impact").fontSize(function(d) {
			return d.size;
		}).on("end", draw).start();

		function draw(words) {
			d3.select("#pos").append("svg").attr("width", 900).attr("height",
					500).append("g").attr("transform", "translate(150,150)")
					.selectAll("text").data(words).enter().append("text")
					.style("font-size", function(d) {
						return d.size + "px";
					}).style("font-family", "Impact").style("fill",
							function(d, i) {
								return fill(i);
							}).attr("text-anchor", "middle").attr(
							"transform",
							function(d) {
								return "translate(" + [ d.x, d.y ] + ")rotate("
										+ d.rotate + ")";
							}).text(function(d) {
						return d.text;
					});
		}
	};*/
</script>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/starter-template.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>

</head>
<body>
	<!-- 
	<input type="submit" value="点击" onclick="javascript:doit()" />
	<div id="d3" style="margin-top:20px;">
		<div id="pos" style="margin:20px auto; width:650px;"></div>
	</div>
	 -->
	<div class="bg">
		<div class='fill'>&nbsp;</div>
		<div class='btn-setting'>
			<a class="btn btn-link" style="color: rgb(255, 255, 255);"> <span
				class="glyphicon glyphicon-user"></span> 点这里，定制你的微词云 </a>
		</div>
		<!--微博图片-->
		<div class='fill2'>&nbsp;</div>
		<!-- 
		<div class="weibo-setting">
			<a href="http://weibo.com" target="_blank" title="进入微词云官方微博"><img
				src="27031_201208021533193.png">
			</a>
		</div>
 		-->
	</div>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">微词云</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#"><i class="icon-home"></i>主页</a>
					</li>
					<li><a href="#about">团队介绍</a></li>
					<li><a href="#contact">联系我们</a></li>
				</ul>
			</div>
		</div>

	</div>
	<!--中间的空格-->
	<div class="container">

		<!--生成区域-->
		<form class="well">
			<!--生成区域背景图片-->
			<div class="produce">
				<div id="left-part"></div>

				<div id="right-part">
					<!--生成按钮-->
					<div>
						<div class="fill3">&nbsp;</div>
						<div class="producebtn-setting">
							<a class="btn btn-primary btn-lg" title="点我生成微词云">生成</a>
						</div>
					</div>
					<!--保存按钮-->
					<div>

						<div class="savebtn-setting">
							<button class="btn btn-primary btn-lg" title="保存至本地"
								id="btnSaveAs" type="button" value="另存为上图" onclick="getimg()">保存</button>
						</div>
					</div>
					<!--分享按钮
					   <div>
					      <div class="fill5">&nbsp;</div>
					      <div class="sharebtn-setting btn-group">
					         <button class="btn btn-primary btn-lg dropdown-toggle" title="分享到" data-toggle="dropdown" href="#">
							    分享
								
							 </button>
							 <ul class="dropdown-menu">
							    <li><a href="#">QQ空间</a></li>
								
								<li><a href="#">微信</a></li>
								
								<li><a href="#">新浪微博</a></li>
							 </ul>
					      </div>
					   </div>
					   -->
				</div>

			</div>
		</form>
	</div>
	<div class="footer">
		<center>
			<p>
				© 2013-2014 thunlp, all rights reserved. 南京航空航天大学<strong> ·
				</strong>经济与管理学院
			</p>
			<p>
				<a href="">团队介绍</a> <a href="" target="_blank">联系我们</a>
			</p>
		</center>
	</div>

	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>

</body>
</body>
</html>