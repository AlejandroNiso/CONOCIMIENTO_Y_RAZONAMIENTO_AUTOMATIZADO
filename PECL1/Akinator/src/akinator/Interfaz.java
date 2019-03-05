package akinator;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 
 */

public class Interfaz extends javax.swing.JFrame {

    int port = 5009;
    DatagramSocket socket;
    InetAddress direccion = InetAddress.getLoopbackAddress();

    /**
     * Creates new form Interfaz
     */
    public Interfaz(DatagramSocket socket) {
        initComponents();
        this.socket = socket;
    }

    public void enviar(String datos) {
        byte[] sendData = datos.getBytes();
        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, direccion, port);

        try {
            socket.send(sendPacket);
        } catch (IOException ex) {
            Logger.getLogger(Interfaz.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void escribirPregunta(String pregunta) {
        CampoPreguntas.setText(pregunta);
    }

    public void escribirRespuestas(String respuesta) {
        CampoRespuestas.setText(respuesta);
    }

    public void escribirLenguajes(String lenguajes) {
        CampoListaLenguajes.setText(lenguajes);
    }

    public void escribirVarios(String varios) {
        CampoVarios.setText(varios);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel21 = new javax.swing.JLabel();
        CampoRespuestas = new javax.swing.JTextField();
        CampoPreguntas = new javax.swing.JTextField();
        jLabel22 = new javax.swing.JLabel();
        jLabel23 = new javax.swing.JLabel();
        CampoNuevoLenguaje = new javax.swing.JTextField();
        BotonResSI = new javax.swing.JButton();
        BotonResPSI = new javax.swing.JButton();
        BotonResNS = new javax.swing.JButton();
        BotonResPNO = new javax.swing.JButton();
        BotonResNO = new javax.swing.JButton();
        jLabel24 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        CampoListaLenguajes = new javax.swing.JTextField();
        BotonInsertarSI = new javax.swing.JButton();
        BotonInsertarNO = new javax.swing.JButton();
        jLabel27 = new javax.swing.JLabel();
        BotonInsertarLenguaje = new javax.swing.JButton();
        jLabel28 = new javax.swing.JLabel();
        CampoVarios = new javax.swing.JTextField();
        BotonJugar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(153, 255, 102));

        jLabel21.setFont(new java.awt.Font("Showcard Gothic", 0, 14)); // NOI18N
        jLabel21.setText("aKINATOR");
        jPanel1.add(jLabel21);

        CampoRespuestas.setFont(new java.awt.Font("Nirmala UI", 0, 11)); // NOI18N

        CampoPreguntas.setFont(new java.awt.Font("Nirmala UI", 0, 11)); // NOI18N

        jLabel22.setFont(new java.awt.Font("Showcard Gothic", 0, 14)); // NOI18N
        jLabel22.setText("PREGUNTA");

        jLabel23.setFont(new java.awt.Font("Showcard Gothic", 0, 14)); // NOI18N
        jLabel23.setText("rESPUESTA");

        CampoNuevoLenguaje.setFont(new java.awt.Font("Nirmala UI", 0, 11)); // NOI18N
        CampoNuevoLenguaje.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CampoNuevoLenguajeActionPerformed(evt);
            }
        });

        BotonResSI.setText("SI");
        BotonResSI.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonResSIActionPerformed(evt);
            }
        });

        BotonResPSI.setText("PROBABLEMENTE SI");
        BotonResPSI.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonResPSIActionPerformed(evt);
            }
        });

        BotonResNS.setText("NO SE");
        BotonResNS.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonResNSActionPerformed(evt);
            }
        });

        BotonResPNO.setText("PROBABLEMENTE NO");
        BotonResPNO.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonResPNOActionPerformed(evt);
            }
        });

        BotonResNO.setText("NO");
        BotonResNO.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonResNOActionPerformed(evt);
            }
        });

        jLabel24.setFont(new java.awt.Font("Showcard Gothic", 0, 14)); // NOI18N
        jLabel24.setText("LISTA LENGUAJES PROBABLES");

        jLabel25.setFont(new java.awt.Font("Showcard Gothic", 0, 14)); // NOI18N
        jLabel25.setText("LISTA RESPUESTAS");

        CampoListaLenguajes.setFont(new java.awt.Font("Nirmala UI", 0, 11)); // NOI18N
        CampoListaLenguajes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CampoListaLenguajesActionPerformed(evt);
            }
        });

        BotonInsertarSI.setText("SI");
        BotonInsertarSI.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonInsertarSIActionPerformed(evt);
            }
        });

        BotonInsertarNO.setText("NO");
        BotonInsertarNO.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonInsertarNOActionPerformed(evt);
            }
        });

        jLabel27.setFont(new java.awt.Font("Showcard Gothic", 0, 14)); // NOI18N
        jLabel27.setText("NOMBRE");

        BotonInsertarLenguaje.setText("CONFIRMAR");
        BotonInsertarLenguaje.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonInsertarLenguajeActionPerformed(evt);
            }
        });

        jLabel28.setFont(new java.awt.Font("Showcard Gothic", 0, 14)); // NOI18N
        jLabel28.setText("NUEVO LENGUAJE");

        CampoVarios.setFont(new java.awt.Font("Nirmala UI", 0, 11)); // NOI18N

        BotonJugar.setText("JUGAR");
        BotonJugar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotonJugarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(CampoVarios)
                    .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(CampoPreguntas, javax.swing.GroupLayout.PREFERRED_SIZE, 599, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(84, 84, 84)
                                .addComponent(BotonResPSI)
                                .addGap(18, 18, 18)
                                .addComponent(BotonResNS)
                                .addGap(18, 18, 18)
                                .addComponent(BotonResPNO)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(BotonResNO, javax.swing.GroupLayout.PREFERRED_SIZE, 56, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(33, 33, 33))))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jLabel25, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(CampoRespuestas, javax.swing.GroupLayout.PREFERRED_SIZE, 548, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel23)
                                .addGap(8, 8, 8)
                                .addComponent(BotonResSI, javax.swing.GroupLayout.PREFERRED_SIZE, 62, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel28)
                                .addGap(40, 40, 40)
                                .addComponent(BotonInsertarSI)
                                .addGap(28, 28, 28)
                                .addComponent(BotonInsertarNO)
                                .addGap(38, 38, 38)
                                .addComponent(jLabel27)
                                .addGap(26, 26, 26)
                                .addComponent(CampoNuevoLenguaje, javax.swing.GroupLayout.PREFERRED_SIZE, 136, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(34, 34, 34)
                                .addComponent(BotonInsertarLenguaje)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel24)
                        .addGap(10, 10, 10)
                        .addComponent(CampoListaLenguajes)))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(317, 317, 317)
                .addComponent(BotonJugar)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(BotonJugar)
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(CampoPreguntas, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(35, 35, 35)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel23)
                    .addComponent(BotonResSI)
                    .addComponent(BotonResNS)
                    .addComponent(BotonResPNO)
                    .addComponent(BotonResNO)
                    .addComponent(BotonResPSI))
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(CampoRespuestas, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel25, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel24, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(CampoListaLenguajes, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(30, 30, 30)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(BotonInsertarSI)
                            .addComponent(BotonInsertarNO)
                            .addComponent(jLabel28, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(36, 36, 36)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(CampoNuevoLenguaje, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel27, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(BotonInsertarLenguaje))))
                .addGap(18, 18, 18)
                .addComponent(CampoVarios, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(22, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void CampoNuevoLenguajeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CampoNuevoLenguajeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_CampoNuevoLenguajeActionPerformed

    private void CampoListaLenguajesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CampoListaLenguajesActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_CampoListaLenguajesActionPerformed

    private void BotonInsertarLenguajeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonInsertarLenguajeActionPerformed
        String nombre = CampoNuevoLenguaje.getText();
        enviar(nombre + ".\n");
    }//GEN-LAST:event_BotonInsertarLenguajeActionPerformed

    private void BotonJugarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonJugarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_BotonJugarActionPerformed

    private void BotonResSIActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonResSIActionPerformed
        enviar("si");
    }//GEN-LAST:event_BotonResSIActionPerformed

    private void BotonResPSIActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonResPSIActionPerformed
        enviar("n");
    }//GEN-LAST:event_BotonResPSIActionPerformed

    private void BotonResNSActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonResNSActionPerformed
        enviar("n");
    }//GEN-LAST:event_BotonResNSActionPerformed

    private void BotonResPNOActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonResPNOActionPerformed
        enviar("n");
    }//GEN-LAST:event_BotonResPNOActionPerformed

    private void BotonResNOActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonResNOActionPerformed
        enviar("no");
    }//GEN-LAST:event_BotonResNOActionPerformed

    private void BotonInsertarSIActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonInsertarSIActionPerformed
        enviar("si");
    }//GEN-LAST:event_BotonInsertarSIActionPerformed

    private void BotonInsertarNOActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonInsertarNOActionPerformed
        enviar("no");
    }//GEN-LAST:event_BotonInsertarNOActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BotonInsertarLenguaje;
    private javax.swing.JButton BotonInsertarNO;
    private javax.swing.JButton BotonInsertarSI;
    private javax.swing.JButton BotonJugar;
    private javax.swing.JButton BotonResNO;
    private javax.swing.JButton BotonResNS;
    private javax.swing.JButton BotonResPNO;
    private javax.swing.JButton BotonResPSI;
    private javax.swing.JButton BotonResSI;
    private javax.swing.JTextField CampoListaLenguajes;
    private javax.swing.JTextField CampoNuevoLenguaje;
    private javax.swing.JTextField CampoPreguntas;
    private javax.swing.JTextField CampoRespuestas;
    private javax.swing.JTextField CampoVarios;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
