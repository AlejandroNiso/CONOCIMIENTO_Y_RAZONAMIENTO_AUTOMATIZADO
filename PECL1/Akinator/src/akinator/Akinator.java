package akinator;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.DatagramSocket;
import java.net.SocketException;

/**
 *
 * @author
 */
public class Akinator {

    
    
    public static void main(String[] args) throws SocketException {
        DatagramSocket serverSocket = null;
        Interfaz interfaz;
        
        try{
            serverSocket = new DatagramSocket(5008);
        }catch(SocketException e){
            
        }
       interfaz = new Interfaz(serverSocket);
        java.awt.EventQueue.invokeLater(() -> {
            interfaz.setVisible(true);          
        });
        
        UDP udp = new UDP(serverSocket,interfaz);
        udp.start();
    }
}
