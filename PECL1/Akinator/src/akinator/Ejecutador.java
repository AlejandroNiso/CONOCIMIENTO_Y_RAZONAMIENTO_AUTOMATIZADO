package akinator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * Juan Casado Ballesteros 
 * Gabriel López Cuenca 
 * Álvaro Zamorano Ortega
 */
public class Ejecutador extends Thread {

    @Override
    public void run() {
        Process p;
        try {
            String ruta = "../../../pruebasocket2.pl";
            String nombreSO = System.getProperty("os.name");
            if (nombreSO.startsWith("Mac OS")) {
                p = Runtime.getRuntime().exec("swipl " + ruta);
            } else {
                p = Runtime.getRuntime().exec("swipl --win_app" + ruta);

                InputStream stderr = p.getInputStream();
                InputStreamReader isr = new InputStreamReader(stderr);
                BufferedReader br = new BufferedReader(isr);
                String line = null;
                while ((line = br.readLine()) != null) {
                    System.out.println(line);
                }

                int exitVal = p.waitFor();
                System.out.println("Process exitValue: " + exitVal);
            }

        } catch (IOException | InterruptedException ex) {
            Logger.getLogger(Ejecutador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
