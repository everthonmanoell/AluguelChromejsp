<%--
    Document   : validarcadastro
    Created on : 1 de nov. de 2023, 21:15:11
    Author     : jose.serafim
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="usuario.*"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
           // Parâmetros para comparação de onde vem o cadastro 
           String cad = request.getParameter("cad");
          
           
           // Parâmetros do cadastro coordenador
           String id = request.getParameter("id");
           String nomecompleto = request.getParameter("nomecompleto");
           String matricula = request.getParameter("matricula");
           String senha = request.getParameter("senha");
             
           // Instanciamento de objeto de ControleUsuario        
           ControleUsuario controle = ControleUsuario.getInstance();
           
           if (cad != null) {
               Usuario usr = new Usuario(id, nomecompleto, matricula, senha);
               controle.adicionarUsuario(usr);
               response.sendRedirect("../cadastrocoordenador.jsp");
           } else if (id != null) {
               controle.alterarUsuario(id, nomecompleto, matricula, senha);
               response.sendRedirect("../relatoriocoordenador.jsp");
           } else if (cad == null){
                Usuario usr = new Usuario(id, nomecompleto, matricula, senha);
                controle.adicionarUsuario(usr);
                response.sendRedirect("../../index.jsp");
           } else {
                response.sendRedirect("../../error.jsp");
           }
        %> 
        
    </body>
</html>
