<%-- 
    Document   : validarcadastro
    Created on : 1 de nov. de 2023, 21:15:11
    Author     : jose.serafim
--%>
<%@page import="usuario.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
           if(Sring id = request.getParameter("erro")!= null){
                String nomecompleto = request.getParameter("nomecompleto");
                String cpf = request.getParameter("cpf");
                String senha = request.getParameter("senha");

                 Usuario usr = new Usuario(nomecompleto, cpf, senha);

                ControleUsuario controle = ControleUsuario.getInstance();
                controle.adicionarUsuario(usr);
           
                response.sendRedirect("../index.jsp");

        }

        %>
        
    </body>
</html>
