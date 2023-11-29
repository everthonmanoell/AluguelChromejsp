/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package usuario;

import java.util.LinkedList;

/**
 *
 * @author evert
 */
public class ControleAluguel {

    private LinkedList<Aluguel> aluguel;
    
     private static ControleAluguel instancia = null;

    private ControleAluguel() {
        this.aluguel = new LinkedList<Aluguel>();

    }

    public static ControleAluguel getInstance() {
        if (instancia == null) {
            instancia = new ControleAluguel();
        }
        return instancia;
    }

    public void adicionarAlgueul(Aluguel aluguel) {
        this.aluguel.add(aluguel);
    }

}
