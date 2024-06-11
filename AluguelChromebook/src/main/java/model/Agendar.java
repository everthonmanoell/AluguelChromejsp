package model;

import jakarta.persistence.criteria.CriteriaBuilder.In;

public class Agendar {
    private String id;
    private String matricula_aluno;
    private String dataAgendada;
    private String horaAgendada;
    private String fk_id_aluno;
    private String fk_id_aluguel;
    private String situacao_agendamento;
    private String dataParaOAluguel;

    public Agendar(String matricula_aluno, String dataParaOAluguel) {
        this.matricula_aluno = matricula_aluno;
        this.dataParaOAluguel = dataParaOAluguel;
        this.dataAgendada = DataHora.getDataAtual();
        this.horaAgendada = DataHora.getHoraAtual();
        this.situacao_agendamento = "agendado";        
    }

    public Agendar(String id, String matricula_aluno, String dataAgendada, String horaAgendada, String dataParaOAluguel, String situacao_agendamento) {
        this.id = id;
        this.matricula_aluno = matricula_aluno;
        this.dataAgendada = dataAgendada;
        this.horaAgendada = horaAgendada;
        this.dataParaOAluguel = dataParaOAluguel;
        this.situacao_agendamento = situacao_agendamento;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMatricula_aluno() {
        return matricula_aluno;
    }

    public void setMatricula_aluno(String matricula_aluno) {
        this.matricula_aluno = matricula_aluno;
    }

    public String getDataAgendada() {
        return dataAgendada;
    }

    public void setDataAgendada(String dataAgendada) {
        this.dataAgendada = dataAgendada;
    }

    public String getHoraAgendada() {
        return horaAgendada;
    }

    public void setHoraAgendada(String horaAgendada) {
        this.horaAgendada = horaAgendada;
    }

    public String getFk_id_aluno() {
        return fk_id_aluno;
    }

    public void setFk_id_aluno(String fk_id_aluno) {
        this.fk_id_aluno = fk_id_aluno;
    }

    public String getFk_id_aluguel() {
        return fk_id_aluguel;
    }

    public void setFk_id_aluguel(String fk_id_aluguel) {
        this.fk_id_aluguel = fk_id_aluguel;
    }

    public String getSituacao_agendamento() {
        return situacao_agendamento;
    }

    public void setSituacao_agendamento(String situacao_agendamento) {
        this.situacao_agendamento = situacao_agendamento;
    }

    public String getDataParaOAluguel() {
        return dataParaOAluguel;
    }

    public void setDataParaOAluguel(String dataParaOAluguel) {
        this.dataParaOAluguel = dataParaOAluguel;
    }

    
}