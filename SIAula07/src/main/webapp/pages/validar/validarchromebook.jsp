<%-- 
    Document   : validarchromebook
    Created on : 26 de nov. de 2023, 09:10:41
    Author     : evert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.*"%>
<%@page import="usuario.ControleUsuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String tombamento = request.getParameter("tombamento");
           String situacao = request.getParameter("situacao");
           String descricao = request.getParameter("descricao");

           if (tombamento != null && situacao != null) {
               // Crie um objeto Chromebook apenas se os parâmetros não forem nulos
               Chromebook chromebook = new Chromebook(tombamento, situacao, descricao);

               // Adicione o Chromebook ao controle de usuários (ou ao controle específico de Chromebooks, se houver)
               ControleUsuario controle = ControleUsuario.getInstance();
               controle.adicionarChromebook(chromebook);

               response.sendRedirect("../cadastrochromebook.jsp");
           } else {
               // Caso os parâmetros sejam nulos, você pode redirecionar para uma página de erro ou fazer algo adequado.
               response.sendRedirect("../../error.jsp");
           }
        %>
    </body>
</html>

