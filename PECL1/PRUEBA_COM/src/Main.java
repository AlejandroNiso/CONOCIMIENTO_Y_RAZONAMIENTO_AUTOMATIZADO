import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        Process p;
        try {
            String ruta = "../../pruebasocket.pl";
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
        try {
            DatagramSocket serverSocket = new DatagramSocket(5008);
            byte[] receiveData = new byte[1];
            byte[] sendData;
            System.out.println("Start");
            while (true) {
                DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                System.out.println("Waiting");
                serverSocket.receive(receivePacket);
                String sentence = new String(receivePacket.getData());
                System.out.println("RECEIVED: " + sentence);
                InetAddress IPAddress = receivePacket.getAddress();
                int port = 5009;
                System.out.println("Sending to "+port);
                String readed = keyboard.nextLine();
                sendData = readed.getBytes();
                DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, port);
                serverSocket.send(sendPacket);
            }
        }catch (Exception e){
            System.out.println(e.toString());
        }
    }
}
