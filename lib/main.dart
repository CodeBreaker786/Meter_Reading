import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metr_reading/global/bloc/global_bloc.dart';
import 'package:metr_reading/login_wrapper.dart';

import 'package:metr_reading/screens/loginpagescreen.dart';
import 'package:metr_reading/screens/home_page.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<GlobalBloc>(create: (context) => GlobalBloc())],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
        ),
        initialRoute: '/wraper',
        routes: {
          '/wraper': (context) => LoginWrapper(),
          '/home': (context) => HomePage(),
          '/loginpage': (context) => LoginPage(),
          
          
        },
      ),
    );
  }
}

// }
 