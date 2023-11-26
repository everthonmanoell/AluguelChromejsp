<%-- 
    Document   : banco
    Created on : 26 de nov. de 2023, 08:32:51
    Author     : evert
--%>
<%@page import="usuario.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <h1>Hello World!</h1>
        <%
            Banco banco = new  Banco();
            out.println(banco.consulta());
        %>
    </body>
</html>
