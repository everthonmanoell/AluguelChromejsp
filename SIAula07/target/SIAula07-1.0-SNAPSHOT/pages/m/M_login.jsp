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
        <h1>Recebendo dados!</h1>
        <%
       String login = request.getParameter("login");
       
       String senha = request.getParameter("senha");
     
        
       ControleUsuario controle = ControleUsuario.getInstance();
       String tipo = controle.buscarUsuario(login, senha);
       if(tipo != null){
           if(tipo.equals("adm")){
                response.sendRedirect("homeAdm.jsp");
           }else{
                response.sendRedirect("home.jsp");
           }
           
       }else{
           response.sendRedirect("index.jsp?erro=true");
       }
        
        %>
    </body>
</html>
