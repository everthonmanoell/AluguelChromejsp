<%--
    Document   : validarcadastro
    Created on : 1 de nov. de 2023, 21:15:11
    Author     : jose.serafim
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
           response.sendRedirect("../devolucao.jsp");
           }else{
           response.sendRedirect("../devolucao.jsp?pesquisa=" + pesquisa);
           /*request.setAttribute("pesquisa", pesquisa);
           request.getRequestDispatcher("../devolucao.jsp").forward(request, response);*/

           }
           
           
        %>
        
    </body>
</html>
