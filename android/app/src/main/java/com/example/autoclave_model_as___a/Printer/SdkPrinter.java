package com.example.autoclave_model_as___a.Printer;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.hardware.usb.UsbDevice;
import android.hardware.usb.UsbDeviceConnection;
import android.hardware.usb.UsbManager;
import android.os.Build;

import android.util.Log;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import com.example.autoclave_model_as___a.BuildConfig;
import com.example.autoclave_model_as___a.Program.Globals;
import com.hoho.android.usbserial.driver.UsbSerialDriver;
import com.hoho.android.usbserial.driver.UsbSerialPort;
import com.hoho.android.usbserial.driver.UsbSerialProber;
import com.hoho.android.usbserial.util.SerialInputOutputManager;

import java.io.IOException;


public class SdkPrinter extends Fragment{


    private enum UsbPermission { Unknown, Requested, Granted, Denied }

    private static final String INTENT_ACTION_GRANT_USB = BuildConfig.APPLICATION_ID + ".GRANT_USB";
    private static final int WRITE_WAIT_MILLIS = 2000;

    public static int deviceId, portNum;
    private boolean withIoManager= true;

    public static String status;

    private SerialInputOutputManager usbIoManager;
    private static UsbSerialPort usbSerialPort;
    private UsbPermission usbPermission = UsbPermission.Unknown;
    public static boolean connected = false;

    UsbDeviceConnection usbConnection;


    void refresh(Context context) {
        UsbManager usbManager = (UsbManager) context.getSystemService(Context.USB_SERVICE);
        UsbSerialProber usbDefaultProber = UsbSerialProber.getDefaultProber();
        UsbSerialProber usbCustomProber = com.example.autoclave_model_as___a.Printer.CustomProber.getCustomProber();

        for(UsbDevice device : usbManager.getDeviceList().values()) {
            UsbSerialDriver driver = usbDefaultProber.probeDevice(device);
            if(driver == null) {
                driver = usbCustomProber.probeDevice(device);
            }
            if(driver != null) {
                for(int port = 0; port < driver.getPorts().size(); port++){
                    deviceId = device.getDeviceId();
                    portNum= port;
                }
            }
        }

    }

    public boolean connect(@NonNull Context context) {
        UsbDevice device = null;
        refresh(context);
        UsbManager usbManager = (UsbManager)context.getSystemService(Context.USB_SERVICE);
        for(UsbDevice v : usbManager.getDeviceList().values())
            if(v.getDeviceId() == deviceId)
                device = v;
        if(device == null) {
            status = "connection failed: device not found";
            deviceId = 0;
            portNum = 0;
            Globals.printerDetect = false;
            return false;
        }

        UsbSerialDriver driver = UsbSerialProber.getDefaultProber().probeDevice(device);
        if(driver == null) {
            driver = com.example.autoclave_model_as___a.Printer.CustomProber.getCustomProber().probeDevice(device);
        }
        if(driver == null) {
            status = "connection failed: no driver for device";
            Globals.printerDetect = false;
            return false;
        }
        if(driver.getPorts().size() < portNum) {
            status = "connection failed: not enough ports at device";
            Globals.printerDetect = false;
            return false;
        }
        usbSerialPort = driver.getPorts().get(portNum);
        usbConnection = usbManager.openDevice(driver.getDevice());
        if(usbConnection == null && usbPermission == UsbPermission.Unknown && !usbManager.hasPermission(driver.getDevice())) {
            usbPermission = UsbPermission.Requested;
            int flags = Build.VERSION.SDK_INT >= Build.VERSION_CODES.M ? PendingIntent.FLAG_IMMUTABLE : 0;
            PendingIntent usbPermissionIntent = PendingIntent.getBroadcast(getActivity(), 0, new Intent(INTENT_ACTION_GRANT_USB), flags);
            usbManager.requestPermission(driver.getDevice(), usbPermissionIntent);
            Globals.printerDetect = false;
            return false;
        }
        if(usbConnection == null) {
            if (!usbManager.hasPermission(driver.getDevice()))
                status = "connection failed: permission denied";
            else
                status = "connection failed: open failed";
            Globals.printerDetect = false;
            Log.d("RS232---connect111",status);
            return false;
        }

        try {
            usbSerialPort.open(usbConnection);
            usbSerialPort.setParameters(9600, 8, 1, UsbSerialPort.PARITY_NONE);
            if(withIoManager) {
                usbIoManager = new SerialInputOutputManager(usbSerialPort);
                usbIoManager.start();
            }
            status = "connected";
            connected = true;
            Globals.printerDetect = true;
            Log.d("RS232---connect",status);
            return true;
        } catch (Exception e) {
            status = "connection failed: " + e.getMessage();
            Globals.printerDetect = false;
            return false;
        }

    }

    public static void send(String str) {
        if(!connected) {
//            Toast.makeText(getActivity(), "not connected", Toast.LENGTH_SHORT).show();
            return;
        }
        try {
            byte[] data = (str + '\n').getBytes();
            usbSerialPort.write(data, WRITE_WAIT_MILLIS);
        } catch (Exception e) {

        }
    }


    public void close() throws IOException {
        if (usbConnection == null) {
            throw new IOException("Already closed");
        }
        // TODO: nothing sended on close, maybe needed?
        try {
            usbConnection.close();
        } finally {
            usbConnection = null;
        }
    }


}
