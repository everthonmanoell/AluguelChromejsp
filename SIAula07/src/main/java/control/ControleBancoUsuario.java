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
                usuario = new Usuario();
                usuario.setId(resultado.getInt("id"));
                usuario.setNome(resultado.getString("nome"));
                usuario.setLogin(resultado.getString("login"));
                usuario.setSenha(resultado.getString("senha"));
                usuario.setTipo(resultado.getString("tipo"));
                
                // Adiciona cada usuário à lista
                usuarios.add(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados de Aluna.");
        }
        return usuarios;
    }*/
    
    
    public boolean consultarUsuario(String matricula, String senha) {
        Usuario usuario = null;

        try {
            String consulta = "SELECT * FROM coordenador WHERE matricula = ? ";

            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, matricula);

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                // Fornecer os argumentos ao criar a instância
                usuario = new Usuario(
                    resultado.getString("matricula"),
                    resultado.getString("nome"),
                    resultado.getString("senha")
                );
                usuario.setId(resultado.getString("id"));

                // Verificar se a senha fornecida corresponde à senha do usuário
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
