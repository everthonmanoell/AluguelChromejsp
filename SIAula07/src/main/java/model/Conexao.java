/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author evert
 */


import control.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author root
 */
public class Conexao {

    private Connection con;

    public Conexao() {
        this.con = getConnection();
        System.out.println("OK");
    }

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(
                    "jdbc:mysql://localhost/aluguelchromebook", "root", "");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /* ------------- Conexao Usuario --------------------*/
    
    /*public LinkedList<Usuario> consulta() {
        LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
        Usuario usuario;
        Connection conn = getConnection();
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
    }

    public void adicionar(Usuario usuario) {
        String sql = "insert into coordenador "
                + "(matricula,nome,senha)"
                + " values (?,?,?)";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, usuario.getMatricula());
            stmt.setString(2, usuario.getNomecompleto());
            stmt.setString(3, usuario.getSenha());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void alterar(Usuario usuario) {
        String sql = "update usuario set nome=?, login=?, senha=?,"
                + "tipo=? where id=?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
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
            PreparedStatement stmt = con.prepareStatement("delete from usuario where id=?");
            stmt.setLong(1, usuario.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/
    
    
    /*-------------------------------------------------------*/
}
