package control;

import java.sql.Connection;
import model.Conexao;
import model.Agendar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ControleBancoAgendar {
    private Conexao conexao;
    private Connection conn;

    private static ControleBancoAgendar instancia = null;

    private ControleBancoAgendar() {
        this.conexao = new Conexao();
        this.conn = conexao.getConnection();
    }

    public static ControleBancoAgendar getInstance() {
        if (instancia == null) {
            instancia = new ControleBancoAgendar();
        }
        return instancia;
    }

    public void inserirAgendamento(Agendar agendar) {
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO agendamento (matricula_aluno, dataAgendada, horaAgendada, situacao_agendamento, dataParaOAluguel) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, agendar.getMatricula_aluno());
            stmt.setString(2, agendar.getDataAgendada());
            stmt.setString(3, agendar.getHoraAgendada());
            stmt.setString(4, agendar.getSituacao_agendamento());
            stmt.setString(5, agendar.getDataParaOAluguel());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Um novo agendamento foi inserido com sucesso!");
            } else {
                System.out.println("Nenhum agendamento foi inserido.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public int verificarAgendamento(String matricula_aluno) {
        int qtd = 0;
        PreparedStatement stmt = null;
        ResultSet resultado = null;

        try {
            String consulta = "SELECT * FROM agendamento WHERE matricula_aluno = ? AND situacao_agendamento = 'agendado'";
            stmt = conn.prepareStatement(consulta);
            stmt.setString(1, matricula_aluno);
            resultado = stmt.executeQuery();

            while (resultado.next()) {
                qtd++;
            }
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar a quantidade de Agendamentos.");
            return -1;
        } finally {
            try {
                if (resultado != null) resultado.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return qtd;
    }

    public String consultarAgendamentos() {
        String texto = "";
    
        try {
            String consulta = "SELECT * FROM agendamento WHERE situacao_agendamento = 'agendado'";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);
    
            while (resultado.next()) {
                Agendar agendar = new Agendar(
                    resultado.getString("id"),
                    resultado.getString("matricula_aluno")
                );
                agendar.setDataAgendada(resultado.getString("dataAgendada"));
                agendar.setHoraAgendada(resultado.getString("horaAgendada"));
                agendar.setDataParaOAluguel(resultado.getString("dataParaOAluguel"));
    
                texto = texto
                    + "<tr>"
                    + "<td>" + agendar.getMatricula_aluno() + "</td>"
                    + "<td>" + agendar.getDataAgendada() + "</td>"
                    + "<td>" + agendar.getHoraAgendada() + "</td>"
                    + "<td>" + agendar.getDataParaOAluguel() + "</td>"
                    + "</tr>";
            }
    
            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados de Agendamento.");
        }
    
        return texto;
    }
    
    

    public int quantidadeAgendamentos() {
        int qtd = 0;
        Statement stm = null;
        ResultSet resultado = null;

        try {
            String consulta = "SELECT * FROM agendamento WHERE situacao_agendamento = 'agendado'";
            stm = conn.createStatement();
            resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                qtd++;
            }
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar a quantidade de Agendamentos.");
            return -1;
        } finally {
            try {
                if (resultado != null) resultado.close();
                if (stm != null) stm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return qtd;
    }

    public void alterarSituacaoAgendamento(String matricula_aluno) {
        PreparedStatement stmt = null;
        try {
            String sql = "UPDATE agendamento SET situacao_agendamento = ? WHERE matricula_aluno = ? AND situacao_agendamento = 'agendado'";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "concluido");
            stmt.setString(2, matricula_aluno);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Nenhum registro foi atualizado para a matrícula: " + matricula_aluno);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public String listarPesquisaAgendamentos(String pesquisa) {
        StringBuilder texto = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet resultado = null;
    
        try {
            String consulta = "SELECT * FROM agendamento WHERE matricula_aluno LIKE ? OR dataAgendada LIKE ? OR horaAgendada LIKE ? OR dataParaOAluguel LIKE ? AND situacao_agendamento = 'agendado'";
            stmt = conn.prepareStatement(consulta);
            String searchPattern = "%" + pesquisa + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            stmt.setString(3, searchPattern);
            stmt.setString(4, searchPattern);
            resultado = stmt.executeQuery();
    
            while (resultado.next()) {
                Agendar agendar = new Agendar(
                    resultado.getString("id"),
                    resultado.getString("matricula_aluno")
                );
                agendar.setDataAgendada(resultado.getString("dataAgendada"));
                agendar.setHoraAgendada(resultado.getString("horaAgendada"));
                agendar.setDataParaOAluguel(resultado.getString("dataParaOAluguel"));
    
                texto.append("<tr>")
                    .append("<td>").append(agendar.getMatricula_aluno()).append("</td>")
                    .append("<td>").append(agendar.getDataAgendada()).append("</td>")
                    .append("<td>").append(agendar.getHoraAgendada()).append("</td>")
                    .append("<td>").append(agendar.getDataParaOAluguel()).append("</td>")
                    .append("</tr>");
            }
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados de Agendamento.");
            ex.printStackTrace();
        } finally {
            try {
                if (resultado != null) resultado.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
        return texto.toString();
    }
    
}
