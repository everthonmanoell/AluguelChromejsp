<%-- 
    Document   : validarchromebook
    Created on : 30 de nov. de 2023, 09:29:41
    Author     : Everthon Manoel
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
                ControleBancoAluguel control = ControleBancoAluguel.getInstance();
                
                String id = request.getParameter("id");
                
                
                
                String matriculaCoordenador = request.getParameter("matriculaCoordenador");
                String matriculaAluno = request.getParameter("matriculaAluno");
                String tombamento = request.getParameter("tombamento");
                String situacaochromebook = request.getParameter("situacaochromebook");
                String datainicio = request.getParameter("datainicio");
                String horainicio = request.getParameter("horainicio");
                String datatermino = request.getParameter("datatermino");
                String horatermino = request.getParameter("horatermino");
                String nomealuno = request.getParameter("nomealuno");
                
    
            if (id != null) {
                control.alterarAluguel(id, situacaochromebook, horatermino, datatermino);
                response.sendRedirect("../devolucao.jsp");


            } else if (matriculaCoordenador != null){
            
                Aluguel aluguel = new Aluguel(nomealuno, matriculaCoordenador, matriculaAluno, tombamento, situacaochromebook, datainicio, horainicio );
                control.adicionarAluguel(aluguel);
                response.sendRedirect("../aluguel.jsp");
                
            }else{
            
            response.sendRedirect("../error.jsp");
            }
        %>


    </body>
</html>

