<%--
    Document   : pesquisarAgendados
    Created on : 08 de julh. de 2024, 08:09:11
    Author     : Everthon Manoel
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="control.*"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
           String pesquisa = request.getParameter("pesquisa");
           
           if(pesquisa == null || pesquisa.isEmpty()){
           response.sendRedirect("../agendamentos.jsp");
           }else{
           response.sendRedirect("../agendamentos.jsp?pesquisa=" + pesquisa);
           }
           
           
        %>
        
    </body>
</html>
