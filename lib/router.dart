import 'package:SmartPalikaBLEResults/homepage.dart';
import 'package:SmartPalikaBLEResults/nagarpalikaselect.dart';
import 'package:SmartPalikaBLEResults/result.dart';

import 'package:SmartPalikaBLEResults/splash.dart';
import 'package:flutter/material.dart';

Route<dynamic> generatedRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => SplashScreen());

    case "nagarpalika":
      return MaterialPageRoute(builder: (context) => Nagarpalika());

    case "homepage":
      return MaterialPageRoute(
          builder: (context) => HomePage(
                id: settings.arguments,
              ));
    case "result":
      return MaterialPageRoute(
          builder: (context) => MyHomePage(
                student: settings.arguments,
              ));

    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
