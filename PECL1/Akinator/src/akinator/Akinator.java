package akinator;

import java.net.DatagramSocket;
import java.net.SocketException;

/**
 *
 * Juan Casado Ballesteros 
 * Gabriel López Cuenca 
 * Álvaro Zamorano Ortega
 */
public class Akinator {

    public static void main(String[] args) throws SocketException {
        DatagramSocket socket = null;
        Interfaz interfaz;
        try {
            socket = new DatagramSocket(5008);
        } catch (SocketException e) {
            System.out.println(e.toString());
        }
        interfaz = new Interfaz(socket);
        java.awt.EventQueue.invokeLater(() -> {
            interfaz.setVisible(true);
        });
        UDP udp = new UDP(socket, interfaz);
        udp.start();
    }
}
