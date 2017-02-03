<%@ page contentType="text/html;UTF-8" language="java" %>

<%@page import="com.hwb.HelloWorldMessage" %>

<div align="center">
  <h2>Version FrontEnd: Version 69</h2>
  <h3>Version Back End: <%= (new HelloWorldMessage()).getMessage() %></h3>
  
  <h3>Ambiente: <%= (new HelloWorldMessage()).getEnvironment() %></h3>
  
  <img src="img/logo.png"/>
</div>