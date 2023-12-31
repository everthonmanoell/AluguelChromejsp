package control;

import model.Aluguel;
import model.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


public class ControleBancoAluguel {

    private Conexao conexao;
    private Connection conn;

    private static ControleBancoAluguel instancia = null;

    private ControleBancoAluguel() {
        this.conexao = new Conexao();
        this.conn = conexao.getConnection();
    }

    public static ControleBancoAluguel getInstance() {
        if (instancia == null) {
            instancia = new ControleBancoAluguel();
        }
        return instancia;
    }
    
    
    /*------------------- Hora e data atual do sistema ------------------------*/
    public String getHoraAtual() {
        // Obtém a hora atual
        Date agora = new Date();
        // Define o formato desejado para a hora
        SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm:ss");
        // Retorna a hora formatada
        return formatoHora.format(agora);
    }

    public String getDataAtual() {
        // Obtém a data atual
        Date agora = new Date();
        // Define o formato desejado para a data (formato ISO)
        SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd", new Locale("pt", "BR"));
        // Retorna a data formatada
        return formatoData.format(agora);
    }

    
    /*---------------------------------------------------------------------------------------------*/

    /*------------------------- ADICIONAR ALUGUEL --------------------------------------*/
    public void adicionarAluguel(Aluguel aluguel) {
        // Verificar se o coordenador existe
        if (!existeCoordenador(aluguel.getMatriculaUsuario())) {
            throw new RuntimeException("Coordenador não encontrado.");
        }

        // Verificar se o aluno existe
        if (!existeAluno(aluguel.getMatriculaAluno())) {
            throw new RuntimeException("Aluno não encontrado.");
        }

        // Verificar se o chromebook existe
        if (!existeChromebook(aluguel.getTombamento())) {
            throw new RuntimeException("Chromebook não encontrado.");
        }

        // Se todos existirem, realizar a inserção
        String sql = "INSERT INTO aluguel (matricula_usuario, matricula_aluno, tombamento, data_inicio, hora_inicio, situacao_chromebook, nome_aluno) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, aluguel.getMatriculaUsuario());
            stmt.setString(2, aluguel.getMatriculaAluno());
            stmt.setString(3, aluguel.getTombamento());
            stmt.setString(4, aluguel.getDataInicio());
            stmt.setString(5, aluguel.getHoraInicio());
            stmt.setString(6, aluguel.getSituacaoChromebook());
            stmt.setString(7, aluguel.getNomeAluno());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    aluguel.setId(generatedKeys.getString(1));
                } else {
                    throw new SQLException("Não foi possível obter o ID do aluguel.");
                }
            } else {
                throw new SQLException("Falha ao adicionar aluguel, nenhuma linha afetada.");
            }

            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*----------------------------- Existe no sistema? ---------------------------*/
    private boolean existeCoordenador(String matriculaCoordenador) {
        String sql = "SELECT COUNT(*) FROM coordenador WHERE matricula = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, matriculaCoordenador);
            ResultSet resultado = stmt.executeQuery();
            return resultado.next() && resultado.getInt(1) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean existeAluno(String matriculaAluno) {
        String sql = "SELECT COUNT(*) FROM aluno WHERE matricula = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, matriculaAluno);
            ResultSet resultado = stmt.executeQuery();
            return resultado.next() && resultado.getInt(1) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean existeChromebook(String tombamento) {
        String sql = "SELECT COUNT(*) FROM chromebook WHERE tombamento = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, tombamento);
            ResultSet resultado = stmt.executeQuery();
            return resultado.next() && resultado.getInt(1) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*---------------------------------------------------------------*/

    public Aluguel getAluguel(String id) {
       Aluguel aluguel = null;

       try {
           String consulta = "SELECT * FROM aluguel WHERE id = ?";
           PreparedStatement stmt = conn.prepareStatement(consulta);
           stmt.setString(1, id);

           ResultSet resultado = stmt.executeQuery();

           if (resultado.next()) {
               aluguel = new Aluguel(
                       resultado.getString("nome_aluno"),
                       resultado.getString("matricula_usuario"),
                       resultado.getString("matricula_aluno"),
                       resultado.getString("tombamento"),
                       resultado.getString("situacao_chromebook"),
                       resultado.getString("data_inicio"),
                       resultado.getString("hora_inicio")
               );

               aluguel.setId(resultado.getString("id"));
               aluguel.setDataTermino(resultado.getString("data_termino"));
               aluguel.setHoraTermino(resultado.getString("hora_termino"));
           }

           stmt.close();
       } catch (SQLException ex) {
           System.out.println("Não conseguiu consultar os dados do Aluguel.");
           ex.printStackTrace();
       }

       return aluguel;
   }


    public void alterarAluguel(String id, String situacaoChromebook, String horaTermino, String dataTermino) {
        try {
            String sql = "UPDATE aluguel SET situacao_chromebook = ?, hora_termino = ?, data_termino = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, situacaoChromebook);
            stmt.setString(2, horaTermino);
            stmt.setString(3, dataTermino);
            stmt.setString(4, id);

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu alterar os dados do Aluguel.");
        }
    }
    
    
    
/*--------------------- LISTAR ALUGUEIS E CONT ALUGUEIS ---------------------*/
    
        public String listarDadosAlugueisComDevolucao() {
    StringBuilder texto = new StringBuilder();

    try {
        String consulta = "SELECT * FROM aluguel";
        Statement stm = conn.createStatement();
        ResultSet resultado = stm.executeQuery(consulta);

        while (resultado.next()) {
            Aluguel aluguel = new Aluguel(
                    resultado.getString("nome_aluno"),
                    resultado.getString("matricula_usuario"),
                    resultado.getString("matricula_aluno"),
                    resultado.getString("tombamento"),
                    resultado.getString("situacao_chromebook"),
                    resultado.getString("data_inicio"),
                    
                    resultado.getString("hora_inicio")
            );

            aluguel.setId(resultado.getString("id"));
            aluguel.setDataTermino(resultado.getString("data_termino"));
            aluguel.setHoraTermino(resultado.getString("hora_termino"));

            // Condição similar à do método sem banco
             
                texto.append("<tr>")
                            .append("<td>").append(aluguel.getId()).append("</td>")
                            .append("<td>").append(aluguel.getNomeAluno()).append("</td>")
                            .append("<td>").append(aluguel.getMatriculaAluno()).append("</td>")
                            .append("<td>").append(aluguel.getMatriculaUsuario()).append("</td>")
                            .append("<td>").append(aluguel.getTombamento()).append("</td>")
                            .append("<td>").append(aluguel.getSituacaoChromebook()).append("</td>")
                            .append("<td>").append(aluguel.getDataInicio()).append("</td>")
                            .append("<td>").append(aluguel.getHoraInicio()).append("</td>")
                            .append("<td>").append(aluguel.getDataTermino()).append("</td>")
                            .append("<td>").append(aluguel.getHoraTermino()).append("</td>")
                    .append("</tr>");
            
        }

        stm.close();
    } catch (SQLException ex) {
        System.out.println("Não conseguiu consultar os dados dos Alugueis.");
        ex.printStackTrace();
    }
    
    
    

    return texto.toString();
}
    
    
    
    public String listarDadosAlugueisSemDevolucao() {
    StringBuilder texto = new StringBuilder();

    try {
        String consulta = "SELECT * FROM aluguel";
        Statement stm = conn.createStatement();
        ResultSet resultado = stm.executeQuery(consulta);

        while (resultado.next()) {
            Aluguel aluguel = new Aluguel(
                    resultado.getString("nome_aluno"),
                    resultado.getString("matricula_usuario"),
                    resultado.getString("matricula_aluno"),
                    resultado.getString("tombamento"),
                    resultado.getString("situacao_chromebook"),
                    resultado.getString("data_inicio"),
                    
                    resultado.getString("hora_inicio")
            );

            aluguel.setId(resultado.getString("id"));
            aluguel.setDataTermino(resultado.getString("data_termino"));
            aluguel.setHoraTermino(resultado.getString("hora_termino"));

            // Condição similar à do método sem banco
            if(aluguel.getDataTermino() == null || aluguel.getDataTermino().isEmpty() ){ 
                texto.append("<tr>")
                            .append("<td>").append(aluguel.getId()).append("</td>")
                            .append("<td>").append(aluguel.getNomeAluno()).append("</td>")
                            .append("<td>").append(aluguel.getMatriculaAluno()).append("</td>")
                            .append("<td>").append(aluguel.getMatriculaUsuario()).append("</td>")
                            .append("<td>").append(aluguel.getTombamento()).append("</td>")
                            .append("<td>").append(aluguel.getSituacaoChromebook()).append("</td>")
                            .append("<td>").append(aluguel.getDataInicio()).append("</td>")
                            .append("<td>").append(aluguel.getHoraInicio()).append("</td>")
                            .append("<td>")
                                .append("<a href=\"aluguel.jsp?id=").append(aluguel.getId()).append("\" class=\"btn btn-outline-primary btn-sm\">Devolver</a>")
                            .append("</td>")
                            .append("</tr>");
                    
            }
        }

        stm.close();
    } catch (SQLException ex) {
        System.out.println("Não conseguiu consultar os dados dos Alugueis.");
        ex.printStackTrace();
    }
       
    return texto.toString();
}
    
    
    
        public String listarPesquisaAlugueisSemDevolucao(String pesquisa) {
        StringBuilder texto = new StringBuilder();

        try {
            String consulta = "SELECT * FROM aluguel";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                String nome_aluno = resultado.getString("nome_aluno");
                String matricula_usuario = resultado.getString("matricula_usuario");
                String tombamento = resultado.getString("tombamento");
                String matricula_aluno = resultado.getString("matricula_aluno");
                String situacao_chromeboook = resultado.getString("situacao_chromebook");
                String data_inicio = resultado.getString("data_inicio");
                

                
                if (nome_aluno.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || matricula_usuario.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || tombamento.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || matricula_aluno.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || situacao_chromeboook.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || data_inicio.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1) {
                    Aluguel aluguel = new Aluguel(
                            resultado.getString("nome_aluno"),
                            resultado.getString("matricula_usuario"),
                            resultado.getString("matricula_aluno"),
                            resultado.getString("tombamento"),
                            resultado.getString("situacao_chromebook"),
                            resultado.getString("data_inicio"),

                            resultado.getString("hora_inicio")
                    );

                    aluguel.setId(resultado.getString("id"));
                    aluguel.setDataTermino(resultado.getString("data_termino"));
                    aluguel.setHoraTermino(resultado.getString("hora_termino"));

                    // Condição similar à do método sem banco
                    if(aluguel.getDataTermino() == null || aluguel.getDataTermino().isEmpty() ){ 
                        texto.append("<tr>")
                                    .append("<td>").append(aluguel.getId()).append("</td>")
                                    .append("<td>").append(aluguel.getNomeAluno()).append("</td>")
                                    .append("<td>").append(aluguel.getMatriculaAluno()).append("</td>")
                                    .append("<td>").append(aluguel.getMatriculaUsuario()).append("</td>")
                                    .append("<td>").append(aluguel.getTombamento()).append("</td>")
                                    .append("<td>").append(aluguel.getSituacaoChromebook()).append("</td>")
                                    .append("<td>").append(aluguel.getDataInicio()).append("</td>")
                                    .append("<td>").append(aluguel.getHoraInicio()).append("</td>")
                                    .append("<td>")
                                        .append("<a href=\"aluguel.jsp?id=").append(aluguel.getId()).append("\" class=\"btn btn-outline-primary btn-sm\">Devolver</a>")
                                    .append("</td>")
                                    .append("</tr>");

                    }
                }
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados dos Alugueis.");
            ex.printStackTrace();
        }

        return texto.toString();
    }
        
        
        
        
        public String listarPesquisaAlugueisComDevolucao(String pesquisa) {
        StringBuilder texto = new StringBuilder();

        try {
            String consulta = "SELECT * FROM aluguel";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            while (resultado.next()) {
                String nome_aluno = resultado.getString("nome_aluno");
                String matricula_usuario = resultado.getString("matricula_usuario");
                String tombamento = resultado.getString("tombamento");
                String matricula_aluno = resultado.getString("matricula_aluno");
                String situacao_chromeboook = resultado.getString("situacao_chromebook");
                String data_inicio = resultado.getString("data_inicio");
                

                
                if (nome_aluno.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || matricula_usuario.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || tombamento.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || matricula_aluno.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || situacao_chromeboook.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1 || data_inicio.toLowerCase().indexOf(pesquisa.toLowerCase()) != -1) {
                    Aluguel aluguel = new Aluguel(
                            resultado.getString("nome_aluno"),
                            resultado.getString("matricula_usuario"),
                            resultado.getString("matricula_aluno"),
                            resultado.getString("tombamento"),
                            resultado.getString("situacao_chromebook"),
                            resultado.getString("data_inicio"),

                            resultado.getString("hora_inicio")
                    );

                    aluguel.setId(resultado.getString("id"));
                    aluguel.setDataTermino(resultado.getString("data_termino"));
                    aluguel.setHoraTermino(resultado.getString("hora_termino"));

                   
                     
                        texto.append("<tr>")
                                    .append("<td>").append(aluguel.getId()).append("</td>")
                                    .append("<td>").append(aluguel.getNomeAluno()).append("</td>")
                                    .append("<td>").append(aluguel.getMatriculaAluno()).append("</td>")
                                    .append("<td>").append(aluguel.getMatriculaUsuario()).append("</td>")
                                    .append("<td>").append(aluguel.getTombamento()).append("</td>")
                                    .append("<td>").append(aluguel.getSituacaoChromebook()).append("</td>")
                                    .append("<td>").append(aluguel.getDataInicio()).append("</td>")
                                    .append("<td>").append(aluguel.getHoraInicio()).append("</td>")
                                    .append("<td>").append(aluguel.getDataTermino()).append("</td>")
                                    .append("<td>").append(aluguel.getHoraTermino()).append("</td>")
                                    
                                    .append("</tr>");

                    
                }
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu consultar os dados dos Alugueis.");
            ex.printStackTrace();
        }

        return texto.toString();
    }
    
    
    
    
    
        public int contarAlugueisComDevolucao() {
        int contador = 0;

        try {
            String consulta = "SELECT COUNT(*) FROM aluguel ";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            if (resultado.next()) {
                contador = resultado.getInt(1);
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu contar os aluguéis sem devolução.");
            ex.printStackTrace();
        }

        return contador;
    }



    public int contarAlugueisSemDevolucao() {
        int contador = 0;

        try {
            String consulta = "SELECT COUNT(*) FROM aluguel WHERE data_termino IS NULL OR data_termino = ''";
            Statement stm = conn.createStatement();
            ResultSet resultado = stm.executeQuery(consulta);

            if (resultado.next()) {
                contador = resultado.getInt(1);
            }

            stm.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu contar os aluguéis sem devolução.");
            ex.printStackTrace();
        }

        return contador;
    }
    
    public int contarAlugueisComPesquisa(String parametro) {
    int contador = 0;

    if (!parametro.isEmpty()) {
        try {
            String consulta = "SELECT COUNT(*) FROM aluguel " +
                              "WHERE (data_termino IS NULL OR data_termino = '') " +
                              "AND (nome_aluno LIKE ? OR matricula_usuario LIKE ? OR tombamento LIKE ? OR matricula_aluno LIKE ? OR situacao_chromebook LIKE ? OR data_inicio LIKE ?)";
            PreparedStatement stmt = conn.prepareStatement(consulta);

            for (int i = 1; i <= 6; i++) {
                stmt.setString(i, "%" + parametro + "%");
            }

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                contador = resultado.getInt(1);
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu contar os aluguéis com pesquisa.");
            ex.printStackTrace();
        }
    }

    return contador;
}
    
    
    
    
    public int contarAlugueisComPesquisaTudo(String parametro) {
    int contador = 0;

    if (!parametro.isEmpty()) {
        try {
            String consulta = "SELECT COUNT(*) FROM aluguel " +
                              "AND (nome_aluno LIKE ? OR matricula_usuario LIKE ? OR tombamento LIKE ? OR matricula_aluno LIKE ? OR situacao_chromebook LIKE ? OR data_inicio LIKE ?)";
            PreparedStatement stmt = conn.prepareStatement(consulta);

            for (int i = 1; i <= 6; i++) {
                stmt.setString(i, "%" + parametro + "%");
            }

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                contador = resultado.getInt(1);
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu contar os aluguéis com pesquisa.");
            ex.printStackTrace();
        }
    }

    return contador;
}

   public int contarAlugueisDevolvidosComPesquisa(String parametro) {
    int contador = 0;

    if (!parametro.isEmpty()) {
        try {
            String consulta = "SELECT COUNT(*) FROM aluguel " +
                              "WHERE (data_termino IS NULL OR data_termino = '') " +
                              "AND (nome_aluno LIKE ? OR matricula_usuario LIKE ? OR tombamento LIKE ? OR matricula_aluno LIKE ? OR situacao_chromebook LIKE ? OR data_inicio LIKE ?)";
            PreparedStatement stmt = conn.prepareStatement(consulta);

            for (int i = 1; i <= 6; i++) {
                stmt.setString(i, "%" + parametro + "%");
            }

            ResultSet resultado = stmt.executeQuery();

            if (resultado.next()) {
                contador = resultado.getInt(1);
            }

            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Não conseguiu contar os aluguéis com pesquisa.");
            ex.printStackTrace();
        }
    }

    return contador;
}
}
