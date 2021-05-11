import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
import 'package:metr_reading/screens/loginpagescreen.dart';

import 'screens/home_page.dart';

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({Key key}) : super(key: key);

  @override
  _LoginWrapperState createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.data != null) {
          return HomePage();
        } else if (snapshot.connectionState == ConnectionState.active &&
            snapshot.data == null) {
          return LoginPage();
        }
        return Scaffold();
      },
    );
  }
}
