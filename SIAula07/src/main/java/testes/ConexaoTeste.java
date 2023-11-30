package testes;

import br.com.aluga.model.Conexao;
import java.sql.Connection;
import java.sql.SQLException;

public class ConexaoTeste {
    public static void main(String[] args) {
        try {
            Conexao conexao = new Conexao();
            Connection con = null;
            con = conexao.getConnection();
            System.out.println(con.isClosed());
            
            conexao.desligarConexao(con);
            
            System.out.println(con.isClosed());      
            
        } catch (SQLException e) {
        }  
    }
}
