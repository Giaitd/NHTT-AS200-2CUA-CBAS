package com.example.autoclave_model_a.RTD_AI_Module;

import android.content.Context;
import android.os.Handler;
import android.util.Log;

import com.example.autoclave_model_a.Program.Globals;

import java.io.Console;
import java.util.List;
import java.util.TimerTask;

import asim.sdk.locker.DeviceInfo;
import asim.sdk.locker.SDKLocker;

public class Read_RTD_AI {

    public static TimerTask getRTDTask(Context context) {
        Handler mTimerHandler = new Handler();
        return new TimerTask() {
            public void run() {
                mTimerHandler.post(() -> {
                    Sdk_RTD_AI temp_press_SDK = new Sdk_RTD_AI();
                    List<DeviceInfo> devices = SDKLocker.getAllUsbDevicesHasDriver(context);
                    for (DeviceInfo each : devices) {
                        boolean connect = temp_press_SDK.connect(context, each, 9600);
                        if (connect) {
                            Globals.tempData = temp_press_SDK.getTempData();
                            if (Sdk_RTD_AI.checkMustHave.equals("010408")) {
                                Globals.temperature = Math.round((Globals.tempData.temperature1 + Globals.tempOffSet) * 10) / 10.0;
                            }
                        }


                        connect = temp_press_SDK.connect(context, each, 9600);
                        if (connect) {
                            Globals.pressData = temp_press_SDK.getPressData();
                            if (Sdk_RTD_AI.checkMustHave2.equals("010408")) {
                                Globals.pressure = Math.round((Globals.pressData.pressure1 + Globals.pressOffSet) * 100) / 100.0;
                                break;
                            }
                        }
                    }
                });
            }
        };
    }


}
