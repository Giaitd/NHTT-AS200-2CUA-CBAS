package com.example.autoclave_model_a.Thread;

import android.os.Handler;
import android.util.Log;
import com.example.autoclave_model_a.Program.Globals;

public class SteamToChamberFault implements Runnable{
    Handler updateData3;
    @Override
    public void run() {
        updateData3 = new Handler();
        final Thread backgroundThreadBoiler = new Thread(() -> {
            Globals.counterSteamToChamber = 0;
            Globals.exitThreadSteamToChamber = false;
            Log.d("CounterSteamToChamber=","Started");
            while (!Globals.exitThreadSteamToChamber){
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Globals.counterSteamToChamber++;
                updateData3.post(() -> {
                    Log.d("CounterSteamToChamber=", String.valueOf(Globals.counterSteamToChamber));
                    if (Globals.counterSteamToChamber == 900 && !Globals.err4) {
                        Globals.errorStatus = true;
                        Globals.exitThreadSteamToChamber = true;
                        Globals.checkThreadSteamToChamber = true;
                        Globals.listError.add("   "+Globals.timeOfDay+"     "+ Globals.day+"     Lỗi cấp hơi vào buồng hấp");
                        Globals.err4 = true;
                    }
                });
            }
            Log.d("CounterSteamToChamber=","Stopped");
        });
        backgroundThreadBoiler.start();
        Globals.checkThreadSteamToChamber = false;
    }
}
