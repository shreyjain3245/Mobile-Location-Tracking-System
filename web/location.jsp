<%-- 
    Document   : location
    Created on : 8 Oct, 2017, 9:55:51 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nm=(String)session.getAttribute("uid");
    if(nm==null){
        response.sendRedirect("index.jsp");
    }
%>
<%
    ResultSet rs = (ResultSet)session.getAttribute("location");
    int count=0;
    //rs.beforeFirst();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="customepage.css" type="text/css"> 
    </head>
    <body>
    
        <table border="1" id="location">
            <thead>
                <tr>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Phone ID</th>
                    <th>Date-Time</th>
                </tr>
            </thead>
            <tbody>
                <%while(rs.next()&&count<10){%>
                <tr class="location">
                    <td><%=rs.getDouble(1)%></td>
                    <td><%=rs.getDouble(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                </tr>
                <%count++; } %>
            </tbody>    
        </table>
        <div id="map" style="width:100%;height:500px"></div>
 
<script>
  
  var lat =new Array(parseInt("<%=count%>"));
  var log =new Array(parseInt("<%=count%>"));
  
    for (i=1;i<=parseInt("<%=count%>");i++){  
       lat[i-1]=document.getElementById("location").rows[i].cells[0].innerHTML;
       log[i-1]=document.getElementById("location").rows[i].cells[1].innerHTML;
       console.log(lat+" "+log);//o
    }
    
function myMap() {
  var myCenter = new Array(parseInt("<%=count%>"));
  var marker=new Array(parseInt("<%=count%>"));
   
  for(i=0;i<parseInt("<%=count%>");i++){
   myCenter[i] = new google.maps.LatLng(lat[i],log[i]);//o
  }
  
  var mapCanvas = document.getElementById("map");
  var mapOptions = {center: myCenter[0], zoom: 15};
  var map = new google.maps.Map(mapCanvas, mapOptions);
   
  for(i=0;i<parseInt("<%=count%>");i++){
    
  marker[i] = new google.maps.Marker({position:myCenter[i]});//o
  marker[i].setMap(map);//o
  }

  google.maps.event.addListener(marker,'click',function() {
    map.setZoom(9);

    map.setCenter(marker[0].getPosition());
  });
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTFCUtr4qZ7fuMx74yNaKzHKrJAzpxz8c&callback=myMap"></script>
<a href="customerpage.jsp"><h4 id="yash"> Go back to customer page</h4></a>
 <%rs.beforeFirst();%>  
    </body>
</html>
