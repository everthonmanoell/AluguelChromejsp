package control;
import java.sql.Connection;
import model.Conexao;
import model.*;
import model.Agendar;
import model.Aluguel;
import model.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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
        try {

            

            String sql = "INSERT INTO agendamento (matricula_aluno, dataAgendada, horaAgendada, situacao_agendamento, dataParaOAluguel) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, agendar.getMatricula_aluno());
            stmt.setString(2, agendar.getDataAgendada());
            stmt.setString(3, agendar.getHoraAgendada());
            stmt.setString(4, agendar.getSituacao_agendamento());
            stmt.setString(5, agendar.getDataParaOAluguel());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int verificarAgendamento(String matricula_aluno) {
        int qtd = 0;

        try {
            String consulta = "SELECT * FROM agendamento WHERE matricula_aluno = ? AND situacao_agendamento = 'agendado'";
            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, matricula_aluno);
            ResultSet resultado = stmt.executeQuery();

            while (resultado.next()) {
                qtd++;
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar a quantidade de Agendamentos.");
            return -1;
        }

        return qtd;
    }

    
    public String consultaAgendamentos() {
        StringBuilder texto = new StringBuilder();
    
        try {
            String consulta = "SELECT * FROM agendamento WHERE situacao_agendamento = 'agendado'";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);
    
            ;
    
            while (resultado.next()) {
                Agendar agendar = new Agendar(
                        resultado.getString("id"),
                        resultado.getString("matricula_aluno"));
    
                texto.append("<tr>")
                     .append("<td>").append(agendar.getMatricula_aluno()).append("</td>")
                     .append("<td>").append(agendar.getDataAgendada()).append("</td>")
                     .append("<td>").append(agendar.getHoraAgendada()).append("</td>")
                     .append("<td>").append(agendar.getSituacao_agendamento()).append("</td>")
                     .append("<td>").append(agendar.getDataParaOAluguel()).append("</td>")
                     .append("</tr>");
            }
    
            
            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados de Agendamento.");
            ex.printStackTrace();
        }
    
        return texto.toString();
    }
    

    public int quantidadeAgendamentos() {
        int qtd = 0;

        try {
            String consulta = "SELECT * FROM agendamento WHERE situacao_agendamento = 'agendado'";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                qtd++;
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar a quantidade de Agendamentos.");
            return -1;
        }

        return qtd;
    }

    public void alterarSituacaoAgendamento(String matricula_aluno) {
        try {
            String sql = "UPDATE agendamento SET situacao_agendamento = ? WHERE matricula_aluno = ? AND situacao_agendamento = 'agendado'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "concluido");
            stmt.setString(2, matricula_aluno);
    
            int rowsAffected = stmt.executeUpdate(); // Retorna o número de linhas afetadas
    
            if (rowsAffected == 0) {
                System.out.println("Nenhum registro foi atualizado para a matrícula: " + matricula_aluno);
            }
    
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    String listarPesquisaAgendamento(String matricula_aluno) {
        StringBuilder texto = new StringBuilder();

        try {
            String consulta = "SELECT * FROM agendamento WHERE matricula_aluno = ? AND situacao_agendamento = 'agendado'";
            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, matricula_aluno);
            ResultSet resultado = stmt.executeQuery();

            while (resultado.next()) {
                Agendar agendar = new Agendar(
                        resultado.getString("matricula_aluno"),
                        resultado.getString("fk_id_aluno"));
                agendar.setId(resultado.getString("id"));
                agendar.setDataAgendada(resultado.getString("dataAgendada"));
                agendar.setHoraAgendada(resultado.getString("horaAgendada"));

                texto.append("<tr>")
                        .append("<td>").append(agendar.getId()).append("</td>")
                        .append("<td>").append(agendar.getMatricula_aluno()).append("</td>")
                        .append("<td>").append(agendar.getDataAgendada()).append("</td>")
                        .append("<td>").append(agendar.getHoraAgendada()).append("</td>")
                        .append("<td>").append(agendar.getFk_id_aluno()).append("</td>")
                        .append("<td>").append(agendar.getFk_id_aluguel()).append("</td>")
                        .append("</tr>");
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados de Agendamento.");
            ex.printStackTrace();
        }

        return texto.toString();
    }
    

    


}
