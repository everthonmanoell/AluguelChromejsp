<%-- 
    Document   : validar
    Created on : Oct 4, 2023, 7:37:32 PM
    Author     : ficr
--%>
<%@page import="usuario.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar</title>
    </head>
    <body>
        <%
           String nomecompleto = request.getParameter("nomecompleto");
           String cpf = request.getParameter("cpf");
           String senha = request.getParameter("senha");

           // Verifica se todos os campos do formulário foram preenchidos
           if (nomecompleto != null && cpf != null && senha != null) {
               Usuario usr = new Usuario(nomecompleto, cpf, senha);

               ControleUsuario controle = ControleUsuario.getInstance();
               controle.adicionarUsuario(usr);
        
                // Redirecione o usuário para "HOME.jsp" --
                
               response.sendRedirect("HOME.jsp");
                
        
           } else {
        
               out.println("<spam>Precisa preencher os dados corretamente!</spam><br>");

        
           }
        %>

    </body>
</html>