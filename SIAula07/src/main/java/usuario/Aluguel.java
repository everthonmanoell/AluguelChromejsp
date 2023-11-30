/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package usuario;

/**
 *
 * @author evert
 */
public class Aluguel {



    private String id;
    private String matriculaUsuario;
    private String matricula;    
    private String tombamento;
    private String situacaoChromebook;
    private String dataAluguel;
    private String horaInicio;
    private String dataTermino;
    private String horaTermino;
    

    public Aluguel(String id, String matriculaUsuario, String matricula, String tombamento, String situacaoChromebook, String dataAluguel, String horaInicio, String dataTermino ,String horaTermino ) {
        
        this.id = id;
        this.matriculaUsuario = matriculaUsuario;
        this.matricula = matricula;
        this.tombamento = tombamento;
        this.situacaoChromebook = situacaoChromebook;
        this.dataAluguel = dataAluguel;
        this.horaInicio = horaInicio;
        this.dataTermino = dataTermino;
        this.horaTermino = horaTermino;
        

    }

    /*
     * @return the id
     */
    public String getId() {
        return id;
    }

    /*
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the matricula
     */
    public String getMatricula() {
        return matricula;
    }

    /*
     * @param matricula the matricula to set
     */
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    /*
     * @return the idMatriculaUsuario
     */
    public String getMatriculaUsuario() {
        return matriculaUsuario;
    }

    /*
     * @param idMatriculaUsuario the idMatriculaUsuario to set
     */
    public void setMatriculaUsuario(String matriculaUsuario) {
        this.matriculaUsuario = matriculaUsuario;
    }

    /*
     * @return the tombamento
     */
    public String getTombamento() {
        return tombamento;
    }

    /*
     * @param tombamento the tombamento to set
     */
    public void setTombamento(String tombamento) {
        this.tombamento = tombamento;
    }

    /*
     * @return the situacaoChromebook
     */
    public String getSituacaoChromebook() {
        return situacaoChromebook;
    }

    /*
     * @param situacaoChromebook the situacaoChromebook to set
     */
    public void setSituacaoChromebook(String situacaoChromebook) {
        this.situacaoChromebook = situacaoChromebook;
    }

    /*
     * @return the dataAluguel
     */
    public String getDataAluguel() {
        return dataAluguel;
    }

    /*
     * @param dataAluguel the dataAluguel to set
     */
    public void setDataAluguel(String dataAluguel) {
        this.dataAluguel = dataAluguel;
    }

    /**
     * @return the horaInicio
     */
    public String getHoraInicio() {
        return horaInicio;
    }

    /*
     * @param horaInicio the horaInicio to set
     */
    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    /*
     * @return the horaTermino
     */
    public String getHoraTermino() {
        return horaTermino;
    }

    /*
     * @param horaTermino the horaTermino to set
     */
    public void setHoraTermino(String horaTermino) {
        this.horaTermino = horaTermino;
    }

    /*
     * @return the dataTermino
     */
    public String getDataTermino() {
        return dataTermino;
    }

    /*
     * @param dataTermino the dataTermino to set
     */
    public void setDataTermino(String dataTermino) {
        this.dataTermino = dataTermino;
    }

    
    
}
