package usuario;

import java.util.LinkedList;

/**
 * Everthon
 */
public class ControleAluguel {

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



    // ... outros métodos conforme necessário

}
