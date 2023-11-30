package testes;

import br.com.aluga.dao.DAOAluno;
import br.com.aluga.model.AlunoModel;

public class DaoAlunoTeste {
    
    public static void main(String[] args) {
        
        DAOAluno daoAluno = new DAOAluno();
        
        for(AlunoModel aluno : daoAluno.getAllAlunos()){
            
            System.out.println(aluno.getId());
            System.out.println(aluno.getMatricula());
            System.out.println(aluno.getNome());
            System.out.println(aluno.getPeriodo());
            System.out.println(aluno.getTurma());
            System.out.println(aluno.getTurno());
        }
        
    }
    
}
