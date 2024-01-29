package com.example.autoclave_model_as___a.Program;

import com.example.autoclave_model_as___a.DIDOModule.DIData;
import com.example.autoclave_model_as___a.DIDOModule.DOData;
import com.example.autoclave_model_as___a.RTD_AI_Module.AIData;
import com.example.autoclave_model_as___a.RTD_AI_Module.RTDData;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class Globals {

    public static DIData dIData = null;
    public static DOData dOData = null;
    public static byte[] bufferAll = null;

    public static RTDData tempData = null;
    public static AIData pressData = null;

    public static Timer timerReadRTDData;
    public static TimerTask timerReadRTDTask;

    public static Timer timerReadDIDOData;
    public static TimerTask timerReadDIDODataTask;

    //button manual
    public static boolean manSteamToChamber;
    public static boolean manFastExhaust;
    public static boolean manSlowExhaust;
    public static boolean manVacuum;
    public static boolean manBalance;
    public static boolean manAirGasket1In;
    public static boolean manAirGasket1Out;
    public static boolean manAirGasket2In;
    public static boolean manAirGasket2Out;
    public static boolean manWaterCool;
    public static boolean manCompressorExhaust;

    //Button start/stop
    public static boolean btnStartStop = false;
    public static byte runStop;

    //status autoclave
    public static String statusDetail;
    public static int statusDetailNumber;
    public static int status;

    //program value set
    public static String program = "0";
    public static Double tempSet = 121.0;
    public static Double sterTimeSet = 5.0;
    public static Integer dryTimeSet = 2;
    public static Double pressSet = 2.06;


    //printer
    public static boolean enablePrinter;
    public static boolean printerDetect;
    public static int cyclePrinter = 60;
    public static String dataPrinter = "     DU LIEU ME HAP     ";
    public static boolean connectRS232 = false;
    public static String day;
    public static String timeOfDay;

    //boiler
    public static boolean notEnoughSteam = false;
    public static Integer delaySteamBoiler = 20;

    //T&P
    public static Double temperature = 0.0;

    public static Double tempOffSet = 2.0;
    public static Double pressure = 0.0;
    public static Double pressOffSet = 0.01;

    //setup vacuum
    public static Integer numberHCKSet = 2;
    public static Double pressHCKSet = -0.5;


    //countdown time
    public static int minCount;
    public static int secCount;

    public static boolean checkCountNumber;
    public static int countTimeSterilization = 10;
    public static int countTimeDry;
    //    public static int countTimerBalance;
    public static int timeExhaustSet;


    //state of program
    public static byte progress;
    public static int numberVacuumCount;
    public static boolean errorStatus;
    public static boolean reachTAndP;
    public static boolean steamBoilerOk = false;
    public static boolean allowStart;
    public static boolean enableSteamToChamber;


    //    public static boolean fullWater;
//    public static boolean exhaustVacuum;
    public static boolean manualMode;
    public static boolean enableManualMode;
    public static boolean btnReset;

    //number of completed
    public static int numberCompleted = 0;

    //door
    public static int door = 0;

    //List String data printer
    public static List<String> listDataPrinter = new ArrayList<>();
    public static int numberAllowPrint;
    public static int numberAllowAddData;


    /*==========------ List of variable use in found Fault of Output device*/
    //List of counter time
    public static int counterBoiler;
    public static int counterVacuum;
    //    public static int counterWaterIn;
    public static int counterSteamToChamber;
    public static int counterFastExhaust;

    //List of exit counter time
    public static boolean exitThreadBoiler = false;
    public static boolean exitThreadVacuum = false;

    public static boolean exitThreadSteamToChamber = false;
    public static boolean exitThreadExhaust = false;

    //List of check counter time
    public static boolean checkThreadBoiler = true;
    public static boolean checkThreadVacuum = true;
    public static boolean checkThreadSteamToChamber = true;
    public static boolean checkThreadExhaust = true;


    //I0/I1: Bao can duong cap nuoc HCK / noi hoi
    //I2/I3/I4: Bao can noi hoi muc thap/giua/cao
    //I5/I6: cam bien cua 1/2
    //I7: dong ho dieu ap noi hoi

    public static List<String> listError = new ArrayList<>();
    public static boolean err1 = false; //k có nước làm mát
    public static boolean err2 = false; //k có nước cấp nồi hơi
    public static boolean err3 = false; //lỗi thanh đốt
    public static boolean err4 = false; //lỗi bơm hơi
    public static boolean err5 = false; //lỗi xả hơi
    public static boolean err6 = false; //lỗi mở xả đáy nồi hơi khi đang chạy
    public static boolean err7 = false; //lỗi nhiệt độ buồng hấp quá cao
    public static boolean err8 = false; //lỗi áp suất buồng hấp quá cao
    public static boolean err9 = false; //lỗi HCK buồng hấp

}
