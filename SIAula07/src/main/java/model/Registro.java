package model;

public class Registro {

    private String idRegistro;
    private String fkTombamento;
    private String fkIdAgendamento;
    private String fkMatAluno;
    private String fkNomeAluno;
    private String fkMatUsuario;
    private String dataHoraRetirada;
    private String dataHoraDevolucao;
    private String dataHoraAgendamento;

    public Registro(String idRegistro, String fkTombamento, String fkIdAgendamento, String fkMatAluno, String fkNomeAluno, String fkMatUsuario, String dataHoraRetirada) {
        this.idRegistro = idRegistro;
        this.fkTombamento = fkTombamento;
        this.fkIdAgendamento = fkIdAgendamento;
        this.fkMatAluno = fkMatAluno;
        this.fkNomeAluno = fkNomeAluno;
        this.fkMatUsuario = fkMatUsuario;
        this.dataHoraRetirada = dataHoraRetirada;
        this.dataHoraDevolucao = dataHoraDevolucao;
        this.dataHoraAgendamento = dataHoraAgendamento;
    }

    public String getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(String idRegistro) {
        this.idRegistro = idRegistro;
    }

    public String getFkTombamento() {
        return fkTombamento;
    }

    public void setFkTombamento(String fkTombamento) {
        this.fkTombamento = fkTombamento;
    }

    public String getFkIdAgendamento() {
        return fkIdAgendamento;
    }

    public void setFkIdAgendamento(String fkIdAgendamento) {
        this.fkIdAgendamento = fkIdAgendamento;
    }

    public String getFkMatAluno() {
        return fkMatAluno;
    }

    public void setFkMatAluno(String fkMatAluno) {
        this.fkMatAluno = fkMatAluno;
    }

    public String getFkNomeAluno() {
        return fkNomeAluno;
    }

    public void setFkNomeAluno(String fkNomeAluno) {
        this.fkNomeAluno = fkNomeAluno;
    }

    public String getFkMatUsuario() {
        return fkMatUsuario;
    }

    public void setFkMatUsuario(String fkMatUsuario) {
        this.fkMatUsuario = fkMatUsuario;
    }

    public String getDataHoraRetirada() {
        return dataHoraRetirada;
    }

    public void setDataHoraRetirada(String dataHoraRetirada) {
        this.dataHoraRetirada = dataHoraRetirada;
    }

    public String getDataHoraDevolucao() {
        return dataHoraDevolucao;
    }

    public void setDataHoraDevolucao(String dataHoraDevolucao) {
        this.dataHoraDevolucao = dataHoraDevolucao;
    }

    public String getDataHoraAgendamento() {
        return dataHoraAgendamento;
    }

    public void setDataHoraAgendamento(String dataHoraAgendamento) {
        this.dataHoraAgendamento = dataHoraAgendamento;
    }

}
