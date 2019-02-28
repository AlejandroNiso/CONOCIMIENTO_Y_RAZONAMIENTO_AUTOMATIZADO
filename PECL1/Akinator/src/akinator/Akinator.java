package akinator;

import java.net.DatagramSocket;
import java.net.SocketException;

/**
 *
 * @author
 */
public class Akinator {

    public static void main(String[] args) throws SocketException {
        DatagramSocket escucharSocket = null;
        DatagramSocket enviarSocket = null;
        Interfaz interfaz;

        try {
            escucharSocket = new DatagramSocket(5008);
            enviarSocket = new DatagramSocket(5009);
        } catch (SocketException e) {

        }
        interfaz = new Interfaz(enviarSocket);
        java.awt.EventQueue.invokeLater(() -> {
            interfaz.setVisible(true);
        });

        UDP udp = new UDP(escucharSocket, interfaz);
        udp.start();
    }
}
