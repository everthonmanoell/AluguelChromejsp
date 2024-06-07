<%-- 
    Document   : ...
    Created on : 07 de jun. de 2024, 14:59:21
    Author     : everthon manoel
--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Validar Agendamento</title>
</head>
<body>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="control.*"%>
<%@page import="model.*"%>

<%
                ControleBancoAgendar control = ControleBancoAgendar.getInstance();
                
                
                
                String matricula = request.getParameter("matricula");
                String data = request.getParameter("data");

                if (matricula != null) {
                    if(control.verificarAgendamento(matricula) > 0){
                        out.println("<script>alert('O aluno já possui um agendamento!');</script>");
                        
                        response.sendRedirect("../cadastraragendamento.jsp");
                    }else{

                        Agendar agendar = new Agendar(matricula, data);
                        control.inserirAgendamento(agendar);
                        out.println("<script>alert('Agendamento realizado com sucesso!');</script>");
                        response.sendRedirect("../cadastraragendamento.jsp");
                    }
                }  
 
        %>
</body>
</html>