package com.example.autoclave_model_as___a.Program;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.util.Log;

import androidx.annotation.Nullable;

import com.example.autoclave_model_as___a.DIDOModule.SetDO;
import com.example.autoclave_model_as___a.Thread.FunctionThread;

import java.util.TimerTask;

public class ControlOutput extends android.app.Service {


    public ControlOutput() {
        super();
    }

    public static TimerTask controlOutputTask(Context context) {
        return new TimerTask() {
            Handler mTimerHandler = new Handler();

            public void run() {
                mTimerHandler.post(new Runnable() {
                    @Override
                    public void run() {
                        //Chỉ ấn chạy được khi 2 cửa đều đóng
                        if (Globals.dIData.i0[5] && Globals.dIData.i0[6]) {
                            Globals.allowStart = true;
                        } else {
                            Globals.allowStart = false;
                            //tắt đèn báo kết thúc
                            SetDO.ledCompleteOff(context);
                        }
                        //van hanh tay
                        ManualMode.manMode(context);

                        //dot sinh hoi
                        SteamBoiler.boilerControll(context);

                        if (!Globals.manualMode) {
                            switch (Globals.runStop) {

                                //chua an start
                                case 0:

                                    //cho phép xả đáy nồi hơi
                                    SetDO.waterBoilerOutOn(context);

                                    //tự động xả nhanh khi áp suất buồng hấp > 0.12. <0.07 thì dừng
                                    if (Globals.pressure > 0.12) {
                                        SetDO.fastExhaustOn(context);
                                    } else if (Globals.pressure < 0.07) {
                                        SetDO.fastExhaustOff(context);
                                    }

                                    //tắt vam xả khi gioăng, cấp khí gioăng: P>0.15: cap gioang. P<0.12 thi xa gioang
                                    if (Globals.pressure > 0.15) {
                                        SetDO.airToGasket1On(context);
                                        SetDO.airToGasket2On(context);
                                    } else if (Globals.pressure < 0.12) {
                                        SetDO.airToGasket1Off(context);
                                        SetDO.airToGasket2Off(context);
                                    }
                                    SetDO.vacuumOff(context);
                                    SetDO.steamToChamberOff(context);
                                    SetDO.balanceOff(context);
                                    Globals.steamBoilerOk = false;

                                    //reset thread
                                    FunctionThread.steamToChamberThreadOff();
                                    FunctionThread.fastExhaustThreadOff();
                                    FunctionThread.vacuumThreadOff();


                                    //reset fault and data
                                    if (!Globals.errorStatus) {
                                        Globals.minCount = 0;
                                        Globals.secCount = 0;
                                        Globals.numberVacuumCount = 0;
                                        Globals.checkCountNumber = false;
                                        Globals.reachTAndP = false;

                                        Globals.countTimeSterilization = (int) (Globals.sterTimeSet * 60);
                                        Globals.countTimeDry = (Globals.dryTimeSet * 60);
                                    }

                                    //khi vào vận hành tay thì k chạy đoạn code này
                                    if (!Globals.manualMode) {
                                        //tắt van xả chậm
                                        SetDO.slowExhaustOff(context);

                                        //khi chưa chạy, cửa đóng thì mở van xả nhanh khi áp trong buồng hấp cao
                                        if (Globals.pressure > 0.12) {
                                            SetDO.fastExhaustOn(context);
                                        } else if (Globals.pressure < 0.06) {
                                            SetDO.fastExhaustOff(context);
                                        }
                                    }

                                    Globals.enableSteamToChamber = false;

                                    break;

                                //da an start
                                case 1:
                                    //không cho phép xả đáy nồi hơi
                                    SetDO.waterBoilerOutOff(context);

                                    //cấp khí gioăng
                                    if (Globals.pressure > 0.15){
                                        SetDO.airToGasket1On(context);
                                        SetDO.airToGasket2On(context);
                                    }

                                    //open slowExhaust when vacuum not active
                                    if (!Globals.dOData.q0[0] && Globals.pressure > -0.05) {
                                        SetDO.slowExhaustOn(context);
                                    } else SetDO.slowExhaustOff(context);

                                    //loi cam bien cua khi dang chay
                                    if (!Globals.dIData.i0[5] && Globals.progress != 4) {
                                        Globals.errorStatus = true;
                                    }

                                    //du hoi de bat dau chay
                                    if (!Globals.dIData.i0[7]) {
                                        Globals.steamBoilerOk = true;
                                    }


                                    /*===== FastExhaust, SteamToChamber valve, Vacuum ==============================*/
                                    switch (Globals.progress) {


                                        case 1:  //air removal state
                                            //cấp khí gioăng
                                            SetDO.airToGasket1On(context);

                                            if (Globals.steamBoilerOk) {
                                                //indicate time countdown
                                                Globals.minCount = Globals.numberVacuumCount;
                                                Globals.secCount = Globals.numberHCKSet;

                                                //Fast exhaust
                                                //QTĐK: áp > 1.0 thì mở xả. <0.09 thì dừng
                                                if ((Globals.pressure > 1.0 || Globals.dOData.q0[3]) && Globals.pressure > 0.09) {

                                                    SetDO.fastExhaustOn(context);
                                                    FunctionThread.fastExhaustThreadOn();

                                                } else {
                                                    SetDO.fastExhaustOff(context);
                                                    FunctionThread.fastExhaustThreadOff();

                                                }

                                                //vacuum
                                                if ((Globals.pressure <= 0.1 || Globals.dOData.q0[0]) && Globals.pressure > Globals.pressHCKSet && !Globals.dOData.q0[1]) {
                                                    SetDO.vacuumOn(context);
                                                    FunctionThread.vacuumThreadOn();
                                                    Globals.checkCountNumber = true;
                                                } else {
                                                    SetDO.vacuumOff(context);
                                                    FunctionThread.vacuumThreadOff();
                                                    if (Globals.checkCountNumber) {
                                                        Globals.numberVacuumCount = Globals.numberVacuumCount + 1;
                                                        Globals.checkCountNumber = false;
                                                    }
                                                    Globals.enableSteamToChamber = true;
                                                }

                                                //steam to chamber
                                                if (!Globals.dOData.q0[3] && !Globals.dOData.q0[0] && Globals.pressure <= 1.0 && Globals.enableSteamToChamber) {
                                                    SetDO.steamToChamberOn(context);
                                                    FunctionThread.steamToChamberThreadOn();
                                                } else {
                                                    SetDO.steamToChamberOff(context);
                                                    FunctionThread.steamToChamberThreadOff();
                                                    Globals.enableSteamToChamber = false;
                                                }

                                            }
                                            break;

                                        case 2: //sterilization state
                                            //cấp khí gioăng
                                            SetDO.airToGasket1On(context);
                                            SetDO.airToGasket2On(context);

                                            Globals.minCount = Globals.countTimeSterilization / 60;
                                            Globals.secCount = Globals.countTimeSterilization % 60;

                                            if (Globals.temperature >= Globals.tempSet && Globals.pressure >= Globals.pressSet && Globals.tempSet >= 120) {
                                                Globals.reachTAndP = true;
                                            } else if (Globals.temperature >= Globals.tempSet && Globals.tempSet < 120) {
                                                Globals.reachTAndP = true;
                                            }

                                            //van bom hoi
                                            if (Globals.temperature < Globals.tempSet + 0.1) {
                                                SetDO.steamToChamberOn(context);
                                                FunctionThread.steamToChamberThreadOn();
                                            } else if (Globals.temperature >= Globals.tempSet + 0.5) {
                                                SetDO.steamToChamberOff(context);
                                                FunctionThread.steamToChamberThreadOff();
                                            }

                                            //van xa nhanh: xa nc dong moi 80s
                                            //chưa đạt T&P: xả nước đọng khi bơm hơi vào mỗi 1p
                                            if (Globals.reachTAndP) {
                                                if (Globals.countTimeSterilization % 80 == 0 || Globals.countTimeSterilization % 80 == 1) {
                                                    SetDO.fastExhaustOn(context);
                                                } else SetDO.fastExhaustOff(context);
                                            } else {
                                                if (Globals.counterSteamToChamber % 60 == 1 || Globals.counterSteamToChamber % 60 == 0) {
                                                    SetDO.fastExhaustOn(context);
                                                } else SetDO.fastExhaustOff(context);
                                            }


                                            if (Globals.reachTAndP && (Globals.countTimeSterilization > 0)) {
                                                Globals.countTimeSterilization--;
                                                Log.d("Time sterilization === ", String.valueOf(Globals.countTimeSterilization));
                                            }
                                            break;

                                        case 3:  //drying state

                                            //Off steam to Chamber
                                            SetDO.steamToChamberOff(context);
                                            FunctionThread.steamToChamberThreadOff();

                                            //indicate time countdown
                                            Globals.minCount = Globals.countTimeDry / 60;
                                            Globals.secCount = Globals.countTimeDry % 60;

                                            if (Globals.pressure > 0.09) {
                                                SetDO.fastExhaustOn(context);
                                                FunctionThread.fastExhaustThreadOn();
                                            } else {
                                                SetDO.fastExhaustOff(context);
                                                FunctionThread.fastExhaustThreadOff();
                                            }
                                            if (Globals.pressure <= 0.1) {
                                                //countdown time????????????????????
                                                if (Globals.countTimeDry > 0) {
                                                    if (Globals.pressure < -0.2) {
                                                        SetDO.airToGasket1Off(context);
                                                        SetDO.airToGasket2Off(context);
                                                        SetDO.airToGasket1On(context);
                                                        SetDO.airToGasket2On(context);
                                                    }
                                                    SetDO.vacuumOn(context);
                                                    Globals.countTimeDry--;
                                                    Log.d("Time dry === ", String.valueOf(Globals.countTimeDry));

                                                    //xả máy nén khí
                                                    if (Globals.countTimeDry == 2)
                                                        SetDO.compressorValveOn(context);
                                                    else SetDO.compressorValveOff(context);

                                                    //không cần vì cấp gioăng bằng khí nén rồi
                                                    // if (Globals.countTimeDry < 15 && Globals.countTimeDry > 2) {
                                                    //     SetDO.airOutGasket1On(context);
                                                    //     SetDO.airOutGasket2On(context);
                                                    // } else {
                                                    //     SetDO.airOutGasket1Off(context);
                                                    //     SetDO.airOutGasket2Off(context);
                                                    // }
                                                } else {
                                                    SetDO.vacuumOff(context);
                                                    SetDO.compressorValveOff(context);
                                                }
                                            }
                                            break;

                                        case 4:
                                            //đèn báo kết thúc
                                            SetDO.ledCompleteOn(context);

                                            //xả khí gioăng, máy nén khí - off
                                            SetDO.airOutGasket1Off(context);
                                            SetDO.airOutGasket2Off(context);
                                            SetDO.compressorValveOff(context);

                                            if (Globals.dOData.q0[0]) {
                                                SetDO.vacuumOff(context);
                                                Globals.numberCompleted++;
                                            }

                                            if (Globals.pressure < -0.05) {
                                                SetDO.balanceOn(context);
                                            } else {
                                                SetDO.balanceOff(context);
                                            }
                                            break;

                                    }
                                    break;

                            }
                        }
                    }
                });
            }
        };

    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}

