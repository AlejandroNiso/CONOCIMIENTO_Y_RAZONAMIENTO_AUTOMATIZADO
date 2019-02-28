/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package akinator;

import java.io.IOException;
import java.io.InputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Álvaro Zamorano
 */
public class UDP extends Thread {

    private Interfaz interfaz;
    private DatagramSocket socket;
    private ArrayList<String> datosRecibidos = new ArrayList<>();

    public UDP(DatagramSocket socket, Interfaz interfaz) {
        this.interfaz = interfaz;
        this.socket = socket;
        datosRecibidos.add("");
        datosRecibidos.add("");
        datosRecibidos.add("");
        datosRecibidos.add("");
    }

    @Override
    public void run() {
        boolean continuar = true;
        Process p;
        try {
            String ruta = "../../../pruebasocket.pl";
            p = Runtime.getRuntime().exec("swipl --win_app" + ruta);
            System.out.println("1");
            //p.waitFor();
            System.out.println("2");
            InputStream is = p.getErrorStream();
            System.out.println("3");
            byte[] buffer = new byte[is.available()];
            is.read(buffer, 0, is.available());
            System.out.println("4");
            for (byte dato : buffer) {
                System.out.print((char) dato);
            }
        } catch (IOException ex) {
            System.out.println(ex.toString());
        }

        System.out.println("5");
        while (continuar) {
            int index = 0;

            try {
                byte[] receiveData = new byte[1024];
                System.out.println("Waiting");
                while (true) {
                    for (int i = 0; i < receiveData.length; i++) {
                        receiveData[i] = 0;
                    }
                    DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                    socket.receive(receivePacket);
                    String sentence = new String(receivePacket.getData());
                    System.out.println("Received: " + sentence);
                    InetAddress IPAddress = receivePacket.getAddress();
                    switch (sentence.charAt(0)) {
                        case '$':
                            //Nueva lista respuestas
                            index = 0;
                            colocarString(index, "");
                            datosRecibidos.set(index, "");
                            break;
                        case '#':
                            //Lista de lenguajes
                            index = 1;
                            colocarString(index, "");
                            datosRecibidos.set(index, "");
                            break;
                        case '%':
                            //Varios
                            index = 2;
                            colocarString(index, "");
                            datosRecibidos.set(index, "");
                            break;
                        case '@':
                            //Preguntas
                            index = 3;
                            colocarString(index, "");
                            datosRecibidos.set(index, "");
                            break;
                        default:
                            index = 4;
                    }
                    if (index != 4) {
                        String buffer = datosRecibidos.get(index);
                        for (int i = 1; i < sentence.length(); i++) {
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

    private void colocarString(int index, String s) {
        switch (index) {
            case 0:
                //Nueva lista respuestas
                interfaz.escribirRespuestas(s);
                break;
            case 1:
                //Lista de lenguajes
                interfaz.escribirLenguajes(s);
                break;
            case 2:
                //Varios
                interfaz.escribirVarios(s);
                break;
            case 3:
                //Preguntas
                interfaz.escribirPregunta(s);
                break;
        }
    }
}
