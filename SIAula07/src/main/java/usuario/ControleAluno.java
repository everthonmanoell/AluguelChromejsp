/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package usuario;

import java.util.LinkedList;

/**
 *
 * @author evert
 */
public class ControleAluno {

    private LinkedList<Aluno> alunos;

    private static ControleAluno instancia = null;

    private ControleAluno() {

        this.alunos = new LinkedList<Aluno>();

    }

    public static ControleAluno getInstance() {
        if (instancia == null) {
            instancia = new ControleAluno();
        }
        return instancia;
    }

    public void adicionarAluno(Aluno aluno) {
        this.alunos.add(aluno);
    }

    //------------------ ALUNO -------------------------//
    public Aluno getAluno(String id) {
        for (Aluno c : this.alunos) {
            if (c.getId().equals(id)) {
                return c;
            }
        }
        return null;
    }

    public void alterarAluno(String id, String nome, String matricula, String turno, String periodo, String turma) {
        for (Aluno c : this.alunos) {
            if (String.valueOf(c.getId()).equals(id)) {
                c.setNome(nome);
                c.setMatricula(matricula);
                c.setTurno(turno);
                c.setPeriodo(periodo);
                c.setTurma(turma);
                break; // interrompe o loop após encontrar o Chromebook correspondente
            }
        }
    }

    public String listarDadosAluno() {
        String texto = "";
        for (Aluno u : this.alunos) {
            texto = texto
                    + "<tr>"
                    + "<td>" + u.getId() + "</td>"
                    + "<td>" + u.getNome() + "</td>"
                    + "<td>" + u.getMatricula() + "</td>"
                    + "<td>" + u.getTurno() + "</td>"
                    + "<td>" + u.getPeriodo() + "</td>"
                    + "<td>" + u.getTurma() + "</td>"
                    + "<td><a href=\"cadastroaluno.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>"
                    + "<a href=\"validar/excluirchromebook.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n"
                    + "</tr>";
        }
        return texto;
    }

    public void excluirAluno(String id) {
        for (Aluno c : this.alunos) {
            if (c.getId().equals(id)) {
                this.alunos.remove(c);

                break;
            }
        }

    }

    public String contarAluno() {

        return this.alunos.size() + "";

    }

    //----------------------------------------------------------------//
}
