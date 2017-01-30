<%@ page contentType="text/html;UTF-8" language="java" %>

<%@page import="com.hwb.HelloWorldMessage" %>

<div align="center">
  <h2>Version FrontEnd: Version 64!</h2>
  <h3>Version Back End: Version <%= (new HelloWorldMessage()).getMessage() %></h3>
  <img src="img/logo.png"/>
</div>