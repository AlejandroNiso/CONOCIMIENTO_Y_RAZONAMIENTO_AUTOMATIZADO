package akinator;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 *
 * @author
 */
public class Akinator {

    public static void main(String[] args) {
        ejecutarSwipl();
    }

    private static void ejecutarSwipl() {
        String consult = "consult('../../../../exe.pl').\n";
        String aki = "akinator.\n";
        byte[] cons = consult.getBytes();
        byte[] ak = aki.getBytes();

        try {
            System.out.println("Entrando en try");
            Process p = Runtime.getRuntime().exec("swipl");

            InputStream is = p.getErrorStream();
            byte[] buffer = new byte[is.available()];
            is.read(buffer, 0, is.available());
            for (byte dato : buffer) {
                System.out.print((char) dato);
            }

            System.out.println("Proceso creado");
            OutputStream os = p.getOutputStream();
            
            InputStream is1 = p.getInputStream();
            System.out.println("Canales creados");

            os.write(cons);
            System.out.println("Escribiendo consulta");
            
            os.write(ak);
            System.out.println("Escribiendo akinator");
            byte[] buf = new byte[is.available()];
            is.read(buf, 0, is.available());
            for (byte dato : buf) {
                System.out.print((char) dato);
            }
            
            System.out.println("Leyendo");
            //System.out.println(is1.read());
            
            byte[] buf2 = new byte[is1.available()];
            is.read(buf2, 0, is.available());
            for (byte dato : buf2) {
                System.out.print((char) dato);
            }

        } catch (IOException e) {
            System.out.println("Error: " + e.toString());
        }
    }

}
