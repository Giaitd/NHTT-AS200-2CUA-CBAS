package com.example.autoclave_model_as___a.DIDOModule;

import android.content.Context;

import com.example.autoclave_model_as___a.Program.Globals;

import java.util.List;

import asim.sdk.locker.DeviceInfo;
import asim.sdk.locker.SDKLocker;

public class SetDO {
    public static byte[] Q00On = {2, 5, 0, 0, -1, 0, -116, 9};  //may hck
    public static byte[] Q00Off = {2, 5, 0, 0, 0, 0, -51, -7};

    public static byte[] Q01On = {2, 5, 0, 1, -1, 0, -35, -55};   //van bom hoi
    public static byte[] Q01Off = {2, 5, 0, 1, 0, 0, -100, 57};

    public static byte[] Q02On = {2, 5, 0, 2, -1, 0, 45, -55};    //van xa cham
    public static byte[] Q02Off = {2, 5, 0, 2, 0, 0, 108, 57};

    public static byte[] Q03On = {2, 5, 0, 3, -1, 0, 124, 9};   //van xa nhanh
    public static byte[] Q03Off = {2, 5, 0, 3, 0, 0, 61, -7};

    public static byte[] Q04On = {2, 5, 0, 4, -1, 0, -51, -56};   //van xa day noi hoi
    public static byte[] Q04Off = {2, 5, 0, 4, 0, 0, -116, 56};

    public static byte[] Q05On = {2, 5, 0, 5, -1, 0, -100, 8};  //van cap khi gioang 1
    public static byte[] Q05Off = {2, 5, 0, 5, 0, 0, -35, -8};

    public static byte[] Q06On = {2, 5, 0, 6, -1, 0, 108, 8};   //thanh dot
    public static byte[] Q06Off = {2, 5, 0, 6, 0, 0, 45, -8};

    public static byte[] Q07On = {2, 5, 0, 7, -1, 0, 61, -56}; //van xa khi gioang 1
    public static byte[] Q07Off = {2, 5, 0, 7, 0, 0, 124, 56};

    public static byte[] Q08On = {2, 5, 0, 8, -1, 0, 13, -53};     //bom nuoc noi hoi
    public static byte[] Q08Off = {2, 5, 0, 8, 0, 0, 76, 59};

    public static byte[] Q09On = {2, 5, 0, 9, -1, 0, 92, 11};      //van can bang ap
    public static byte[] Q09Off = {2, 5, 0, 9, 0, 0, 29, -5};

    public static byte[] Q10On = {2, 5, 0, 10, -1, 0, -84, 11};  //van cấp khí gioăng 2
    public static byte[] Q10Off = {2, 5, 0, 10, 0, 0, -19, -5};

    public static byte[] Q11On = {2, 5, 0, 11, -1, 0, -3, -53};     //van xả khí gioăng 2
    public static byte[] Q11Off = {2, 5, 0, 11, 0, 0, -68, 59};

    public static byte[] Q12On = {2, 5, 0, 12, -1, 0, 76, 10};      //đèn báo kết thúc
    public static byte[] Q12Off = {2, 5, 0, 12, 0, 0, 13, -6};

    public static byte[] Q13On = {2, 5, 0, 13, -1, 0, 29, -54};     //xả đáy máy nén khí
    public static byte[] Q13Off = {2, 5, 0, 13, 0, 0, 92, 58};

    public static byte[] Q14On = {2, 5, 0, 14, -1, 0, -19, -54};    //cấp nước làm mát
    public static byte[] Q14Off = {2, 5, 0, 14, 0, 0, -84, 58};

    public static byte[] Q15On = {2, 5, 0, 15, -1, 0, -68, 10};
    public static byte[] Q15Off = {2, 5, 0, 15, 0, 0, -3, -6};


    public static void writeDO(Context context) {

        SdkDIDOModule DOSdk = new SdkDIDOModule();

        List<DeviceInfo> devices = SDKLocker.getAllUsbDevicesHasDriver(context);
        for (DeviceInfo each : devices) {
            boolean connect = DOSdk.connect(context, each, 9600);
            if (connect) {
                if (SdkDIDOModule.checkReadDO.equals("0201")) {
                    DOSdk.setDOData();
                    break;
                }

            }
        }
    }


    //vacuum on/off
    public static void vacuumOn(Context context) {
        if (!Globals.dOData.q0[0]) {
            Globals.bufferAll = Q00On;
            writeDO(context);
        }

    }

    public static void vacuumOff(Context context) {
        if (Globals.dOData.q0[0]) {
            Globals.bufferAll = Q00Off;
            writeDO(context);
        }
    }

    //steam to chamber on/off
    public static void steamToChamberOn(Context context) {
        if (!Globals.dOData.q0[1]) {
            Globals.bufferAll = Q01On;
            writeDO(context);
        }
    }

    public static void steamToChamberOff(Context context) {
        if (Globals.dOData.q0[1]) {
            Globals.bufferAll = Q01Off;
            writeDO(context);
        }
    }

    //slow exhaust on/off
    public static void slowExhaustOn(Context context) {
        if (!Globals.dOData.q0[2]) {
            Globals.bufferAll = Q02On;
            writeDO(context);
        }
    }

    public static void slowExhaustOff(Context context) {
        if (Globals.dOData.q0[2]) {
            Globals.bufferAll = Q02Off;
            writeDO(context);
        }
    }

    //fast exhaust on/off
    public static void fastExhaustOn(Context context) {
        if (!Globals.dOData.q0[3]) {
            Globals.bufferAll = Q03On;
            writeDO(context);
        }
    }

    public static void fastExhaustOff(Context context) {
        if (Globals.dOData.q0[3]) {
            Globals.bufferAll = Q03Off;
            writeDO(context);
        }
    }

    //waterBoilerOut
    public static void waterBoilerOutOn(Context context) {
        if (!Globals.dOData.q0[4]) {
            Globals.bufferAll = Q04On;
            writeDO(context);
        }
    }

    public static void waterBoilerOutOff(Context context) {
        if (Globals.dOData.q0[4]) {
            Globals.bufferAll = Q04Off;
            writeDO(context);
        }
    }

    //air to gasket 1 on/off
    public static void airToGasket1On(Context context) {
        if (!Globals.dOData.q0[5]) {
            Globals.bufferAll = Q05On;
            writeDO(context);
        }
    }

    public static void airToGasket1Off(Context context) {
        if (Globals.dOData.q0[5]) {
            Globals.bufferAll = Q05Off;
            writeDO(context);
        }
    }

    //boiler on/off
    public static void boilerOn(Context context) {
        if (!Globals.dOData.q0[6]) {
            Globals.bufferAll = Q06On;
            writeDO(context);
        }
    }

    public static void boilerOff(Context context) {
        if (Globals.dOData.q0[6]) {
            Globals.bufferAll = Q06Off;
            writeDO(context);
        }
    }

    //air out gasket 1 on/off
    public static void airOutGasket1On(Context context) {
        if (!Globals.dOData.q0[7]) {
            Globals.bufferAll = Q07On;
            writeDO(context);
        }
    }

    public static void airOutGasket1Off(Context context) {

        if (Globals.dOData.q0[7]) {
            Globals.bufferAll = Q07Off;
            writeDO(context);
        }
    }

    //water to boiler on/off
    public static void waterPumpOn(Context context) {
        if (!Globals.dOData.q1[0]) {
            Globals.bufferAll = Q08On;
            writeDO(context);
        }
    }

    public static void waterPumpOff(Context context) {
        if (Globals.dOData.q1[0]) {
            Globals.bufferAll = Q08Off;
            writeDO(context);
        }
    }

    //balance on/off
    public static void balanceOn(Context context) {

        if (!Globals.dOData.q1[1]) {
            Globals.bufferAll = Q09On;
            writeDO(context);
        }
    }

    public static void balanceOff(Context context) {
        if (Globals.dOData.q1[1]) {
            Globals.bufferAll = Q09Off;
            writeDO(context);
        }
    }

    //air to gasket 2 on/off
    public static void airToGasket2On(Context context) {
        if (!Globals.dOData.q1[2]) {
            Globals.bufferAll = Q10On;
            writeDO(context);
        }
    }

    public static void airToGasket2Off(Context context) {
        if (Globals.dOData.q1[2]) {
            Globals.bufferAll = Q10Off;
            writeDO(context);
        }
    }

    //air out gasket 2 on/off
    public static void airOutGasket2On(Context context) {
        if (!Globals.dOData.q1[3]) {
            Globals.bufferAll = Q11On;
            writeDO(context);
        }
    }

    public static void airOutGasket2Off(Context context) {

        if (Globals.dOData.q1[3]) {
            Globals.bufferAll = Q11Off;
            writeDO(context);
        }
    }

    //complete
    public static void ledCompleteOn(Context context) {
        if (!Globals.dOData.q1[4]) {
            Globals.bufferAll = Q12On;
            writeDO(context);
        }
    }

    public static void ledCompleteOff(Context context) {

        if (Globals.dOData.q1[4]) {
            Globals.bufferAll = Q12Off;
            writeDO(context);
        }
    }

    //compressor valve
    public static void compressorValveOn(Context context) {
        if (!Globals.dOData.q1[5]) {
            Globals.bufferAll = Q13On;
            writeDO(context);
        }
    }

    public static void compressorValveOff(Context context) {

        if (Globals.dOData.q1[5]) {
            Globals.bufferAll = Q13Off;
            writeDO(context);
        }
    }

    //water cooling
    public static void waterCoolingOn(Context context) {
        if (!Globals.dOData.q1[6]) {
            Globals.bufferAll = Q14On;
            writeDO(context);
        }
    }

    public static void waterCoolingOff(Context context) {
        if (Globals.dOData.q1[6]) {
            Globals.bufferAll = Q14Off;
            writeDO(context);
        }
    }


}
