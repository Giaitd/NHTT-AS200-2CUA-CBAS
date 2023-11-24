package com.example.autoclave_model_as___a.RTD_AI_Module;

import java.io.IOException;

import asim.sdk.common.Utils;
import asim.sdk.tempandhum.SDKTemperatureAndHumidity;

public class Sdk_RTD_AI extends SDKTemperatureAndHumidity {
    public static String checkMustHave;
    public static String checkMustHave2;


    public RTDData getTempData() {


        try {
            //request: 01 04 00 00 00 04 F1 C9
            //response: 01 04 08 01 5C 27 10 27 10 27 10 AF 9D   ----- 015C 2710 2710 2710: data nhiệt độ 4 đầu đo (hex)
            byte[] buffer = new byte[]{1, 4, 0, 0, 0, 4, -15, -55};
            this.usbSerialPort.write(buffer, this.WRITE_WAIT_MILLIS);
            byte[] bufferStatus = new byte[14];
            this.usbSerialPort.read(bufferStatus, this.READ_WAIT_MILLIS);
            checkMustHave = Utils.bytesToHex(new byte[]{bufferStatus[0], bufferStatus[1], bufferStatus[2]});
            if (checkMustHave.equals("010408")) {
                String temp1 = Utils.bytesToHex(new byte[]{bufferStatus[3], bufferStatus[4]});
                String temp2 = Utils.bytesToHex(new byte[]{bufferStatus[5], bufferStatus[6]});
                String temp3 = Utils.bytesToHex(new byte[]{bufferStatus[7], bufferStatus[8]});
                String temp4 = Utils.bytesToHex(new byte[]{bufferStatus[9], bufferStatus[10]});
                double temp1Data = (double) Integer.parseInt(temp1, 16) / 10.0D;
                double temp2Data = (double) Integer.parseInt(temp2, 16) / 10.0D;
                double temp3Data = (double) Integer.parseInt(temp3, 16) / 10.0D;
                double temp4Data = (double) Integer.parseInt(temp4, 16) / 10.0D;

                this.disconnect();

                return new RTDData(temp1Data, temp2Data, temp3Data, temp4Data);
            } else {

                this.disconnect();
                return null;
            }
        } catch (IOException var14) {

            var14.printStackTrace();
            this.disconnect();
            this.disconnect();
            return null;
        }
    }


    public AIData getPressData() {


        try {
            //request: 01 04 00 04 00 04 B0 08
            //response: 01 04 08 26 27 00 00 00 00 00 00 F1 3D  ------- 2627 0000 0000 0000: data 4 AI (hex)
            byte[] buffer = new byte[]{1, 4, 0, 4, 0, 4, -80, 8};
            this.usbSerialPort.write(buffer, this.WRITE_WAIT_MILLIS);
            byte[] bufferStatus = new byte[14];
            this.usbSerialPort.read(bufferStatus, this.READ_WAIT_MILLIS);
            checkMustHave2 = Utils.bytesToHex(new byte[]{bufferStatus[0], bufferStatus[1], bufferStatus[2]});
            if (checkMustHave2.equals("010408")) {
                String press1 = Utils.bytesToHex(new byte[]{bufferStatus[3], bufferStatus[4]});
                String press2 = Utils.bytesToHex(new byte[]{bufferStatus[5], bufferStatus[6]});
                String press3 = Utils.bytesToHex(new byte[]{bufferStatus[7], bufferStatus[8]});
                String press4 = Utils.bytesToHex(new byte[]{bufferStatus[9], bufferStatus[10]});
                double dt1 = ((double) Integer.parseInt(press1, 16) * 0.0002);
                double dt2 = (double) Integer.parseInt(press2, 16) * 0.0002;
                double dt3 = (double) Integer.parseInt(press3, 16) * 0.0002;
                double dt4 = (double) Integer.parseInt(press4, 16) * 0.0002;

                //tính theo 0-10 V: -1 -> 9 kgf/cm2
                double press1Data = dt1 - 1.00;
                double press2Data = dt2 - 1.00;
                double press3Data = dt3 - 1.00;
                double press4Data = dt4 - 1.00;


//                //tính theo 4-20 mA: -1 -> 9 kgf/cm2
//                double dt1 = ((double) Integer.parseInt(press1, 16) * 0.0004);
//                double dt2 = (double) Integer.parseInt(press2, 16) * 0.0004;
//                double dt3 = (double) Integer.parseInt(press3, 16) * 0.0004;
//                double dt4 = (double) Integer.parseInt(press4, 16) * 0.0004;
//                double press1Data = (10 * dt1 - 56) / 16;
//                double press2Data = (10 * dt2 - 56) / 16;
//                double press3Data = (10 * dt3 - 56) / 16;
//                double press4Data = (10 * dt4 - 56) / 16;

//                // 4-20 mA, 0-6 bar
//                double press1Data = (6 * dt1 - 24) / 16;
//                double press2Data = (6 * dt2 - 24) / 16;
//                double press3Data = (6 * dt3 - 24) / 16;
//                double press4Data = (6 * dt4 - 24) / 16;

                this.disconnect();

                return new AIData(press1Data, press2Data, press3Data, press4Data);
            } else {

                this.disconnect();
                return null;
            }
        } catch (IOException var14) {

            var14.printStackTrace();
            this.disconnect();
            this.disconnect();
            return null;
        }
    }
}
