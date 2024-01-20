package com.example.autoclave_model_as___a.RTD_AI_Module;

import android.content.Context;
import android.os.Handler;

import com.example.autoclave_model_as___a.Program.Globals;

import java.util.List;
import java.util.TimerTask;

import asim.sdk.locker.DeviceInfo;
import asim.sdk.locker.SDKLocker;

public class Read_RTD {

    public static TimerTask getRTDTask(Context context) {
        Handler mTimerHandler = new Handler();
        return new TimerTask() {
            public void run() {
                mTimerHandler.post(() -> {
                    Sdk_RTD_AI temp_SDK = new Sdk_RTD_AI();
                    List<DeviceInfo> devices = SDKLocker.getAllUsbDevicesHasDriver(context);
                    for (DeviceInfo each : devices) {
                        boolean connect = temp_SDK.connect(context, each, 9600);
                        if (connect) {
                            Globals.tempData = temp_SDK.getTempData();
                            if (Sdk_RTD_AI.checkMustHave.equals("010304")) {
                                Globals.temperature = Math.round((Globals.tempData.temperature1 + Globals.tempOffSet) * 10) / 10.0;
                            }
                        }
                    }
                });
            }
        };
    }


}
