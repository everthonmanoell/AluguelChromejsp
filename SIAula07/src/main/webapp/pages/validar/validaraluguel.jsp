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
                ControleAluguel controle = ControleAluguel.getInstance();
                
                String id = request.getParameter("id");
                String devolver = request.getParameter("devolver");
                
                
                String matriculaCoordenador = request.getParameter("matriculaCoordenador");
                String matriculaAluno = request.getParameter("matriculaAluno");
                String tombamento = request.getParameter("tombamento");
                String situacaochromebook = request.getParameter("situacaochromebook");
                String dataaluguel = request.getParameter("dataaluguel");
                String horainicio = request.getParameter("horainicio");
                String datatermino = request.getParameter("datatermino");
                String horatermino = request.getParameter("horatermino");
                
    
            if (devolver != null) {
                controle.alterarAluguel(id, situacaochromebook, horatermino, datatermino);
                response.sendRedirect("../devolucao.jsp");


            } else if (id != null){
            
                Aluguel aluguel = new Aluguel(id, matriculaCoordenador, matriculaAluno, tombamento, situacaochromebook, dataaluguel, horainicio, datatermino, horatermino);
                controle.adicionarAluguel(aluguel);
                response.sendRedirect("../aluguel.jsp");
                
            }else{
            
            response.sendRedirect("../error.jsp");
            }
        %>


    </body>
</html>

