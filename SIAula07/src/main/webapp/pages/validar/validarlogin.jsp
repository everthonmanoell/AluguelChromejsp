<%-- 
    Document   : validarlogin
    Created on : Sep 27, 2023, 6:45:41 PM
    Author     : Everthon Manoel
--%>

<%@page import="control.*"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Projeto</title>
</head>
<body>
    
   
    
    <%
        String matricula = request.getParameter("matricula");
        String senha = request.getParameter("senha");
     
        
       ControleUsuario controle = ControleUsuario.getInstance();
    
       if( controle.buscarUsuario(matricula, senha)){
            response.sendRedirect("../home.jsp");
        }else{
            response.sendRedirect("../../index.jsp?erro=true");
       }
        
    %>
</body>
</html>
