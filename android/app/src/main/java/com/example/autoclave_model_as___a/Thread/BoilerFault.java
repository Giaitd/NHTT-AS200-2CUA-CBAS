package com.example.autoclave_model_as___a.Thread;

import android.os.Handler;
import android.util.Log;

import com.example.autoclave_model_as___a.Program.Globals;

public class BoilerFault implements Runnable{
    Handler updateData1;
    @Override
    public void run() {
        updateData1 = new Handler();
        final Thread backgroundThreadBoiler = new Thread(() -> {
            Globals.counterBoiler = 0;
            Globals.exitThreadBoiler = false;
            Log.d("Counter Boiler======","Started");
            while (!Globals.exitThreadBoiler){
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Globals.counterBoiler++;
                updateData1.post(() -> {
                    Log.d("Counter Boiler====", String.valueOf(Globals.counterBoiler));
                    if (Globals.counterBoiler == 2700 && !Globals.err3) {
                        Globals.exitThreadBoiler = true;
                        Globals.checkThreadBoiler = true;
                        Globals.errorStatus = true;
                        Globals.listError.add("   "+Globals.timeOfDay+"     "+ Globals.day+"     Lỗi đốt sinh hơi");
                        Globals.err3 = true;
                    }
                });
            }
            Log.d("Counter Boiler====","Stopped");
        });
        backgroundThreadBoiler.start();
        Globals.checkThreadBoiler = false;
    }
}
