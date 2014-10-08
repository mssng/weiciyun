<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="test.OAuth4Code" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'MyJsp.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script src="js/d3.js"></script>
<script src="js/d3.layout.cloud.js"></script>
	

  </head>

  <body>
    This is my JSP page. <br>
    <div id="main">
		
         
	         <img src="images/main.png">
	    
		 
		</div>
		<script>
	


function drawcloud(){

	var canvas=document.getElementById("main");//云区域
	var myWidth = canvas.scrollWidth; //宽度
	var myHeight = canvas.scrollHeight; //高度
	var colors = [ "rgb(9, 147, 134)", "rgb(255, 171, 32)",//自定义颜色
				"rgb(97, 84, 255)" ];
	
	alert("高度："+myHeight+" "+"宽度："+myWidth+" "+"颜色："+colors[0]);
	
	var fill = d3.scale.category20();

  d3.layout.cloud().size([myWidth, myHeight])
      .words([
        "Hello", "world", "normally", "you", "want", "more", "words",
        "than", "this"].map(function(d) {
        return {text: d, size: 10 + Math.random() * 90};
      }))
      .padding(10)
      .rotate(function() { return ~~(Math.random() * 2) * 90; })
      .font("Impact")
      .fontSize(function(d) { return d.size; })
      .on("end", draw)
      .start();
      
      d3.select("#main svg").attr("style","background-color:rgb(0,0,0)");//设置背景色
	
	
	
	  function draw(words) {
	  
	if (d3.selectAll("#main svg")[0].length != 0) {
				d3.select("#main").html("");}
			
			
    d3.select("#main").append("svg")
        .attr("width", myWidth)
        .attr("height", myHeight)
      .append("g")
        .attr("transform", "translate(" + myWidth / 2 + "," + myHeight / 2 + ")")
      .selectAll("text")
        .data(words)
      .enter().append("text")
        .style("font-size", function(d) { return d.size + "px"; })
        .style("font-family", "Impact")
        .style("fill", function(d, i) { return fill(i); })
        .attr("text-anchor", "middle")
        .attr("transform", function(d) {
          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
        })
        .text(function(d) { return d.text; });
        
  }
  
}
  
 
</script>
 <button type="button" id="generate" onclick="drawcloud()" class="btn btn-primary btn-lg" title="点我生成微词云">生成</button>
  </body>
</html>
