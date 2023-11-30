<%-- 
    Document   : validarchromebook
    Created on : 30 de nov. de 2023, 09:29:41
    Author     : Everthon Manoel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <%@page import="usuario.ControleAluguel"%>

        <%
            String id = request.getParameter("id");
            ControleAluguel controle = ControleAluguel.getInstance();
    
            if (id != null) {
                String matricula = request.getParameter("matricula");
                String tombamento = request.getParameter("tombamento");
                String situacaochromebook = request.getParameter("situacaochromebook");
                String dataaluguel = request.getParameter("dataaluguel");
                String horainicio = request.getParameter("horainicio");
                String datatermino = request.getParameter("datatermino");
                String horatermino = request.getParameter("horatermino");

                Aluguel aluguel = new Aluguel(id, matricula, tombamento, situacaochromebook, dataaluguel, horainicio, datatermino, horatermino);
                controle.adicionarAluguel(aluguel);
                response.sendRedirect("../aluguel.jsp");
            } else {
                out.println("Não conseguiu adicionar!");
            }
        %>


    </body>
</html>

