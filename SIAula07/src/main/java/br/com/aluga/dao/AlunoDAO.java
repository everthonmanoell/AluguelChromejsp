
package br.com.aluga.dao;

import br.com.aluga.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AlunoDAO {
    
    public static List<AlunoModel> getAllAlunos() throws SQLException{
        List<AlunoModel> lista = new ArrayList<>();
        Connection con = null;
        Conexao conexao = new Conexao();
        PreparedStatement ps;
        ResultSet rs;
        String sql = "select * from aluno";
        
        try {
            con = Conexao.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while(rs.next()){
                AlunoModel alunoModel = new AlunoModel();
                alunoModel.setId(rs.getInt("id"));
                alunoModel.setNome(rs.getString("nome"));
                alunoModel.setMatricula(rs.getString("matricula"));
                alunoModel.setTurno(rs.getString("turno"));
                alunoModel.setPeriodo(rs.getString("periodo"));
                alunoModel.setTurma(rs.getString("turma"));
                lista.add(alunoModel);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            conexao.desligarConexao(con);
        }
        return lista;
    }
    
    public static AlunoModel getAlunoById(int id){
        AlunoModel alunoModel = null;
        
        Connection con = null;
        Conexao conexao = new Conexao();
        PreparedStatement ps;
        ResultSet rs;
        String sql = "select * from aluno where id=?";
        
        try {
            con = Conexao.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery(sql);
            while(rs.next()){
                alunoModel = new AlunoModel();
                alunoModel.setId(rs.getInt("id"));
                alunoModel.setNome(rs.getString("nome"));
                alunoModel.setMatricula(rs.getString("matricula"));
                alunoModel.setTurno(rs.getString("turno"));
                alunoModel.setPeriodo(rs.getString("periodo"));
                alunoModel.setTurma(rs.getString("turma"));
                
            }
        } catch (SQLException e) {
        }
        return alunoModel;
        
    }
}
