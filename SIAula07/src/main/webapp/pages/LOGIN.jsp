<%-- 
    Document   : login
    Created on : 1 de nov. de 2023, 23:29:08
    Author     : felipe
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
       Boolean tipo = controle.buscarUsuario(cpf, senha);
       if(tipo == true){
                response.sendRedirect("pages/home.jsp");
        }else{
           response.sendRedirect("../index.jsp?erro=true");
       }
        
        %>
    </body>
</html>
