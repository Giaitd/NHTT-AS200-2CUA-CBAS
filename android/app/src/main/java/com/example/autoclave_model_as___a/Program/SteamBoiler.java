package com.example.autoclave_model_as___a.Program;

import android.content.Context;
import android.util.Log;

import com.example.autoclave_model_as___a.DIDOModule.SetDO;
import com.example.autoclave_model_as___a.Thread.FunctionThread;

public class SteamBoiler {
    public static void boilerControll(Context context) {


        //trang thai ket thuc, xa day thi khong dot
        if (Globals.progress != 4 && !Globals.dIData.i0[6]) {
            //water pump
            if (Globals.dIData.i0[1] && !Globals.dIData.i0[3] && !Globals.dIData.i0[4]) {
                SetDO.waterPumpOn(context);
            } else if (Globals.dIData.i0[4] || !Globals.dIData.i0[1]) {
                SetDO.waterPumpOff(context);
            }

            //chưa đủ áp suất nồi hơi (chỉ dùng để chạy thanh đốt)
            // sau 20s từ lúc nhận tín hiệu báo thiếu áp mới chạy thanh đốt, để tránh TH đóng ngắt liên tục
            if (!Globals.dIData.i0[7] && Globals.delaySteamBoiler > 0) {
                Globals.delaySteamBoiler--;
                if (Globals.delaySteamBoiler == 0) {
                    Globals.notEnoughSteam = true;
                }
                Log.d("counter", String.valueOf(Globals.delaySteamBoiler));
            } else if (Globals.dIData.i0[7]) {
                Globals.notEnoughSteam = false;
                Globals.delaySteamBoiler = 15;
            }

            /*===== Boiler ======================================*/
            if (Globals.dIData.i0[2] && Globals.notEnoughSteam && !Globals.errorStatus) {
                SetDO.boilerOn(context);
                FunctionThread.boilerThreadOn();

            } else {
                SetDO.boilerOff(context);
                FunctionThread.boilerThreadOff();
            }
        } else {
            SetDO.boilerOff(context);
            SetDO.waterPumpOff(context);
            FunctionThread.boilerThreadOff();
        }

    }
}
