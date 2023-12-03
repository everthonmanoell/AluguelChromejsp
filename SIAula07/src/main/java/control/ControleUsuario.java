/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import model.*;

import java.util.LinkedList;

/**
 *
 * @author Everthon Manoel
 */
public class ControleUsuario {

    private LinkedList<Usuario> usuarios;
    
    private LinkedList<Chromebook> chromebook;

    private static ControleUsuario instancia = null;

    private ControleUsuario() {
        this.usuarios = new LinkedList<Usuario>();

    }

    public static ControleUsuario getInstance() {
        if (instancia == null) {
            instancia = new ControleUsuario();
        }
        return instancia;
    }

    public void adicionarUsuario(Usuario usuario) {
        this.usuarios.add(usuario);
    }



    //--------------- USUARIO / COORDENADOR -------------------------//
    public Usuario getUsuario(String id) {
        for (Usuario c : this.usuarios) {
            if (c.getId().equals(id)) {
                return c;
            }
        }
        return null;
    }

    public String getIdUsuario(String id) {
        for (Usuario c : this.usuarios) {
            if (c.getId().equals(id)) {
                return id;
            }
        }
        return null;
    }

    public String getMatriculaUsuario(String matricula) {
        for (Usuario c : this.usuarios) {
            if (c.getMatricula().equals(matricula)) {
                return matricula;
            }
        }
        return null;
    }

    public String listarDadosUsuario() {
        String texto = "";
        for (Usuario u : this.usuarios) {
            texto = texto
                    + "<tr>"
                    + "<td>" + u.getId() + "</td>"
                    + "<td>" + u.getNomecompleto() + "</td>"
                    + "<td>" + u.getMatricula() + "</td>"
                    + "<td><a href=\"cadastrocoordenador.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>"
                    + "<a href=\"validar/excluircoordenador.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n"
                    + "</tr>";
        }
        return texto;
    }

    public void alterarUsuario(String id, String nomecompleto, String matricula, String senha) {
        for (Usuario c : this.usuarios) {
            if (id != null && id.equals(String.valueOf(c.getId()))) {

                c.setNomecompleto(nomecompleto);
                c.setMatricula(matricula);
                c.setSenha(senha);
                break; // interrompe o loop após encontrar o Chromebook correspondente
            }
        }
    }

    public void excluirUsuario(String id) {
        for (Usuario c : this.usuarios) {
            if (c.getId() != null && c.getId().equals(id)) {

                this.usuarios.remove(c);

                break;
            }
        }

    }

    public String listarUsuarios() {
        StringBuilder texto = new StringBuilder();
        for (Usuario u : this.usuarios) {
            texto.append("Matricula: ").append(u.getMatricula()).append("<br>");
            texto.append("Senha: ").append(u.getSenha()).append("<br>");
        }
        return texto.toString();
    }

    public boolean buscarUsuario(String matricula, String senha) {
        for (Usuario u : this.usuarios) {
            if (u.getMatricula().equals(matricula) && (u.getSenha().equals(senha))) {
                return true;
            }
        }
        return false;
    }

    public String contarUsuario() {

        return this.usuarios.size() + "";

    }

    //----------------------------------------------------------------//
    
    

   
}
