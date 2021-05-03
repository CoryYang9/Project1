<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import = "com.example.Entity.AnnotationEntity" %>

<!DOCTYPE html>
<html>
<head>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-196175239-1%22%3E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-196175239-1');
</script>
<meta charset="ISO-8859-1">
<title>Image Story Teller</title>
<style type="text/css">
	.div-1 {
	        background-color: #E7CACA;
	        opacity: 0.5;
	    } 
	    .div-2 {
	        background-color: #E7CACA;
	    } 
</style>
</head>
<body>

<div align="center">
<div class="div-1" align="center" >
	<h1>Image Story Teller Application</h1>
</div>
<table>
	<tr>
		<td>
			<img alt="" src="<%= request.getAttribute("ImageUrl") %>" width="450" height = "350">
			
		</td>
		<td>
			<table width="500" align="center">
		         <tr bgcolor="#F1CCAC" align="center">
		          <th><b>Label</b></th>
		          <th><b>Percentage</b></th>
		         </tr>
		         <% ArrayList<AnnotationEntity> labelList = new ArrayList<AnnotationEntity>();
		         labelList=(ArrayList<AnnotationEntity>)request.getAttribute("labelList");
		         for(AnnotationEntity l:labelList){%>
		          <tr bgcolor="#fbeed1" align="center">
		                <td><%=l.getLabel() %></td>
		                <td><%=l.getScore() %></td>
		                
		          </tr>
		            <%}%>
 			</table>
 			<div class="div-2">
			<h3>Story:</h3>
			<div><%= request.getAttribute("ImageStory") %></div>
			</div>
		</td>
	</tr>
</table>

</div>    
</body>
</html>