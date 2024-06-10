/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;
import model.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Usuario;
/**
 *
 * @author evert
 */
public class ControleBancoUsuario {
    
        /* ------------- Conexao Usuario --------------------*/
    private Conexao conexao;
    private Connection conn;
    
    private static ControleBancoUsuario instancia = null;

    private ControleBancoUsuario() {
        this.conexao = new Conexao();
        this.conn = conexao.getConnection();
    }

    public static ControleBancoUsuario getInstance() {
        if (instancia == null) {
            instancia = new ControleBancoUsuario();
        }
        return instancia;
    }
    /*-----------------------------------------------------------*/
    
    /*---------------- Métodos ---------------------------------*/
    
    
    
    
        public Usuario getUsuario(String id) {
        Usuario usuario = null;

        try {
            String consulta = "SELECT * FROM coordenador WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, id);

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                usuario = new Usuario(
                    resultado.getString("matricula"),
                    resultado.getString("nome"),
                    resultado.getString("senha")
                );
                usuario.setId(resultado.getString("id"));
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados do coordenador.");
        }

        return usuario;
    }

        public void alterarUsuario(String id, String nomecompleto, String matricula, String senha) {
        try {
            String sql = "UPDATE coordenador SET nome = ?, matricula = ?, senha = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, nomecompleto);
            stmt.setString(2, matricula);
            stmt.setString(3, senha);
            stmt.setString(4, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu alterar os dados do coordenador.");
        }
    }

    
        public String listarDadosUsuarios() {
        String texto = "";

        try {
            String consulta = "SELECT * FROM coordenador";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                Usuario usuario = new Usuario(
                    resultado.getString("matricula"),
                    resultado.getString("nome"),
                    resultado.getString("senha")
                );
                usuario.setId(resultado.getString("id"));

                texto = texto
                    + "<tr>"
                    + "<td>" + usuario.getId() + "</td>"
                    + "<td>" + usuario.getNomecompleto() + "</td>"
                    + "<td>" + usuario.getMatricula() + "</td>"
                    + "<td>"
                    + "<a href=\"cadastrocoordenador.jsp?id=" + usuario.getId() + "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>"
                    + "<a href=\"validar/excluircoordenador.jsp?id=" + usuario.getId() + "\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n"
                    + "</td>"
                    + "</tr>";
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados dos coordenadores.");
        }

        return texto;
    }
        public int contarCoordenadoresComPesquisa(String parametro) {
    int contador = 0;

    if (!parametro.isEmpty()) {
        try {
            String consulta = "SELECT COUNT(*) FROM coordenador " +
                              "WHERE nome LIKE ? OR matricula LIKE ? OR turno LIKE ? OR periodo LIKE ? OR turma LIKE ? OR curso LIKE ?";
            
            PreparedStatement stmt = conn.prepareStatement(consulta);
            for (int i = 1; i <= 6; i++) {
                stmt.setString(i, "%" + parametro + "%");
            }
            
            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                contador = resultado.getInt(1);
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu contar os coordenadores com pesquisa.");
            ex.printStackTrace();
        }
    }

    return contador;
}

        public String listarPesquisaUsuarios(String pesquisa) {
        StringBuilder texto = new StringBuilder();

        try {
            String consulta = "SELECT * FROM coordenador";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                String nomeCompleto = resultado.getString("nome");
                String matricula = resultado.getString("matricula");

                // Verifica se a pesquisa está presente no nome (case-insensitive)
                if (nomeCompleto.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || matricula.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1) {

                    Usuario usuario = new Usuario(
                            resultado.getString("matricula"),
                            nomeCompleto,
                            resultado.getString("senha")
                    );
                    usuario.setId(resultado.getString("id"));

                    texto.append("<tr>")
                            .append("<td>").append(usuario.getId()).append("</td>")
                            .append("<td>").append(usuario.getNomecompleto()).append("</td>")
                            .append("<td>").append(usuario.getMatricula()).append("</td>")
                            .append("<td>")
                            .append("<a href=\"cadastrocoordenador.jsp?id=").append(usuario.getId()).append("\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>")
                            .append("<a href=\"validar/excluircoordenador.jsp?id=").append(usuario.getId()).append("\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n")
                            .append("</td>")
                            .append("</tr>");
                }
            }

            stm.close();
        } catch (SQLException ex) {
            
            System.out.println("Não conseguiu consultar os dados dos coordenadores.");
        }

        return texto.toString();
    }

        
    

        public int listarQuantidadeUsuarios() {
        int qtd = 0;

        try {
            String consulta = "SELECT * FROM coordenador";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                Usuario usuario = new Usuario(
                    resultado.getString("matricula"),
                    resultado.getString("nome"),
                    resultado.getString("senha")
                );
                usuario.setId(resultado.getString("id"));

                qtd++;
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados dos coordenadores.");
        }

        return qtd;
    }

    
    
    public boolean consultarUsuario(String matricula, String senha) {
        Usuario usuario = null;

        try {
            String consulta = "SELECT * FROM coordenador WHERE matricula = ? ";

            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, matricula);

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                
                usuario = new Usuario(
                    resultado.getString("matricula"),
                    resultado.getString("nome"),
                    resultado.getString("senha")
                );
                usuario.setId(resultado.getString("id"));

                
                if (senha.equals(usuario.getSenha())) {
                    stmt.close();
                    return true;
                }
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados do coordenador.");
        }

        return false;
    }





    
    public void adicionar(Usuario usuario) {
        String sql = "insert into coordenador "
                + "(matricula,nome,senha)"
                + " values (?,?,?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getMatricula());
            stmt.setString(2, usuario.getNomecompleto());
            stmt.setString(3, usuario.getSenha());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    
        public void excluirUsuario(String id) {
        try {
            String sql = "DELETE FROM coordenador WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu excluir o coordenador.");
        }
    }



  

    
    
    /*-------------------------------------------------------*/
    
}
