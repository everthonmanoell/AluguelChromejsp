package usuario;

import java.util.LinkedList;

/**
 * Everthon
 */
public class ControleAluguel {
    //----------------------------------------------------------------------

    private LinkedList<Aluguel> alugueis;
    private ControleUsuario controleUsuario;

    private static ControleAluguel instancia = null;

    private ControleAluguel() {
        this.alugueis = new LinkedList<Aluguel>();
        this.controleUsuario = ControleUsuario.getInstance();
    }

    public static ControleAluguel getInstance() {
        if (instancia == null) {
            instancia = new ControleAluguel();
        }
        return instancia;
    }

    public void adicionarAluguel(Aluguel aluguel) {
        this.alugueis.add(aluguel);
    }
    //----------------------------------------------------------------------

    
    
    
    //----------------------------------------------------------------------
    // Métodos para acessar e manipular a classe ControleUsuario
    public void adicionarUsuario(Usuario usuario) {
        this.controleUsuario.adicionarUsuario(usuario);
    }

    public void adicionarChromebook(Chromebook chromebook) {
        this.controleUsuario.adicionarChromebook(chromebook);
    }

    public void adicionarAluno(Aluno aluno) {
        this.controleUsuario.adicionarAluno(aluno);
    }

    public Usuario getUsuario(String id) {
        return this.controleUsuario.getUsuario(id);
    }
    //----------------------------------------------------------------------


    
    
    //----------------------------------------------------------------------
    // Método para buscar informações e adicionar ao aluguel
    
    public void adicionarInformacoesAluguel(String idAluguel, String idUsuario, String idAluno, String idChromebook,
            String situacaoChromebook, String id, String dataAluguel, String horaInicio, String horaTermino) {

        String usuario = this.controleUsuario.getIdUsuario(idUsuario);
        String aluno = this.controleUsuario.getIdAluno(idAluno);
        String chromebook = this.controleUsuario.getIdChromebook(idChromebook);

        if (usuario .equals(idUsuario)  && aluno != null && chromebook != null) {
           
            Aluguel novoAluguel = new Aluguel(idAluguel, idUsuario, idChromebook,
                    id, dataAluguel, horaInicio, horaTermino);

            this.alugueis.add(novoAluguel);
        } else {
            System.out.println("Usuário, aluno ou Chromebook não encontrado.");
        }
    }
    
    
    
    
    //----------------------------------------------------------------------

}
