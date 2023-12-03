/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;
import model.Conexao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    
    /*public LinkedList<Usuario> consulta() {
        LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
        Usuario usuario;
        
        try {
            String consulta = "SELECT * FROM usuario";

            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                usuario = new Usuario(
                    resultado.getString("matricula"),
                    resultado.getString("nome"),
                    resultado.getString("senha")
                );
                usuario.setId(resultado.getString("id"));
                
                // Adiciona cada usuário à lista
                usuarios.add(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados de Aluna.");
        }
        return usuarios;
    }*/
    
    
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

    /*public void alterar(Usuario usuario) {
        String sql = "update usuario set nome=?, login=?, senha=?,"
                + "tipo=? where id=?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getLogin());
            stmt.setString(3, usuario.getSenha());
            stmt.setString(4, usuario.getTipo());
            stmt.setInt(5, usuario.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remover(Usuario usuario) {
        try {
            PreparedStatement stmt = conn.prepareStatement("delete from usuario where id=?");
            stmt.setLong(1, usuario.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/

  

    
    
    /*-------------------------------------------------------*/
    
}
