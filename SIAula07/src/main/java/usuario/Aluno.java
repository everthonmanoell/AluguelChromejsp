/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package usuario;

/**
 *
 * @author evert
 */
public class Aluno {
    private String id;
    private String nome;
    private String matricula;
    private String turno;
    private String periodo;
    private String turma;
    
    
    public Aluno (String id, String nome, String matricula, String turno, String periodo, String turma){
        this.id = id;
        this.nome = nome;
        this.matricula = matricula;
        this.turno = turno;
        this.periodo = periodo;
        this.turma = turma;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }
    
    public String getTurma(){
        return turma;
    }
    
    public void setTurma(String turma){
        this.turma = turma;
    }
    
        
    
}
