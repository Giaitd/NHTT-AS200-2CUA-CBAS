package com.example.autoclave_model_a.Program;

import android.content.Context;

import com.example.autoclave_model_a.DIDOModule.SetDO;

public class ManualMode {
    public static void manMode(Context context){
        if (Globals.manualMode) {
            Globals.enableManualMode = true;
            //HCK
            if (Globals.manVacuum) {
                SetDO.vacuumOn(context);
            } else {
                SetDO.vacuumOff(context);
            }

            //bom hoi
            if (Globals.manSteamToChamber) {
                SetDO.steamToChamberOn(context);
            } else {
                SetDO.steamToChamberOff(context);
            }

            //xa cham
            if (Globals.manSlowExhaust) {
                SetDO.slowExhaustOn(context);
            } else {
                SetDO.slowExhaustOff(context);
            }

            //xa nhanh
            if (Globals.manFastExhaust) {
                SetDO.fastExhaustOn(context);
            } else {
                SetDO.fastExhaustOff(context);
            }

            //xa day noi hoi
            if (Globals.manWaterOutBoiler) {
                SetDO.waterBoilerOutOn(context);
            } else {
                SetDO.waterBoilerOutOff(context);
            }

            //cap khi gioang
            if (Globals.manAirGasgetIn) {
                SetDO.airToGasketOn(context);
            } else {
                SetDO.airToGasketOff(context);
            }

            //xa khi gioang
            if (Globals.manAirGasgetOut) {
                SetDO.airOutGasketOn(context);
            } else {
                SetDO.airOutGasketOff(context);
            }

            //cba
            if (Globals.manBalance) {
                SetDO.balanceOn(context);
            } else {
                SetDO.balanceOff(context);
            }

            //bom nuoc
            if (Globals.manPump) {
                SetDO.waterPumpOn(context);
            } else {
                SetDO.waterPumpOff(context);
            }


        }else {
            if(Globals.enableManualMode){
                SetDO.steamToChamberOff(context);
                SetDO.vacuumOff(context);
                SetDO.slowExhaustOff(context);
                SetDO.fastExhaustOff(context);
                SetDO.airOutGasketOff(context);
                SetDO.airToGasketOff(context);
                SetDO.balanceOff(context);
                SetDO.waterPumpOff(context);
                SetDO.waterBoilerOutOff(context);
            }

            Globals.enableManualMode = false;

        }

    }
}
