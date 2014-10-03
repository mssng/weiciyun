<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>标签云效果</title>
<script src="js/d3.js"></script>
<script src="js/d3.layout.cloud.js"></script>
<script type="text/javascript">
	function doit() {
		var data =
		<%
			String array = (String) request.getAttribute("array");
			out.print("\"" + array.replace("\"", "'") + "\"");
		%>;

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
	};
</script>

</head>
<body style="border:0; padding:0; margin: 0;">
	<input type="submit" value="点击" onclick="javascript:doit()" />
	<div id="d3" style="margin-top:20px;">
		<div id="pos" style="margin:20px auto; width:650px;"></div>
	</div>
</body>
</html>