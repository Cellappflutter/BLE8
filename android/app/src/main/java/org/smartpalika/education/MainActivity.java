package com.smartpalika.bleresults;


import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.content.IntentFilter;

import android.util.Log;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
//import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    private static  final String CHANNEL = "smartpalika_sms";

    @Override
    protected void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler() {

            @Override
            public void onMethodCall(final MethodCall methodCall, final Result result) {
                if (methodCall.method.equals("sendSMS")) {

                    final String myMessage = methodCall.argument("symbol_no");
                    android.util.Log.i("sent", "");
                    android.util.Log.d("TAG", "myMessage");

                    final Intent sms = new Intent(Intent.ACTION_VIEW);
                    sms.setData(Uri.parse("smsto:"));
                    sms.setType("vnd.android-dir/mms-sms");

                    sms.putExtra("address","35001");
                    sms.putExtra("sms_body","rslt "+myMessage);
                    Toast.makeText(getApplicationContext(), myMessage, Toast.LENGTH_SHORT).show();
                    Log.i("sent", "");
                    try {
                        startActivity(sms);
                        Log.i("sent", "");
                    } catch (final android.content.ActivityNotFoundException e) {
                        Log.i("error sending","");
                    }



                }

            }
        });

    }
}
