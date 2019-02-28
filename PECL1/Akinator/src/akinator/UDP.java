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
    private String datosRecibidos = "";

    public UDP(DatagramSocket socket, Interfaz interfaz) {
        this.interfaz = interfaz;
        this.socket = socket;
    }

    @Override
    public void run() {
        boolean continuar = true;
        Process p;
        try {
            String ruta = "../../../pruebasocket.pl";
            String nombreSO = System.getProperty("os.name");
            if (nombreSO.startsWith("Mac OS")) {
                p = Runtime.getRuntime().exec("swipl " + ruta);
            }else {
                p = Runtime.getRuntime().exec("swipl --win_app" + ruta);
            }
            InputStream is = p.getErrorStream();
            byte[] buffer = new byte[is.available()];
            is.read(buffer, 0, is.available());
            for (byte dato : buffer) {
                System.out.print((char) dato);
            }
        } catch (IOException ex) {
            System.out.println(ex.toString());
        }

        while (continuar) {
            int index = 0;
            boolean set = false;
            System.out.println("Sarted");
            try {
                byte[] receiveData = new byte[1024];
                while (true) {
                    for (int i = 0; i < receiveData.length; i++) {
                        receiveData[i] = 0;
                    }
                    DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                    socket.receive(receivePacket);
                    String sentence = new String(receivePacket.getData());
                    System.out.println("Received: " + sentence);
                    switch (sentence.charAt(0)) {
                        case '$'://Nueva lista respuestas
                            index = 0;
                            colocarString(index, "");
                            datosRecibidos="";
                            set = false;
                            break;
                        case '#'://Lista de lenguajes
                            index = 1;
                            colocarString(index, "");
                            datosRecibidos="";
                            set = false;
                            break;
                        case '%'://Varios
                            index = 2;
                            colocarString(index, "");
                            datosRecibidos="";
                            set = false;
                            break;
                        case '@'://Preguntas
                            index = 3;
                            colocarString(index, "");
                            datosRecibidos="";
                            set = false;
                            break;
                        default:
                            set = true;
                    }
                    if (set) {
                        for (int i = 0; i < sentence.length(); i++) {
                            if (sentence.charAt(i)!=0) {
                                datosRecibidos += sentence.charAt(i);
                            }
                        }
                        colocarString(index, datosRecibidos);
                    }
                }
            } catch (IOException ex) {
                System.out.println(ex.toString());
            }
        }

    }

    private void colocarString(int index, String s) {
        switch (index) {
            case 0://Nueva lista respuestas
                interfaz.escribirRespuestas(s);
                break;
            case 1://Lista de lenguajes
                interfaz.escribirLenguajes(s);
                break;
            case 2://Varios
                interfaz.escribirVarios(s);
                break;
            case 3://Preguntas
                interfaz.escribirPregunta(s);
                break;
        }
    }
}
