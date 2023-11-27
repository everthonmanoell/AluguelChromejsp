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
    

    
    //--------------- CHROMEBOOK-------------------------//
    public Chromebook getChromebook(String id) {
        for (Chromebook c : this.chromebook) {
            if (c.getId().equals(id)) {
                return c;
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


        
        public String listarDadosChromebook(){
        String texto = "";
        for(Chromebook u: this.chromebook){
            texto = texto + 
                      "<tr>"
                    + "<td>"+u.getId()+"</td>"
                    + "<td>"+u.getTombamento()+"</td>"
                    + "<td>"+u.getSituacao()+"</td>"
                    + "<td>"+u.getDescricao()+"</td>"
                    + "<td><a href=\"cadastrochromebook.jsp?id="+ u.getId()+ "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a><a href=\"#\" class=\"btn btn-outline-danger btn-sm\">Excluir</a></td>"
                    + "</tr>";
        }
        return texto;
    } 
        
    //----------------------------------------------------------------//
        
        
        
    //--------------- USUARIO / COORDENADOR -------------------------//
    
    public String listarUsuarios(){
        StringBuilder texto = new StringBuilder();
        for(Usuario u: this.usuarios){
            texto.append("Matricula: ").append(u.getMatricula()).append("<br>");
            texto.append("Senha: ").append(u.getSenha()).append("<br>");
        }
        return texto.toString();
    }
    
        public boolean buscarUsuario(String matricula, String senha){
        
        for(Usuario u: this.usuarios){
            if(u.getMatricula().equals(matricula) && (u.getSenha().equals(senha))){
                return true;
            }
        }
        return false;
    }
    
    //----------------------------------------------------------------//
    
   

}
