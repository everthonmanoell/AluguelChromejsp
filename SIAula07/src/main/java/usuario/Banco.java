/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package usuario;

/**
 *
 * @author evert
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author root
 */
public class Banco {

    private Connection con;

    public Banco() {
        this.con = getConnection();
        System.out.println("OK");
    }

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(
                    "jdbc:mysql://localhost/aluguelchromebook", "root", "");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Banco.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public String consulta() {
        //Conexao conexao = new Conexao();
        String nomes = "";
        Connection conn = getConnection();
        try {
            String consulta = "SELECT * FROM chromebook";

            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                //System.out.print(resultado.getLong("login"));
                //System.out.print(" - " + resultado.getString("login"));
                //System.out.print(" - " + resultado.getString("senha") + "\n");
                nomes = resultado.getString("login") +" "+  resultado.getString("senha");
            }
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados de Aluna.");
        } finally {
            //conexao.desconectar(conn);
        }
        return nomes;
    }
}
