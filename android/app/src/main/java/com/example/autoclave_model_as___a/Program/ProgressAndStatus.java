package com.example.autoclave_model_as___a.Program;

import android.content.Context;
import android.os.Handler;

import com.example.autoclave_model_as___a.Printer.Printer;

import java.util.TimerTask;

import io.flutter.Log;

public class ProgressAndStatus {
    public ProgressAndStatus() {
        super();
    }

    public static TimerTask progressStatusTask(Context context) {
        return new TimerTask() {
            Handler mTimerHandler = new Handler();

            public void run() {
                mTimerHandler.post(new Runnable() {
                    @Override
                    public void run() {

//                        Log.d("pressSet==== ", String.valueOf(Globals.pressSet));

                        //trạng thái cửa
                        if(Globals.dIData.i0[5] && Globals.dIData.i0[6]) Globals.door = 3;  //2 cửa đều đóng
                        if(Globals.dIData.i0[5] && !Globals.dIData.i0[6]) Globals.door = 1; //cửa trước đóng, sau mở
                        if(!Globals.dIData.i0[5] && Globals.dIData.i0[6]) Globals.door = 2; //cửa trước mở, sau đóng
                        if(!Globals.dIData.i0[5] && !Globals.dIData.i0[6]) Globals.door = 0; //cửa trước đóng, sau mở

                        //lỗi nhiệt độ buồng hấp quá cao
                        if ((Globals.temperature > 145 || (Globals.status == 1 && Globals.temperature > (Globals.tempSet + 5))) && !Globals.err7) {
                            Globals.errorStatus = true;
                            Globals.listError.add("   " + Globals.timeOfDay + "     " + Globals.day + "     Nhiệt độ buồng hấp quá cao");
                            Globals.err7 = true;
                        }
                        if (Globals.pressure > (Globals.pressSet + 0.45) && !Globals.err8) {
                            Globals.errorStatus = true;
                            Globals.listError.add("   " + Globals.timeOfDay + "     " + Globals.day + "     Áp suất buồng hấp quá cao");
                            Globals.err8 = true;
                        }

                        //lỗi k có nước đường cấp nước
                        if (!Globals.dIData.i0[0] && !Globals.err1) {    //k có nước cấp làm mát
                            Globals.errorStatus = true;
                            Globals.listError.add("   " + Globals.timeOfDay + "     " + Globals.day + "     Không có nước đường cấp nước làm mát");
                            Globals.err1 = true;
                        }
                        if (!Globals.dIData.i0[1] && !Globals.err2) {    //k có nước cấp nồi hơi
                            Globals.errorStatus = true;
                            Globals.listError.add("   " + Globals.timeOfDay + "     " + Globals.day + "     Không có nước đường cấp nước cho nồi hơi");
                            Globals.err2 = true;
                        }

                        if (Globals.btnStartStop) {
                            Globals.runStop = 1;
                        } else {
                            Globals.runStop = 0;
                            Globals.numberAllowPrint = 0;
                            Globals.numberAllowAddData = 0;
                        }

                        //reset fault
                        if (Globals.btnReset) {
                            Globals.listError.clear();
                            Globals.errorStatus = false;
                            Globals.btnReset = false;
                            //reset tín hiệu thêm lỗi vào listError
                            Globals.err1 = false;
                            Globals.err2 = false;
                            Globals.err3 = false;
                            Globals.err4 = false;
                            Globals.err5 = false;
                            Globals.err6 = false;
                            Globals.err7 = false;
                            Globals.err8 = false;
                            Globals.err9 = false;

                        }

                        //status error
                        if (Globals.errorStatus) {
                            Globals.progress = 5;//error
                            if (Globals.countTimeSterilization <= 1) {
                                Globals.status = 2; //lỗi (thông báo mẻ hấp đã kết thúc tiệt trùng mới xảy ra lỗi)
                            } else {
                                Globals.status = 3; //lỗi (chưa hết tg tiệt trùng, chạy lại)
                            }

                            Globals.statusDetail = "Xảy ra lỗi. Hãy kiểm tra";
                            Globals.statusDetailNumber = 6;
                            Globals.steamBoilerOk = false;

                            //in khi xay ra loi
                            Printer.printerPrint(context);

                        } else {
                            switch (Globals.runStop) {
                                case 0:
                                    Globals.progress = 0;
                                    Globals.status = 0; //""..."
                                    if (!Globals.dOData.q0[4])
                                        Globals.statusDetail = "Sẵn sàng chạy";
                                    Globals.statusDetailNumber = 0;

                                    break;

                                case 1:
                                    //status of autoclave
                                    if (Globals.numberVacuumCount < Globals.numberHCKSet) {
                                        Globals.progress = 1; //Air removal state
                                        Globals.status = 1; //đang chạy
                                        if (!Globals.steamBoilerOk) {
                                            Globals.statusDetail = "Đang đốt sinh hơi";
                                            Globals.statusDetailNumber = 1;
                                        } else {
                                            Globals.statusDetail = "Quá trình đuổi khí";
                                            Globals.statusDetailNumber = 2;
                                        }

                                    } else if ((Globals.numberVacuumCount == Globals.numberHCKSet)
                                            && Globals.countTimeSterilization > 0) {
                                        Globals.progress = 2; //Sterilization state
                                        Globals.status = 1; //đang chạy
                                        Globals.statusDetail = "Quá trình tiệt trùng";
                                        Globals.statusDetailNumber = 3;

                                    } else if (Globals.countTimeSterilization <= 1
                                            && Globals.countTimeDry > 0) {
                                        Globals.progress = 3; //Drying state
                                        Globals.status = 1; //đang chạy
                                        Globals.statusDetail = "Quá trình làm nguội";
                                        Globals.statusDetailNumber = 4;

                                    } else if (Globals.countTimeDry == 0) {
                                        Globals.steamBoilerOk = false;
                                        Globals.progress = 4; //Finish
                                        Globals.status = 2; //Kết thúc
                                        Globals.statusDetail = "Mẻ hấp hoàn thành";
                                        Globals.statusDetailNumber = 5;

                                        //in khi kết thúc
                                        Printer.printerPrint(context);
                                    }

                                    break;
                            }
                        }
                    }
                });
            }
        };
    }
}
