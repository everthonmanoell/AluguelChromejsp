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
    private String matricula;
    private String tombamento;
    private String situacaochromebook;
    private String dataalguel;
    private String horainicio;
    private String horatermino;
    private String datatermino;

    public Aluguel(String id, String matricula, String tombamento, String situacaochromebook, String dataalguel, String horainicio, String horatermino, String datatermino) {
        
        this.id = id;
        this.matricula = matricula;
        this.tombamento = tombamento;
        this.situacaochromebook = situacaochromebook;
        this.dataalguel = dataalguel;
        this.horainicio = horainicio;
        this.horatermino = horatermino;
        this.datatermino = datatermino;

    }
    
        /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
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

    /**
     * @param matricula the matricula to set
     */
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    /**
     * @return the tombamento
     */
    public String getTombamento() {
        return tombamento;
    }

    /**
     * @param tombamento the tombamento to set
     */
    public void setTombamento(String tombamento) {
        this.tombamento = tombamento;
    }

    /**
     * @return the situacaochromebook
     */
    public String getSituacaochromebook() {
        return situacaochromebook;
    }

    /**
     * @param situacaochromebook the situacaochromebook to set
     */
    public void setSituacaochromebook(String situacaochromebook) {
        this.situacaochromebook = situacaochromebook;
    }

    /**
     * @return the dataalguel
     */
    public String getDataalguel() {
        return dataalguel;
    }

    /**
     * @param dataalguel the dataalguel to set
     */
    public void setDataalguel(String dataalguel) {
        this.dataalguel = dataalguel;
    }

    /**
     * @return the horainicio
     */
    public String getHorainicio() {
        return horainicio;
    }

    /**
     * @param horainicio the horainicio to set
     */
    public void setHorainicio(String horainicio) {
        this.horainicio = horainicio;
    }

    /**
     * @return the horatermino
     */
    public String getHoratermino() {
        return horatermino;
    }

    /**
     * @param horatermino the horatermino to set
     */
    public void setHoratermino(String horatermino) {
        this.horatermino = horatermino;
    }
    
        /**
     * @return the datatermino
     */
    public String getDatatermino() {
        return datatermino;
    }

    /**
     * @param datatermino the datatermino to set
     */
    public void setDatatermino(String datatermino) {
        this.datatermino = datatermino;
    }


}
