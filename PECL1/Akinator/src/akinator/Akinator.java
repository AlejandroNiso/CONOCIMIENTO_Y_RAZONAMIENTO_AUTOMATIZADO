package akinator;

import java.io.IOException;

/**
 *
 * @author
 */
public class Akinator {

    public static void main(String[] args) {
        ejecutarSwipl();
    }

    private static void ejecutarSwipl() {
        try {
            ProcessBuilder pbuilder;

            pbuilder = new ProcessBuilder("swipl");
            pbuilder.redirectErrorStream(true);
            pbuilder.start();

        } catch (IOException e) {
            System.out.println("Error: " + e.toString());
        }
    }

}
