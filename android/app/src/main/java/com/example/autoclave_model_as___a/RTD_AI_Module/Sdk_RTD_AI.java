package com.example.autoclave_model_as___a.RTD_AI_Module;

import java.io.IOException;

import asim.sdk.common.Utils;
import asim.sdk.tempandhum.SDKTemperatureAndHumidity;

public class Sdk_RTD_AI extends SDKTemperatureAndHumidity {
    public static String checkMustHave;
    public static String checkMustHave2;
    public int READ_WAIT_MILLIS = 400;
    public int WRITE_WAIT_MILLIS = 400;

    public RTDData getTempData() {


        try {
            //request: 01 03 00 32 00 02 C5 C1
            //response: 01 03 04 00 F9 FC 18 6B 08   ----- 00F9 FC18: data nhiệt độ 2 đầu đo (hex)
            byte[] buffer = new byte[]{1, 3, 0, 32, 0, 2, -59, -63};
            this.usbSerialPort.write(buffer, this.WRITE_WAIT_MILLIS);
            byte[] bufferStatus = new byte[14];
            this.usbSerialPort.read(bufferStatus, this.READ_WAIT_MILLIS);
            checkMustHave = Utils.bytesToHex(new byte[]{bufferStatus[0], bufferStatus[1], bufferStatus[2]});
            if (checkMustHave.equals("010304")) {
                String temp1 = Utils.bytesToHex(new byte[]{bufferStatus[3], bufferStatus[4]});
                String temp2 = Utils.bytesToHex(new byte[]{bufferStatus[5], bufferStatus[6]});
                double temp1Data = (double) Integer.parseInt(temp1, 16) / 10.0D;
                double temp2Data = (double) Integer.parseInt(temp2, 16) / 10.0D;

                this.disconnect();

                return new RTDData(temp1Data, temp2Data);
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
            //request: 03 03 00 32 00 02 64 26
            //response: 03 03 04 ............  ------- 0000 0000 : data 2 AI (hex)
            byte[] buffer = new byte[]{3, 3, 0, 50, 0, 2, 100, 38};
            this.usbSerialPort.write(buffer, this.WRITE_WAIT_MILLIS);
            byte[] bufferStatus = new byte[14];
            this.usbSerialPort.read(bufferStatus, this.READ_WAIT_MILLIS);
            checkMustHave2 = Utils.bytesToHex(new byte[]{bufferStatus[0], bufferStatus[1], bufferStatus[2]});
            if (checkMustHave2.equals("030304")) {
                String press1 = Utils.bytesToHex(new byte[]{bufferStatus[3], bufferStatus[4]});
                String press2 = Utils.bytesToHex(new byte[]{bufferStatus[5], bufferStatus[6]});
                double dt1 = (double) (Integer.parseInt(press1, 16) * 0.001);
                double dt2 = (double) (Integer.parseInt(press2, 16) * 0.001);

                //tính theo 0-10 V: -1 -> 9 kgf/cm2
                double press1Data = dt1 - 1.00;
                double press2Data = dt2 - 1.00;


//                //tính theo 4-20 mA: -1 -> 9 kgf/cm2
//                double dt1 = ((double) Integer.parseInt(press1, 16) * 0.0004);
//                double dt2 = (double) Integer.parseInt(press2, 16) * 0.0004;
//                double dt3 = (double) Integer.parseInt(press3, 16) * 0.0004;
//                double dt4 = (double) Integer.parseInt(press4, 16) * 0.0004;
//                double press1Data = (10 * dt1 - 56) / 16;
//                double press2Data = (10 * dt2 - 56) / 16;


//                // 4-20 mA, 0-6 bar
//                double press1Data = (6 * dt1 - 24) / 16;
//                double press2Data = (6 * dt2 - 24) / 16;


                this.disconnect();

                return new AIData(press1Data, press2Data);
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
