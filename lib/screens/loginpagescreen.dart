import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:metr_reading/widgets/mobile/loginpage_widget.dart';
import 'package:metr_reading/widgets/responsive_widget.dart';
import 'package:metr_reading/widgets/tab/loginpagetab_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          mobile: Column(
            children: [
              SizedBox(height: 40,),
              LoginPageWidget(),
            ],
          ),
          tab: Column(
            children: [
              SizedBox(height: 40,),
             LoginPageTabWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Support'),
        icon: const Icon(
          MaterialCommunityIcons.face_agent,
          size: 25,
        ),
        backgroundColor: Colors.lightGreen[600],
      ),
    );
  }
}
