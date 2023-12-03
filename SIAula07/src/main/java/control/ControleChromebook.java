/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import model.*;

import java.util.LinkedList;

/**
 *
 * @author evert
 */
public class ControleChromebook {

    private LinkedList<Chromebook> chromebook;

    private static ControleChromebook instancia = null;

    private ControleChromebook() {
        this.chromebook = new LinkedList<Chromebook>();

    }

    public static ControleChromebook getInstance() {
        if (instancia == null) {
            instancia = new ControleChromebook();
        }
        return instancia;
    }

    public void adicionarChromebook(Chromebook chromebook) {
        this.chromebook.add(chromebook);
    }

//--------------- CHROMEBOOK-------------------------//
    public Chromebook getChromebook(String id) {
        for (Chromebook c : this.chromebook) {
            if (c.getId().equals(id)) {
                return c;
            }
        }
        return null;
    }

    public String getIdChromebook(String id) {
        for (Chromebook c : this.chromebook) {
            if (c.getId().equals(id)) {
                return id;
            }
        }
        return null;
    }

    public String getTombamento(String tombamento) {
        for (Chromebook c : this.chromebook) {
            if (c.getTombamento().equals(tombamento)) {
                return tombamento;
            }
        }
        return null;
    }

    public void alterarChromebook(String id, String tombamento, String situacao, String descricao) {
        for (Chromebook c : this.chromebook) {
            if (String.valueOf(c.getId()).equals(id)) {
                c.setTombamento(tombamento);
                c.setSituacao(situacao);
                c.setDescricao(descricao);
                break; // interrompe o loop após encontrar o Chromebook correspondente
            }
        }
    }

    public String listarDadosChromebook() {
        String texto = "";
        for (Chromebook u : this.chromebook) {
            texto = texto
                    + "<tr>"
                    + "<td>" + u.getId() + "</td>"
                    + "<td>" + u.getTombamento() + "</td>"
                    + "<td>" + u.getSituacao() + "</td>"
                    + "<td>" + u.getDescricao() + "</td>"
                    + "<td><a href=\"cadastrochromebook.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>"
                    + "<a href=\"validar/excluirchromebook.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n"
                    + "</td>" + "</tr>";
        }
        return texto;
    }

    public void excluirChromebook(String id) {
        for (Chromebook c : this.chromebook) {
            if (c.getId().equals(id)) {
                this.chromebook.remove(c);

                break;
            }
        }

    }

    public String contarChromebook() {

        return this.chromebook.size() + "";

    }

    //------------------------------------------------------//   
}
