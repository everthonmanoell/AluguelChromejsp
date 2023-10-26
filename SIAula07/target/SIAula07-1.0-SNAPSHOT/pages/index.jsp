<%-- 
    Document   : login
    Created on : Sep 27, 2023, 6:45:41 PM
    Author     : ficr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Projeto</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>FICR!</h1>
        <form action="login.jsp" method="post">
            <label for="login">Login:</label>
            <input type="text" name="login" id="login"> <br>
            <label for="senha">Senha:</label>
            <input type="password" name="senha" id="senha" ><br>
            <%
                String erro = request.getParameter("erro");
                if(erro != null){
                    out.println("<spam>Login ou Senha errados!</spam><br>");
                }
            %>
            <button type="submit">Enviar</button>
        </form>
    </body>
</html>
