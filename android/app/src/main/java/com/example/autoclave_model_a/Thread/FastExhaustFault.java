package com.example.autoclave_model_a.Thread;

import android.os.Handler;
import android.util.Log;

import com.example.autoclave_model_a.Program.Globals;

public class FastExhaustFault implements Runnable{
    Handler updateData2;
    @Override
    public void run() {
        updateData2 = new Handler();
        final Thread backgroundThreadBoiler = new Thread(() -> {
            Globals.counterFastExhaust = 0;
            Globals.exitThreadExhaust = false;
            Log.d("CounterExhaust= ","Started");
            while (!Globals.exitThreadExhaust){
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Globals.counterFastExhaust++;
                updateData2.post(() -> {
                    Log.d("CounterExhaust= ", String.valueOf(Globals.counterFastExhaust));
                    if (Globals.counterFastExhaust == 900 && !Globals.err5) {
                        Globals.exitThreadExhaust = true;
                        Globals.checkThreadExhaust = true;
                        Globals.errorStatus = true;
                        Globals.listError.add("   "+Globals.timeOfDay+"     "+ Globals.day+"     Lỗi xả hơi buồng hấp");
                        Globals.err5 = true;

                    }
                });
            }
            Log.d("CounterExhaust= ","Stopped");
        });
        backgroundThreadBoiler.start();
        Globals.checkThreadExhaust = false;
    }
}
