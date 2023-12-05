package control;

import java.time.LocalTime;
import model.*;
import java.util.LinkedList;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Everthon
 */
public class ControleAluguel {
    //----------------------------------------------------------------------

    private LinkedList<Aluguel> alugueis;
    private ControleUsuario controleUsuario;
    private ControleAluno controleAluno;
    private ControleChromebook controleChromebook;

    private static ControleAluguel instancia = null;

    private ControleAluguel() {
        this.alugueis = new LinkedList<Aluguel>();
        this.controleUsuario = ControleUsuario.getInstance();
        this.controleAluno = ControleAluno.getInstance();
        this.controleChromebook = ControleChromebook.getInstance();
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
    public Aluguel getAluguel(String id) {
        for (Aluguel c : this.alugueis) {
            if (c.getId().equals(id)) {
                return c;
            }
        }
        return null;
    }

    // Método para buscar informações e adicionar ao aluguel
    public void adicionarAluguel(String idAluguel, String matriculaUsuario, String idMatricula, String tombamento,
            String situacaoChromebook, String dataAluguel, String horaInicio, String horaTermino, String dataTermino) {

        String usuario = this.controleUsuario.getMatriculaUsuario(matriculaUsuario);
        String aluno = this.controleAluno.getMatriculaAluno(idMatricula);
        String chromebook = this.controleChromebook.getTombamento(tombamento);

        //if (usuario.equals(matriculaUsuario) && (aluno.equals(idMatricula)) && (chromebook.equals(tombamento))) {
        Aluguel novoAluguel = new Aluguel(idAluguel, matriculaUsuario, idMatricula,
                tombamento, situacaoChromebook, dataAluguel, horaInicio, horaTermino, dataTermino);

        this.alugueis.add(novoAluguel);
        /*} else {
            System.out.println("Usuário, aluno ou Chromebook não encontrado.");
        }*/

    }

    public void alterarAluguel(String idAluguel, String situacaoChromebook) {
        for (Aluguel c : this.alugueis) {
            if (String.valueOf(c.getId()).equals(idAluguel)) {

                c.setSituacaoChromebook(situacaoChromebook);
                String getHoraAtual = getHoraAtual;
                c.setHoraTermino(getHoraAtual);
                c.setDataTermino(dataTermino);
                break; // interrompe o loop após encontrar o Chromebook correspondente
            }
        }

    }

    public String listarDadosAlugueis() {
        String texto = "";
        for (Aluguel u : this.alugueis) {
            if (u.getDataTermino() == null || u.getDataTermino().isEmpty()) {
                texto += "<tr>"
                        + "<td>" + u.getId() + "</td>"
                        + "<td>" + u.getMatriculaUsuario() + "</td>"
                        + "<td>" + u.getMatricula() + "</td>"
                        + "<td>" + u.getTombamento() + "</td>"
                        + "<td>" + u.getSituacaoChromebook() + "</td>"
                        + "<td>" + u.getDataAluguel() + "</td>"
                        + "<td>" + u.getHoraInicio() + "</td>"
                        + "<td><a href=\"aluguel.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-primary btn-sm\">Devolver</a>"
                        + "</tr>";
            }
        }
        return texto;
    }

    public int contarAlugueis() {
        int contador = 0;
        for (Aluguel u : this.alugueis) {
            if (u.getDataTermino() == null || u.getDataTermino().isEmpty()) {
                contador++;
            }
        }
        return contador;
    }

    public String contarAlugados() {

        return this.alugueis.size() + "";

    }
     public String getHoraAtual() {
        // Obtém a hora atual
        LocalTime horaAtual = LocalTime.now();

        // Formata a hora atual como uma string (opcional)
        String horaFormatada = horaAtual.toString();

        // Retorna a hora atual ou a string formatada
        return horaFormatada;
    }

    public String getHoraAtualFormatada() {
        // Obtém a hora atual
        LocalTime horaAtual = LocalTime.now();

        // Define o formato desejado (por exemplo, HH:mm:ss)
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");

        // Formata a hora atual conforme o formato
        String horaFormatada = horaAtual.format(formatter);

        // Retorna a hora formatada
        return horaFormatada;
    }

    
    
    public String listarDadosAlugados() {
        String texto = "";
        for (Aluguel u : this.alugueis) {

            texto += "<tr>"
                    + "<td>" + u.getId() + "</td>"
                    + "<td>" + u.getMatriculaUsuario() + "</td>"
                    + "<td>" + u.getMatricula() + "</td>"
                    + "<td>" + u.getTombamento() + "</td>"
                    + "<td>" + u.getSituacaoChromebook() + "</td>"
                    + "<td>" + u.getDataAluguel() + "</td>"
                    + "<td>" + u.getHoraInicio() + "</td>"
                    + "<td>" + u.getHoraTermino() + "</td>"
                    + "<td>" + u.getDataTermino() + "</td>"
                    + "</tr>";

        }
        return texto;
    }

//----------------------------------------------------------------------
   
}
