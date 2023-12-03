/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;



/**
 *
 * @author Everthon Manoel
 */
public class Usuario {
    private String id;
    private String nomecompleto;
    private String matricula;
    private String senha;
    
    
    public Usuario(String id, String nomecompleto, String matricula, String senha){
        this.id = id;
        this.nomecompleto = nomecompleto;
        this.matricula = matricula;
        this.senha = senha;
    }
    
    public String getId() {
    return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNomecompleto() {
        return nomecompleto;
    }

    public void setNomecompleto(String nomecompleto) {
        this.nomecompleto = nomecompleto;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
}
