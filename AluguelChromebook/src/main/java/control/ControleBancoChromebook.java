package control;

import model.Conexao;
import model.Chromebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ControleBancoChromebook {

    private Conexao conexao;
    private Connection conn;

    private static ControleBancoChromebook instancia = null;

    private ControleBancoChromebook() {
        this.conexao = new Conexao();
        this.conn = conexao.getConnection();
    }

    public static ControleBancoChromebook getInstance() {
        if (instancia == null) {
            instancia = new ControleBancoChromebook();
        }
        return instancia;
    }

    public Chromebook getChromebook(String id) {
        Chromebook chromebook = null;

        try {
            String consulta = "SELECT * FROM chromebook WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, id);

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                chromebook = new Chromebook(
                        resultado.getString("tombamento"),
                        resultado.getString("situacao"),
                        resultado.getString("descricao"),
                        resultado.getString("estadoChromebook"));
                chromebook.setId(resultado.getString("id"));
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados do Chromebook.");
        }

        return chromebook;
    }

    public void alterarChromebook(String id, String tombamento, String situacao, String descricao) {
        try {
            String sql = "UPDATE chromebook SET tombamento = ?, situacao = ?, descricao = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, tombamento);
            stmt.setString(2, situacao);
            stmt.setString(3, descricao);
            stmt.setString(4, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu alterar os dados do Chromebook.");
        }
    }

    public void alterarEstadoChromebook(String id, String estadoChromebook) {
        try {
            String sql = "UPDATE chromebook SET estadoChromebook = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, estadoChromebook);
            stmt.setString(2, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu alterar o estado do Chromebook.");
        }
    }

    public String listarDadosChromebook() {
        StringBuilder texto = new StringBuilder();

        try {
            String consulta = "SELECT * FROM chromebook";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                Chromebook chromebook = new Chromebook(
                        resultado.getString("tombamento"),
                        resultado.getString("situacao"),
                        resultado.getString("descricao"),
                        resultado.getString("estadoChromebook"));
                chromebook.setId(resultado.getString("id"));

                texto.append("<tr>")
                        .append("<td>").append(chromebook.getId()).append("</td>")
                        .append("<td>").append(chromebook.getTombamento()).append("</td>")
                        .append("<td>").append(chromebook.getSituacao()).append("</td>")
                        .append("<td>").append(chromebook.getDescricao()).append("</td>")
                        .append("<td>")
                        .append("<a href=\"cadastrochromebook.jsp?id=").append(chromebook.getId())
                        .append("\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>")
                        .append("<a href=\"validar/excluirchromebook.jsp?id=").append(chromebook.getId())
                        .append("\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n")
                        .append("</td>")
                        .append("</tr>");
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados dos Chromebooks.");
        }

        return texto.toString();
    }

    public int contarChromebooksComPesquisa(String parametro) {
        int contador = 0;

        if (!parametro.isEmpty()) {
            try {
                String consulta = "SELECT COUNT(*) FROM chromebook " +
                        "WHERE tombamento LIKE ? OR situacao LIKE ? OR descricao LIKE ?";
                PreparedStatement stmt = conn.prepareStatement(consulta);
                for (int i = 1; i <= 4; i++) {
                    stmt.setString(i, "%" + parametro + "%");
                }

                ResultSet resultado = stmt.executeQuery();

                if (resultado.next()) {
                    contador = resultado.getInt(1);
                }

                stmt.close();
            } catch (SQLException ex) {
                System.out.println("Não conseguiu contar os chromebooks com pesquisa.");
                ex.printStackTrace();
            }
        }

        return contador;
    }

    public String listarPesquisaChromebook(String pesquisa) {
        StringBuilder texto = new StringBuilder();

        try {
            String consulta = "SELECT * FROM chromebook";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                String tombamento = resultado.getString("tombamento");
                String situacao = resultado.getString("situacao");

                if (tombamento.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1
                        || situacao.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1) {
                    Chromebook chromebook = new Chromebook(
                            resultado.getString("tombamento"),
                            resultado.getString("situacao"),
                            resultado.getString("descricao"), situacao);
                            resultado.getString("estadoChromebook");
                    chromebook.setId(resultado.getString("id"));

                    texto.append("<tr>")
                            .append("<td>").append(chromebook.getId()).append("</td>")
                            .append("<td>").append(chromebook.getTombamento()).append("</td>")
                            .append("<td>").append(chromebook.getSituacao()).append("</td>")
                            .append("<td>").append(chromebook.getDescricao()).append("</td>")
                            .append("<td>").append(chromebook.getEstadoChromebook()).append("</td>")
                            .append("<td>")
                            .append("<a href=\"cadastrochromebook.jsp?id=").append(chromebook.getId())
                            .append("\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>")
                            .append("<a href=\"validar/excluirchromebook.jsp?id=").append(chromebook.getId())
                            .append("\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n")
                            .append("</td>")
                            .append("</tr>");
                }
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados dos Chromebooks.");
        }

        return texto.toString();
    }

    public int listarQuantidadeChromebook() {
        int qtd = 0;

        try {
            String consulta = "SELECT * FROM chromebook";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                qtd++;
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar a quantidade de Chromebooks.");
        }

        return qtd;
    }

    public int listarQuantidadeChromebookDisponivel() {
        int qtd = 0;

        try {
            String consulta = "SELECT * FROM chromebook WHERE situacao = 'Operante' AND estadoChromebook = 'alugado'";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                qtd++;
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar a quantidade de Chromebooks disponíveis.");
        }

        return qtd;
    }

    public void adicionarChromebook(Chromebook chromebook) {
        String sql = "INSERT INTO chromebook (tombamento, situacao, descricao) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, chromebook.getTombamento());
            stmt.setString(2, chromebook.getSituacao());
            stmt.setString(3, chromebook.getDescricao());
            stmt.setString(4, chromebook.getEstadoChromebook());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void excluirChromebook(String id) {
        try {
            String sql = "DELETE FROM chromebook WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu excluir o Chromebook.");
        }
    }
}
