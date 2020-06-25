import 'dart:async';

import 'package:SmartPalikaBLEResults/api/api.dart';
import 'package:SmartPalikaBLEResults/bloc/network_bloc.dart';
import 'package:SmartPalikaBLEResults/model/model.dart';
import 'package:SmartPalikaBLEResults/widgets/button.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final int id;

  const HomePage({Key key, @required this.id}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final symbol_number = TextEditingController();
  final dob = TextEditingController();
  static const platform = const MethodChannel("smartpalika_sms");
  // bool show = widget.isshow;
  var _connectionStatus = "unknown";
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    super.initState();
    symbol_number.clear();
    dob.clear();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        BlocProvider.of<NetworkBloc>(context).add(Connected());
      } else if (result == ConnectivityResult.none) {
        BlocProvider.of<NetworkBloc>(context)..add(Disconnected());
      }
    });
  }

  @override
  void dispose() {
    dob.dispose();
    symbol_number.dispose();
    subscription.cancel();
    super.dispose();
  }

  void _sendSMS() {
    platform.invokeMethod("sendSMS", {"symbol_no": symbol_number.text});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state is NetworkInitial) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                  "You are Offline"),
            ),
          );
        } else if (state is NetworkConected) {
           _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                  "You are Online"),
            ),
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(0, 112, 184, 1),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
             // width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/Icon.png")),
                          ))),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width*0.8,
                                                  child: TextFormField(
                            controller: symbol_number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0))),
                                hintText: "Symbol Number"),
                            validator: ((val) {
                              return val.isEmpty ? "Enter Symbol Number" : null;
                            }),
                            // onChanged: (val) {
                            //   setState(() {
                            //     symbol_number = val;
                            //   });
                            // },
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(width: MediaQuery.of(context).size.width*0.8,
                                                  child: TextFormField(
                            controller: dob,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0))),
                                hintText: "Date Of Birth : YYYY-MM-DD"),
                            validator: ((val) {
                              return val.length != 10
                                  ? "2076-05-06 use this as reference"
                                  : null;
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.0),
                  SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CellButton(
                              text: "Check via Sms",
                              onpressed: () async {
                                if (_formkey.currentState.validate()) {
                                  _sendSMS();
                                  //_sendingSMS("35001", "rslt ${symbol_number.text}");
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CellButton(
                              text: "Check Online",
                              onpressed: () async {
                                if (_formkey.currentState.validate()) {
                                  Studentdata u = await Apiresult()
                                      .getresult(symbol_number.text, dob.text);
                                  print(symbol_number.text);
                                  print(dob.text);
                                  if (u.status == true) {
                                    symbol_number.clear();
                                    dob.clear();
                                    Navigator.pushNamed(context, 'result',
                                        arguments: u);
                                  }
                                  if (u.status == false) {
                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(u.message.toString()),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
