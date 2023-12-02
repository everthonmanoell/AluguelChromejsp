package br.com.aluga.model;

public class AlunoModel {
    private int id;
    private String nome;
    private String matricula;
    private String turno;
    private String periodo;
    private String turma;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
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