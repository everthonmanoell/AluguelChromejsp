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
                        + "<td><a href=\"cadastrochromebook.jsp?id="+ u.getId()+ "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>"
                        + "<a href=\"validar/excluirchromebook.jsp?id=" + u.getId() + "\" class=\"btn btn-outline-danger btn-sm\" onclick=\"return confirm('Tem certeza que deseja excluir?')\">Excluir</a>\n" +
"</td>"                 + "</tr>";
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

    
 
    //------------------------------------------------------//   
    
    
    
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


        
        public String listarDadosAluno(){
        String texto = "";
        for(Aluno u: this.alunos){
            texto = texto + 
                    "<tr>"
                        + "<td>"+u.getId()+"</td>"
                        + "<td>"+u.getNome()+"</td>"
                        + "<td>"+u.getMatricula()+"</td>"
                        + "<td>"+u.getTurno()+"</td>"
                        + "<td>"+u.getPeriodo()+"</td>"
                        + "<td>"+u.getTurma()+"</td>"
                        + "<td><a href=\"cadastroaluno.jsp?id="+ u.getId() + "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a>"
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
        
    //----------------------------------------------------------------//
        
        
        
    //--------------- USUARIO / COORDENADOR -------------------------//
        
        
    public Usuario getUsuario(String id) {
        for (Usuario c : this.usuarios) {
            if (c.getId().equals(id)) {
                return c;
            }
        }
        return null;
    }
        
        
    public String listarDadosUsuario(){
        String texto = "";
        for(Usuario u: this.usuarios){
            texto = texto + 
                    "<tr>"
                        + "<td>"+u.getId()+"</td>"
                        + "<td>"+u.getNomecompleto()+"</td>"
                        + "<td>"+u.getMatricula()+"</td>"
                        + "<td><a href=\"cadastrocoordenador.jsp?id="+ u.getId()+ "\" class=\"btn btn-outline-primary btn-sm\">Alterar</a><a href=\"#\" class=\"btn btn-outline-danger btn-sm\">Excluir</a></td>"
                    + "</tr>";
        }
        return texto;
    }
    
    
    public void alterarUsuario(String id, String nomecompleto, String matricula, String senha) {
        for (Usuario c : this.usuarios) {
                if (String.valueOf(c.getId()).equals(id)) {
                    
                    c.setNomecompleto(nomecompleto);
                    c.setMatricula(matricula);
                    c.setSenha(senha);
                    break; // interrompe o loop após encontrar o Chromebook correspondente
                }
            }
        }
    
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
