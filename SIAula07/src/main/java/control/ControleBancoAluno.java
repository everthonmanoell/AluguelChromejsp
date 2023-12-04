package control;

import model.Aluno;
import model.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class ControleBancoAluno {

    private Conexao conexao;
    private Connection conn;

    private static ControleBancoAluno instancia = null;

    private ControleBancoAluno() {
        this.conexao = new Conexao();
        this.conn = conexao.getConnection();
    }

    public static ControleBancoAluno getInstance() {
        if (instancia == null) {
            instancia = new ControleBancoAluno();
        }
        return instancia;
    }

    public Aluno getAluno(String id) {
        Aluno aluno = null;

        try {
            String consulta = "SELECT * FROM aluno WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, id);

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                aluno = new Aluno(
                        resultado.getString("nome"),
                        resultado.getString("matricula"),
                        resultado.getString("turno"),
                        resultado.getString("periodo"),
                        resultado.getString("turma"),
                        resultado.getString("curso")
                );
                aluno.setId(resultado.getString("id"));
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados do Aluno.");
        }

        return aluno;
    }

    public void alterarAluno(String id, String nome, String matricula, String turno, String periodo, String turma, String curso) {
        try {
            String sql = "UPDATE aluno SET nome = ?, matricula = ?, turno = ?, periodo = ?, turma = ?, curso = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, nome);
            stmt.setString(2, matricula);
            stmt.setString(3, turno);
            stmt.setString(4, periodo);
            stmt.setString(5, turma);
            stmt.setString(6, curso);
            stmt.setString(7, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu alterar os dados do Aluno.");
        }
    }

    public String listarDadosAluno() {
        StringBuilder texto = new StringBuilder();

        try {
            String consulta = "SELECT * FROM aluno";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                Aluno aluno = new Aluno(
                        resultado.getString("nome"),
                        resultado.getString("matricula"),
                        resultado.getString("turno"),
                        resultado.getString("periodo"),
                        resultado.getString("turma"),
                        resultado.getString("curso")
                );
                aluno.setId(resultado.getString("id"));

                texto.append("<tr>")
                        .append("<td>").append(aluno.getId()).append("</td>")
                        .append("<td>").append(aluno.getNome()).append("</td>")
                        .append("<td>").append(aluno.getMatricula()).append("</td>")
                        .append("<td>").append(aluno.getTurno()).append("</td>")
                        .append("<td>").append(aluno.getPeriodo()).append("</td>")
                        .append("<td>").append(aluno.getTurma()).append("</td>")
                        .append("<td>").append(aluno.getCurso()).append("</td>")
                        .append("<td>")
                        .append("<a href=\"cadastroaluno.jsp?id=").append(aluno.getId()).append("\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>")
                        .append("<a href=\"validar/excluiraluno.jsp?id=").append(aluno.getId()).append("\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n")
                        .append("</td>")
                        .append("</tr>");
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados dos Alunos.");
        }

        return texto.toString();
    }

    public int listarQuantidadeAluno() {
        int qtd = 0;

        try {
            String consulta = "SELECT * FROM aluno";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                qtd++;
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar a quantidade de Alunos.");
        }

        return qtd;
    }

    public void adicionarAluno(Aluno aluno) {
        String sql = "INSERT INTO aluno (nome, matricula, turno, periodo, turma, curso) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setString(3, aluno.getTurno());
            stmt.setString(4, aluno.getPeriodo());
            stmt.setString(5, aluno.getTurma());
            stmt.setString(6, aluno.getCurso());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void excluirAluno(String id) {
        try {
            String sql = "DELETE FROM aluno WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu excluir o Aluno.");
        }
    }
}
