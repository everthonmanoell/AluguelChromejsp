package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DataHora {

    /*------------------- Hora e data atual do sistema ------------------------*/
    public static String getHoraAtual() {
        // Obtém a hora atual
        Date agora = new Date();
        // Define o formato desejado para a hora
        SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm:ss");
        // Retorna a hora formatada
        return formatoHora.format(agora);
    }

    public static String getDataAtual() {
        // Obtém a data atual
        Date agora = new Date();
        // Define o formato desejado para a data (formato ISO)
        SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd", new Locale("pt", "BR"));
        // Retorna a data formatada
        return formatoData.format(agora);
    }
    
}
