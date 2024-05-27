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
           // Parâmetros para comparação de onde vem o cadastro 
           String cad = request.getParameter("cad");
           String iniid = request.getParameter("iniid");
           
           // Parâmetros do cadastro coordenador
           String id = request.getParameter("id");
           String nomecompleto = request.getParameter("nomecompleto");
           String matricula = request.getParameter("matricula");
           String senha = request.getParameter("senha");
             
           // Instanciamento de objeto de ControleUsuario        
           
           ControleBancoUsuario control = ControleBancoUsuario.getInstance(); 
           
           
           if (iniid != null){
                /*Usuario usr = new Usuario(iniid, nomecompleto, matricula, senha);
                controle.adicionarUsuario(usr);*/
                
                Usuario us = new Usuario(matricula, nomecompleto, senha);
                control.adicionar(us);
                
                response.sendRedirect("../../index.jsp");
            }else if (cad != null) {
                Usuario us = new Usuario(matricula, nomecompleto, senha);
                control.adicionar(us);
               response.sendRedirect("../cadastrocoordenador.jsp");
           } else if (id != null) {
               control.alterarUsuario(id, nomecompleto, matricula, senha);
               response.sendRedirect("../relatoriocoordenador.jsp");
           } else {
                response.sendRedirect("../../error.jsp");
           }
        %>
        
    </body>
</html>
