
package br.com.aluga.dao;

import br.com.aluga.model.Conexao;
import br.com.aluga.model.AlunoModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DAOAluno {
    
    public List<DAOAluno> getAllAlunos() throws SQLException{
        Connection con = null;
        Conexao conexao = new Conexao();
        PreparedStatement ps;
        ResultSet rs;
        String sql = "select * from aluno";
        List lista = new ArrayList();
        try {
            con = conexao.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while(rs.next()){
                AlunoModel alunoModel = new AlunoModel();
                alunoModel.setId(rs.getString("id"));
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
}
