/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package usuario;


import java.util.LinkedList;

/**
 *
 * @author Everthon Manoel
 */
public class ControleUsuario {
    
    private LinkedList<Usuario> usuarios;
    private LinkedList<Aluno> alunos;
    private LinkedList<Chromebook> chromebook;
    
    private static ControleUsuario instancia = null;
    
    
    private ControleUsuario(){
        this.usuarios = new LinkedList<Usuario>();
        this.alunos = new LinkedList<Aluno>();
        this.chromebook = new LinkedList<Chromebook>();
    }
     
    
    
    public static ControleUsuario getInstance(){
        if(instancia == null){
            instancia = new ControleUsuario();
        }
        return instancia;
    }
    
    
    public void adicionarUsuario(Usuario usuario){
        this.usuarios.add(usuario);
    }
    
    public void adicionarChromebook(Chromebook chromebook){
        this.chromebook.add(chromebook);
    }
    
    public void adicionarAluno(Aluno aluno){
        this.alunos.add(aluno);
    }
    
    public boolean buscarUsuario(String matricula, String senha){
        
        for(Usuario u: this.usuarios){
            if(u.getMatricula().equals(matricula) && (u.getSenha().equals(senha))){
                return true;
            }
        }
        return false;
    }
    
    public String listarUsuarios(){
        StringBuilder texto = new StringBuilder();
        for(Usuario u: this.usuarios){
            texto.append("Matricula: ").append(u.getMatricula()).append("<br>");
            texto.append("Senha: ").append(u.getSenha()).append("<br>");
        }
        return texto.toString();
    }

}
