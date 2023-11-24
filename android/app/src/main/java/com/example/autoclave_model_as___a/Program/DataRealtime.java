package com.example.autoclave_model_as___a.Program;

import android.annotation.SuppressLint;
import android.content.Context;

import java.util.Timer;

public class DataRealtime {

    @SuppressLint("HardwareIds")

    public DataRealtime() {
        super();
    }

    public static void initializedTimerTask(Context context) {

//        Globals.timerReadDIDODataTask = ReadDIDO.getDIDOTask(context);
//        Globals.timerReadRTDTask = ReadRTD.getRTDTask(context);

        try{
            Globals.timerReadDIDOData = new Timer();
            Globals.timerReadDIDOData.schedule(Globals.timerReadDIDODataTask,0,700);
        }catch (Exception e){
            e.printStackTrace();
        }

        try{
            Globals.timerReadRTDData = new Timer();
            Globals.timerReadRTDData.schedule(Globals.timerReadRTDTask,100,700);
        }catch (Exception e){
            e.printStackTrace();
        }
    }




}
