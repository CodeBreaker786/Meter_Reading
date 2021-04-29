import 'package:flutter/material.dart';
import 'package:metr_reading/screens/clientsetuppagescreen.dart';
import 'package:metr_reading/screens/home.dart';
import 'package:metr_reading/screens/loginpagescreen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(color: Colors.black),

        // font for app Robert
        // color: Colors.grey[300],
        // letterSpacing: 0.1,
        // fontFamily: 'RoobertTRIAL-Regular',
        // fontSize: 17,
      ),

      initialRoute:    '/loginpage',

      routes: {
        '/home': (context) => HomePage(),
        '/loginpage':(context) => LoginPage(),
        '/newclient':(context) => ClientSetUpPage(),


      },
    );
  }
}





// }