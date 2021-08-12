import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:metr_reading/login_wrapper.dart';
import 'package:metr_reading/screens/landing_page.dart';

import 'package:metr_reading/screens/loginpagescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      initialRoute: '/wraper',
      routes: {
        '/wraper': (context) => LoginWrapper(),
        '/home': (context) => LandingPage(),
        '/loginpage': (context) => LoginPage(),
      },
      builder: EasyLoading.init(),
    );
  }
}

// }
 