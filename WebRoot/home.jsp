<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>微词云</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/starter-template.css" rel="stylesheet">

<link rel="icon" href="images/favicon.ico">

<!-- 页面 CSS -->
<link href="css/global.css" rel="stylesheet">

<script src="js/d3.js"></script>
<script src="js/d3.layout.cloud.js"></script>
<script src="js/global.js"></script>
<script type="text/javascript">
	function doit() {
		var data =
<%String array = (String) request.getAttribute("array");
			out.print("\"" + array.replace("\"", "'") + "\"");%>
	;

		var o = document.getElementById("main");
		var h = o.scrollHeight; //高度
		var w = o.scrollWidth; //宽度

		var jsonobject = eval('(' + data + ')');

		var colors = [ "rgb(9, 147, 134)", "rgb(255, 171, 32)",
				"rgb(97, 84, 255)" ];

		alert(colors[1]);

		alert(jsonobject.length);
		var arr = new Array();
		for ( var i = 0; i < jsonobject.length; i++) {
			arr[i] = jsonobject[i].text;
		}
		var fill = d3.scale.category20();

		d3.layout.cloud().size([ w, h ]).words(arr.map(function(d) {
			return {
				text : d,
				size : 10 + Math.random() * 60
			};
		})).padding(10).rotate(function() {
			return ~~(Math.random() * 2) * 90;
		}).font("Impact").fontSize(function(d) {
			return d.size;
		}).on("end", draw).start();

		/*function draw(words) {
			d3.select("#main").append("svg").attr("width", w).attr("height",
					h).append("g").attr("transform", "translate(150,150)")
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
		}*/

		function GetRandomNum(Min, Max) {
			var Range = Max - Min;
			var Rand = Math.random();
			return (Min + Math.round(Rand * Range));
		}

		alert(d3.selectAll("#main svg")[0].length);
		function draw(words) {
			
			if (d3.selectAll("#main svg")[0].length != 0) {
				d3.select("#main").html("");
			}
			
			d3.select("#main").append("svg").attr("width", w).attr(
						"height", h).append("g").attr("transform", function() {
					return "translate(" + w / 2 + "," + h / 2 + ")";
				}).selectAll("text").data(words).enter().append("text").style(
						"font-size", function(d) {
							return d.size + "px";
						}).style("font-family", "Impact").style("fill",
						function() {
							var val = GetRandomNum(0, 2);
							return colors[val];
						}).attr("text-anchor", "middle").attr(
						"transform",
						function(d) {
							return "translate(" + [ d.x, d.y ] + ")rotate("
									+ d.rotate + ")";
						}).text(function(d) {
					return d.text;
				});
		}
		;
		d3.select("#main svg").attr("style","background-color:rgb(0,0,0)");
	};
	function test() {
		var o = document.getElementById("main");
		var h = o.scrollHeight; //高度
		var w = o.scrollWidth; //宽度
		alert(h);
		alert(w);
	}

	window.onload = function() {
		doit();
	}
</script>
</head>
<body>
	<div class="bg">
		<div class='clk'>
			<a href="#" onclick="javascript:test()">点这里，定制你的微词云</a>
		</div>
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
					<li><a href="#about">团队介绍</a>
					</li>
					<li><a href="#contact">联系我们</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--中间的空格-->
	<div class="container">
		<div class="content">
			<!--生成区域-->
			<form action="#" method="post">
				<!-- 主要显示区域 -->
				<div id="main"></div>

				<!-- 侧边栏区域 -->
				<div id="side">
					<p>
						<a class="btn btn-primary btn-lg" title="点我生成微词云"
							onclick="javascript:doit()">生成</a>
					</p>
					<p>
						<a class="btn btn-primary btn-lg" title="点我生成微词云">保存</a>
					</p>
				</div>
			</form>
		</div>
	</div>

	</div>
	<div class="footer">
		<center>
			<p>
				2013-2014 thunlp, all rights reserved. 南京航空航天大学<strong> · </strong>经济与管理学院
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

</body>
</html>