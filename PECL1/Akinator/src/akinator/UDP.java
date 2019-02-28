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
import java.util.ArrayList;
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
            ArrayList<String> datosRecibidos = new ArrayList<>();
            datosRecibidos.add("");
            datosRecibidos.add("");
            datosRecibidos.add("");
            datosRecibidos.add("");
            int index = 0;
            
            try{
                byte[] receiveData = new byte[1024];
                while(true){
                    for(int i = 0;i<receiveData.length;i++){
                        receiveData[i] = 0;
                    }
                    DatagramPacket receivePacket = new DatagramPacket(receiveData,receiveData.length);
                    socket.receive(receivePacket);
                    String sentence = new String(receivePacket.getData());
                    System.out.println("Received: " + sentence);
                    InetAddress IPAddress = receivePacket.getAddress(); 
                    switch(sentence.charAt(0)){
                        case'$':
                            //Nueva lista respuestas
                            index = 0;
                            interfaz.escribirRespuestas("");
                            datosRecibidos.set(index, "");
                            break;
                        case'#':
                            //Lista de lenguajes
                            index = 1;
                            interfaz.escribirLenguajes("");
                            datosRecibidos.set(index, "");
                            break;
                        case'%':
                            //Varios
                            index = 2;
                            interfaz.escribirVarios("");
                            datosRecibidos.set(index, "");
                            break;
                        case'@':
                            //Preguntas
                            index = 3;
                            interfaz.escribirPregunta("");
                            break;
                        default:
                            index = 4;                         
                    }
                    if(index != 4){
                        String buffer = datosRecibidos.get(index);
                        for(int i = 0 ;i<sentence.length();i++){
                            buffer += sentence.charAt(i);
                        }
                        datosRecibidos.set(index, buffer);
                    }
                }
            
            } catch (SocketException ex) {
            Logger.getLogger(UDP.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
            Logger.getLogger(UDP.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}
