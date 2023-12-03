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
        String nome = request.getParameter("nome");
        String matricula = request.getParameter("matricula");
        String turno = request.getParameter("turno");
        String periodo = request.getParameter("periodo");
        String turma = request.getParameter("turma");
        String op = request.getParameter("op");

        ControleAluno controle = ControleAluno.getInstance();

        if (op != null) {
            // Adicionar novo aluno
            Aluno aluno = new Aluno(id, nome, matricula, turno, periodo, turma);
            controle.adicionarAluno(aluno);
            response.sendRedirect("../cadastroaluno.jsp");
        } else if (id != null) {
            controle.alterarAluno(id, nome, matricula, turno, periodo, turma);
            response.sendRedirect("../relatorioaluno.jsp");
        } else {
            // Redirecionar para página de erro se op não é "true" nem "E"
            response.sendRedirect("../error.jsp");
        }
    %>
</body>
</html>
