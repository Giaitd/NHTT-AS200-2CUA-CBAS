package com.example.autoclave_model_a.DIDOModule;


import android.content.Context;
import android.os.Handler;


import com.example.autoclave_model_a.Program.Globals;

import java.io.IOException;
import java.util.List;
import java.util.TimerTask;

import asim.sdk.locker.DeviceInfo;
import asim.sdk.locker.SDKLocker;

public class ReadDIDO {

    public static TimerTask getDIDOTask(Context context){
        Handler mTimerHandler = new Handler();
        return new TimerTask() {
            public void run() {
                mTimerHandler.post(() -> {
                    SdkDIDOModule DOSdk = new SdkDIDOModule();

                    List<DeviceInfo> devices = SDKLocker.getAllUsbDevicesHasDriver(context);
                    for (DeviceInfo each : devices) {
                        boolean connect = DOSdk.connect(context, each, 9600);
                        if (connect) {
                            Globals.dOData = DOSdk.getDOData();
                            if(SdkDIDOModule.checkReadDO.equals("0000")){
                                continue;
                            }
                            try {
                                DOSdk.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }

                        connect = DOSdk.connect(context, each, 9600);
                        if (connect) {
                            Globals.dIData = DOSdk.getDIData();
                            try {
                                DOSdk.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }

                            break;
                        }
                    }
//                    Log.d("output1", Arrays.toString(Globals.dOData.q0));
//                    Log.d("output2", Arrays.toString(Globals.dOData.q1));
//                    Log.d("output3", Arrays.toString(Globals.dOData.q2));
//                    Log.d("output-input", Arrays.toString(Globals.dIData.i0));
                });
            }
        };
    }



}


