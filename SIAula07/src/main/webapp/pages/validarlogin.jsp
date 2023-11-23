<%-- 
    Document   : login
    Created on : Sep 27, 2023, 6:45:41 PM
    Author     : ficr
--%>

<%@page import="usuario.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto</title>
    </head>
    <body>
        
        <%
       String cpf = request.getParameter("cpf");
       
       String senha = request.getParameter("senha");
     
        
       ControleUsuario controle = ControleUsuario.getInstance();
    
       if( controle.buscarUsuario(cpf, senha)){
                response.sendRedirect("HOME.jsp");
        }else{
           response.sendRedirect("../index.jsp?erro=true");
       }
        
        %>
    </body>
</html>
