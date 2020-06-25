
import 'package:SmartPalikaBLEResults/bloc/network_bloc.dart';
import 'package:SmartPalikaBLEResults/splash.dart';
import 'package:SmartPalikaBLEResults/router.dart' as router;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => NetworkBloc(),
      ),
      
    ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generatedRoute ,
      initialRoute: "/",
      title: 'SmartPalika BLE Results',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

