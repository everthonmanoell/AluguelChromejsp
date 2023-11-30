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
    // Método para buscar informações e adicionar ao aluguel
    public void adicionarAluguel(String idAluguel, String idUsuario, String idAluno, String idChromebook,
            String situacaoChromebook, String id, String dataAluguel, String horaInicio, String horaTermino, String dataTermino) {

        String usuario = this.controleUsuario.getIdUsuario(idUsuario);
        String aluno = this.controleUsuario.getIdAluno(idAluno);
        String chromebook = this.controleUsuario.getIdChromebook(idChromebook);

        if (usuario.equals(idUsuario) && (aluno.equals(idAluno)) && (chromebook.equals(idChromebook))) {

            Aluguel novoAluguel = new Aluguel(idAluguel, idUsuario, idChromebook,
                    id, dataAluguel, horaInicio, horaTermino, dataTermino);

            this.alugueis.add(novoAluguel);
        } else {
            System.out.println("Usuário, aluno ou Chromebook não encontrado.");
        }

    }

    public String listarDadosAlugueis() {
        String texto = "";
        for (Aluguel u : this.alugueis) {
            if (u.getDatatermino() != null && !u.getDatatermino().equals("")) {
                texto += "<tr>"
                        + "<td>" + u.getId() + "</td>"
                        + "<td>" + u.getMatricula() + "</td>"
                        + "<td>" + u.getTombamento() + "</td>"
                        + "<td>" + u.getSituacaochromebook() + "</td>"
                        + "<td>" + u.getDataalguel() + "</td>"
                        + "<td>" + u.getHorainicio() + "</td>"
                        + "<td>" + u.getDatatermino() + "</td>"
                        + "<td><a href=\"alugel.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-primary btn-sm\">Devolver</a>"
                        + "</tr>";
            }
        }
        return texto;
    }

//----------------------------------------------------------------------
}
