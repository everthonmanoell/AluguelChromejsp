/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package usuario;

import java.util.LinkedList;

/**
 *
 * @author ficr
 */
public class ControleUsuario {
    private LinkedList<Usuario> usuarios;
    private static ControleUsuario instancia = null;
    
    private ControleUsuario(){
        this.usuarios = new LinkedList<Usuario>();
    }
    
    public static ControleUsuario getInstance(){
        if(instancia == null){
            instancia = new ControleUsuario();
        }
        return instancia;
    }
    
    /*public void adicionarUsuario(String nome, String senha){
        Usuario usr = new Usuario(nome, senha);
        this.usuarios.add(usr);
    }*/
    
    public void adicionarUsuario(Usuario usuario){
        this.usuarios.add(usuario);
    }
    
    public String buscarUsuario(String cpf, String senha){
        
        for(Usuario u: this.usuarios){
            if(u.getCpf().equals(cpf) && (u.getSenha().equals(senha))){
                return true;
            }
        }
        return null;
    }
    
    public String listarUsuarios(){
        String texto = "";
        for(Usuario u: this.usuarios){
            texto = texto + "cpf: " + u.getCpf() + "<br>";
            texto = texto + "Senha: " + u.getSenha() + "<br>";
        }
        return texto;
    }
}
