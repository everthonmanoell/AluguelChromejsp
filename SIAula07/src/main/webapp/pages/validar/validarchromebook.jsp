<%-- 
    Document   : validarchromebook
    Created on : 26 de nov. de 2023, 09:10:41
    Author     : evert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            String id = request.getParameter("id");
            String tombamento = request.getParameter("tombamento");
            String situacao = request.getParameter("situacao");
            String descricao = request.getParameter("descricao");
            

            ControleBancoChromebook control = ControleBancoChromebook.getInstance();

            if (id != null) {
                control.alterarChromebook(id, tombamento, situacao, descricao);
                response.sendRedirect("../relatoriochromebook.jsp");
            } else if (tombamento != null && situacao != null){
                Chromebook chromebook = new Chromebook(tombamento, situacao, descricao);
                control.adicionarChromebook(chromebook);
                response.sendRedirect("../cadastrochromebook.jsp");
            } else {
                response.sendRedirect("../../error.jsp");
            }
        %>

    </body>
</html>

