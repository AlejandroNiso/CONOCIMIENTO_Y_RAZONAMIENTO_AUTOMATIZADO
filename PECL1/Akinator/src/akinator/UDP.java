/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package akinator;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.SocketException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Álvaro Zamorano
 */
public class UDP extends Thread{
    Interfaz interfaz;
    DatagramSocket socket;
    
    public UDP(DatagramSocket socket, Interfaz interfaz){
        this.interfaz = interfaz;
        this.socket = socket;
    }
    
    @Override
    public void run(){
        boolean continuar = true;
        Process p;
        try {
            p = Runtime.getRuntime().exec("swipl ./../../../pruebasocket.pl");
            p.waitFor();
        } catch (IOException ex) {
            Logger.getLogger(UDP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(UDP.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        while(continuar){
            try{
                byte[] receiveData = new byte[1];
            
                while(true){
                    DatagramPacket receivePacket = new DatagramPacket(receiveData,receiveData.length);
                    socket.receive(receivePacket);
                    String sentence = new String(receivePacket.getData());
                    System.out.println("Received: " + sentence);
                    InetAddress IPAddress = receivePacket.getAddress();       
            }
            
            } catch (SocketException ex) {
            Logger.getLogger(UDP.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
            Logger.getLogger(UDP.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}
