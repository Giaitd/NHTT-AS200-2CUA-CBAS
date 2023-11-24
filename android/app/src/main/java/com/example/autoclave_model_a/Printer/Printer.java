package com.example.autoclave_model_a.Printer;

import android.content.Context;
import android.os.Handler;
import android.util.Log;

import com.example.autoclave_model_a.Program.Globals;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import asim.sdk.common.Utils;
import asim.sdk.locker.DeviceInfo;
import asim.sdk.locker.SDKLocker;


public class Printer {

    public static TimerTask connectPrinter(Context context) {

        Handler mTimerHandler = new Handler();
        return new TimerTask() {
            public void run() {
                mTimerHandler.post(() -> {
                    // chi ket noi may in khi enable va bat dau chay
                    if (Globals.enablePrinter && Globals.btnStartStop) {
                        SdkPrinter printerSDK = new SdkPrinter();
                        List<DeviceInfo> devices = SDKLocker.getAllUsbDevicesHasDriver(context);
                        for (DeviceInfo each : devices) {
                            Globals.connectRS232 = printerSDK.connect(context);
                            if (Globals.printerDetect) {
                                if (Globals.enablePrinter && (Globals.numberAllowAddData == 6 || Globals.numberAllowAddData == 99)) {
                                    if (Globals.numberAllowPrint == 0) {
                                        for (String s : Globals.listDataPrinter) {
                                            SdkPrinter.send(s);
                                        }
                                        Globals.numberAllowPrint++;
                                    }
                                }
                            }
                            try {
                                printerSDK.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }

                });
            }
        };
    }

    public static TimerTask dataPrinter(Context context) {
        return new TimerTask() {
            Handler mTimerHandler1 = new Handler();

            @Override
            public void run() {
                mTimerHandler1.post(() -> {

                    if (Globals.btnStartStop) {

                        if (Globals.numberAllowAddData == 0) {
                            Globals.listDataPrinter.clear();
                            Globals.listDataPrinter.add("     BAO CAO DU LIEU ME HAP");
                            Globals.listDataPrinter.add("Ngay: " + Globals.day);
                            Globals.listDataPrinter.add("TG bat dau: " + Globals.timeOfDay);
                            Globals.listDataPrinter.add("Model: ___________________");
                            Globals.listDataPrinter.add("Thong so cai dat:");
                            Globals.listDataPrinter.add(" * Chuong trinh: " + Globals.program);
                            Globals.listDataPrinter.add(" * Nhiet do tiet trung: " + Globals.tempSet + " oC");
                            Globals.listDataPrinter.add(" * TG tiet trung: " + Globals.sterTimeSet + " phut");
                            Globals.listDataPrinter.add(" * TG say kho: " + Globals.dryTimeSet + " phut");
                            Globals.numberAllowAddData++;
                        } else if (Globals.numberAllowAddData == 1 && Globals.progress == 2) {
                            Globals.listDataPrinter.add(Globals.timeOfDay + ": Cap hoi tiet trung");
                            Globals.numberAllowAddData++;
                        } else if (Globals.numberAllowAddData == 2 && Globals.reachTAndP) {
                            Globals.listDataPrinter.add(Globals.timeOfDay + ": Tinh TG tiet trung");
                            Globals.listDataPrinter.add("Nhiet do va ap suat tiet trung:");
                            Globals.listDataPrinter.add(" Thoi gian   Nhiet do   Ap suat");
                            Globals.listDataPrinter.add(" " + Globals.timeOfDay + "     " + Globals.temperature + "      " + Globals.pressure);
                            Globals.numberAllowAddData++;
                        } else if (Globals.numberAllowAddData == 3 && Globals.progress == 3 && !Globals.dOData.q0[0]) {
                            Globals.listDataPrinter.add(" " + Globals.timeOfDay + "     " + Globals.temperature + "      " + Globals.pressure);
                            Globals.listDataPrinter.add(Globals.timeOfDay + ": Xa hoi QTSK");
                            Globals.numberAllowAddData++;
                        } else if (Globals.numberAllowAddData == 4 && Globals.progress == 3 && Globals.dOData.q0[0]) {
                            Globals.listDataPrinter.add(Globals.timeOfDay + ": HCK lam nguoi");
                            Globals.numberAllowAddData++;
                        } else if (Globals.numberAllowAddData == 5 && Globals.progress == 4) {
                            Globals.listDataPrinter.add(Globals.timeOfDay + ": Hoan thanh me hap");
                            Globals.listDataPrinter.add(" NVVH: _________________");
                            Globals.listDataPrinter.add(" ");
                            Globals.listDataPrinter.add(" ");
                            Globals.listDataPrinter.add(" ");
                            Globals.numberAllowAddData++;
                        } else if (Globals.enablePrinter && Globals.errorStatus && Globals.numberAllowAddData < 10 && Globals.countTimeSterilization <= 1) {
                            //khi đang chạy mà dừng - đã hết tg tiệt trùng, chưa hết tg sấy khô
                            Globals.listDataPrinter.add(Globals.timeOfDay + ": Hoan thanh me hap");
                            Globals.listDataPrinter.add(" ! Rac co the nong va uot");
                            Globals.listDataPrinter.add(" do chua chay het TG lam nguoi");
                            Globals.listDataPrinter.add(" NVVH: _________________");
                            Globals.listDataPrinter.add(" ");
                            Globals.listDataPrinter.add(" ");
                            Globals.listDataPrinter.add(" ");

                            Globals.numberAllowAddData = 99;

                        } else if (Globals.enablePrinter && Globals.errorStatus && Globals.numberAllowAddData < 10) {    //in khi chuong trinh bi huy
                            Globals.listDataPrinter.add(Globals.timeOfDay + ": Me hap bi huy");
                            Globals.listDataPrinter.add(" ");
                            Globals.listDataPrinter.add(" ");
                            Globals.listDataPrinter.add(" ");

                            Globals.numberAllowAddData = 99;
                        }


                    }
                });

            }
        };
    }

    public static TimerTask getRealTempForPrinterTask(Context context) {
        return new TimerTask() {
            Handler mTimerHandler = new Handler();

            public void run() {
                mTimerHandler.post(new Runnable() {
                    @Override
                    public void run() {
                        if (Globals.progress == 2 && Globals.reachTAndP) {
                            Globals.listDataPrinter.add(" " + Globals.timeOfDay + "     " + Globals.temperature + "      " + Globals.pressure);
                        }
                    }
                });
            }
        };
    }
}
