package com.example.autoclave_model_as___a.Thread;

import android.os.Handler;
import android.util.Log;

import com.example.autoclave_model_as___a.Program.Globals;

public class VacuumFault implements Runnable {
    Handler updateData2;

    @Override
    public void run() {
        updateData2 = new Handler();
        final Thread backgroundThreadBoiler = new Thread(() -> {
            Globals.counterVacuum = 0;
            Globals.exitThreadVacuum = false;
            Log.d("counterVacuum= ", "Started");
            while (!Globals.exitThreadVacuum) {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Globals.counterVacuum++;
                updateData2.post(() -> {
                    Log.d("counterVacuum= ", String.valueOf(Globals.counterVacuum));
                    if (Globals.counterVacuum == 900 && !Globals.err9) {
                        Globals.exitThreadVacuum = true;
                        Globals.checkThreadVacuum = true;
                        Globals.errorStatus = true;
                        Globals.listError.add("   " + Globals.timeOfDay + "     " + Globals.day + "     Lỗi HCK buồng hấp");
                        Globals.err5 = true;

                    }
                });
            }
            Log.d("counterVacuum= ", "Stopped");
        });
        backgroundThreadBoiler.start();
        Globals.checkThreadVacuum = false;
    }
}
