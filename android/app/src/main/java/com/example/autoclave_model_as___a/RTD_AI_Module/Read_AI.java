package com.example.autoclave_model_as___a.RTD_AI_Module;

import android.content.Context;
import android.os.Handler;

import com.example.autoclave_model_as___a.Program.Globals;

import java.util.List;
import java.util.TimerTask;

import asim.sdk.locker.DeviceInfo;
import asim.sdk.locker.SDKLocker;

public class Read_AI {

    public static TimerTask getAITask(Context context) {
        Handler mTimerHandler = new Handler();
        return new TimerTask() {
            public void run() {
                mTimerHandler.post(() -> {
                    Sdk_RTD_AI press_SDK = new Sdk_RTD_AI();
                    List<DeviceInfo> devices = SDKLocker.getAllUsbDevicesHasDriver(context);
                    for (DeviceInfo each : devices) {
                        boolean connect = press_SDK.connect(context, each, 9600);
                        if (connect) {
                            Globals.pressData = press_SDK.getPressData();
                            if (Sdk_RTD_AI.checkMustHave2.equals("030304")) {
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
