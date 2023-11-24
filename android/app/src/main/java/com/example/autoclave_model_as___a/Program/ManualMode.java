package com.example.autoclave_model_as___a.Program;

import android.content.Context;

import com.example.autoclave_model_as___a.DIDOModule.SetDO;

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

            //cap khi gioang 1
            if (Globals.manAirGasket1In) {
                SetDO.airToGasket1On(context);
            } else {
                SetDO.airToGasket1Off(context);
            }

            //xa khi gioang 1
            if (Globals.manAirGasket1Out) {
                SetDO.airOutGasket1On(context);
            } else {
                SetDO.airOutGasket1Off(context);
            }

            //cap khi gioang 2
            if (Globals.manAirGasket2In) {
                SetDO.airToGasket2On(context);
            } else {
                SetDO.airToGasket2Off(context);
            }

            //xa khi gioang 2
            if (Globals.manAirGasket2Out) {
                SetDO.airOutGasket2On(context);
            } else {
                SetDO.airOutGasket2Off(context);
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
                SetDO.airOutGasket1Off(context);
                SetDO.airToGasket1Off(context);
                SetDO.airOutGasket2Off(context);
                SetDO.airToGasket2Off(context);
                SetDO.balanceOff(context);
                SetDO.waterPumpOff(context);
                SetDO.waterBoilerOutOff(context);
            }

            Globals.enableManualMode = false;

        }

    }
}
