package com.example.autoclave_model_a.Thread;

import com.example.autoclave_model_a.Program.Globals;

public class FunctionThread {

    /*=============--------boiler------==================*/
    public static void boilerThreadOn(){
        BoilerFault myTh1 = new BoilerFault();
        if(Globals.checkThreadBoiler){
            myTh1.run();
        }
//        boilerThreadOn();
        
    }

    public static void boilerThreadOff(){
        Globals.exitThreadBoiler = true;
        Globals.checkThreadBoiler = true;
//        boilerThreadOff();
    }

    /*=============------- fast exhaust ------==================*/
    public static void fastExhaustThreadOn(){
        FastExhaustFault myTh2 = new FastExhaustFault();
        if(Globals.checkThreadExhaust){
            myTh2.run();
        }
    }

    public static void fastExhaustThreadOff(){
        Globals.exitThreadExhaust = true;
        Globals.checkThreadExhaust = true;
    }




    /*=============--------Steam To Chamber------=================*/
    public static void steamToChamberThreadOn(){
        SteamToChamberFault myTh3 = new SteamToChamberFault();
        if(Globals.checkThreadSteamToChamber){
            myTh3.run();
        }
    }

    public static void steamToChamberThreadOff(){
        Globals.exitThreadSteamToChamber = true;
        Globals.checkThreadSteamToChamber = true;
    }

    /*=============--------vacuum------=================*/
    public static void vacuumThreadOn(){
        VacuumFault myTh4 = new VacuumFault();
        if(Globals.checkThreadVacuum){
            myTh4.run();
        }
    }

    public static void vacuumThreadOff(){
        Globals.exitThreadVacuum = true;
        Globals.checkThreadVacuum = true;
    }
}
