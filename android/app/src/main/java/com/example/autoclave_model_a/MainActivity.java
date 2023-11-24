package com.example.autoclave_model_a;//package com.example.autoclave_model_a;
//
//import io.flutter.embedding.android.FlutterActivity;
//
//public class MainActivity extends FlutterActivity {
//}

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import com.example.autoclave_model_a.DIDOModule.ReadDIDO;
import com.example.autoclave_model_a.Printer.Printer;
import com.example.autoclave_model_a.Program.ControlOutput;
import com.example.autoclave_model_a.Program.Globals;
import com.example.autoclave_model_a.Program.ProgressAndStatus;
import com.example.autoclave_model_a.RTD_AI_Module.Read_RTD_AI;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "giaitd.com/data";

    Timer timerControlOutput = new Timer();
    Timer timerProgressStatus = new Timer();
    Timer timerGetRTD_AI = new Timer();
    Timer timerGetDIDO = new Timer();
    Timer timerPrinter = new Timer();
    Timer timerDataPrinter = new Timer();
    Timer timerGetRealTempForPrinter = new Timer();


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

         timerGetRTD_AI.schedule(Read_RTD_AI.getRTDTask(getApplicationContext()), 0, 1000);
         timerGetDIDO.schedule(ReadDIDO.getDIDOTask(getApplicationContext()), 50, 1000);
         timerProgressStatus.schedule(ProgressAndStatus.progressStatusTask(getApplicationContext()), 100, 1000);
         timerControlOutput.schedule(ControlOutput.controlOutputTask(getApplicationContext()), 150, 1000);
         timerDataPrinter.schedule(Printer.dataPrinter(getApplicationContext()), 200, 1000);
         timerPrinter.schedule(Printer.connectPrinter(getApplicationContext()), 250, 1000);
         timerGetRealTempForPrinter.schedule(Printer.getRealTempForPrinterTask(getApplicationContext()), 300, Globals.cyclePrinter * 1000L);


        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    //TODO

                    final Map<String, Object> arg = call.arguments();
                    final HashMap<String, Object> arg2 = new HashMap<>();


                    //channel
                    if (call.method.equals("dataToNative")) {
                        Globals.day = (String) arg.get("day");
                        Globals.timeOfDay = (String) arg.get("timeOfDay");
                        Globals.program = (String) arg.get("programSet");
                        Globals.tempSet = (double) arg.get("tempSet");
                        Globals.sterTimeSet = (double) arg.get("sterTimeSet");
                        Globals.dryTimeSet = (int) arg.get("dryTimeSet");
                        Globals.pressSet = (double) arg.get("pressSet");
                        Globals.pressHCKSet = (double) arg.get("pressVacuumSet");
                        Globals.numberHCKSet = (int) arg.get("numberVacuumSet");
                        Globals.tempOffSet = (double) arg.get("tempOffset");
                        Globals.btnStartStop = (boolean) arg.get("startStop");
                        Globals.manualMode = (boolean) arg.get("manualMode");
                        Globals.enablePrinter = (boolean) arg.get("printerEnable");
                        Globals.timeExhaustSet = (int) arg.get("timeExhaustSet");
                        Globals.pressOffSet = (double) arg.get("pressOffset");

                        result.success(Globals.errorStatus);

                    } else if (call.method.equals("cyclePrinter")) {
                        Globals.cyclePrinter = (int) arg.get("cyclePrinter");
                        timerGetRealTempForPrinter.cancel();
                        timerGetRealTempForPrinter = new Timer();
                        timerGetRealTempForPrinter.schedule(Printer.getRealTempForPrinterTask(getApplicationContext()), 0, Globals.cyclePrinter * 1000L);

                    } else if (call.method.equals("dataButtonToNative")) {
                        Globals.manSteamToChamber = (boolean) arg.get("manSteamToChamber");
                        Globals.manFastExhaust = (boolean) arg.get("manFastExhausted");
                        Globals.manSlowExhaust = (boolean) arg.get("manSlowExhausted");
                        Globals.manVacuum = (boolean) arg.get("manVacuum");
                        Globals.manBalance = (boolean) arg.get("manBalanced");
                        Globals.manWaterCool = (boolean) arg.get("manWaterCool");
                        Globals.manAirGasgetIn = (boolean) arg.get("manAirGasgetIn");
                        Globals.manAirGasgetOut = (boolean) arg.get("manAirGasgetOut");
                        Globals.manWaterOutBoiler = (boolean) arg.get("manBoilerExhaust");
                        Globals.manPump = (boolean) arg.get("manPump");


                    } else if (call.method.equals("getData")) {
                        arg2.put("getStatus", Globals.status);
                        arg2.put("getStatusDetail", Globals.statusDetailNumber);
                        arg2.put("getMinCount", Globals.minCount);
                        arg2.put("getSecCount", Globals.secCount);
                        arg2.put("getReachTAndP",Globals.reachTAndP);
                        arg2.put("getCompleteNumber", Globals.numberCompleted);
                        arg2.put("allowStart", Globals.allowStart);
                        arg2.put("getTemp", Globals.temperature);
                        arg2.put("getPress", Globals.pressure);
                        arg2.put("q0", Globals.dOData.valueQ0);
                        arg2.put("q1", Globals.dOData.valueQ1);
                        arg2.put("i0", Globals.dIData.valueI0);

                        result.success(arg2);
                    } else if (call.method.equals("resetButton")) {
                        Globals.btnReset = (boolean) arg.get("reset");
                    } else if (call.method.equals("getListError")) {
                        result.success(Globals.listError);
                    } else if (call.method.equals("historyData")) {
                        result.success( Globals.listDataPrinter);
                    } else {
                        result.notImplemented();
                    }
                });


    }


}