import 'package:flutter/material.dart';
import 'package:metr_reading/screens/home.dart';
import 'package:metr_reading/widgets/mobile/clientsetuppage_widget.dart';
import 'package:metr_reading/widgets/responsive_widget.dart';
import 'package:metr_reading/widgets/tab/clientsetuppagetab_widget.dart';

class ClientSetUpPage extends StatefulWidget {
  @override
  _ClientSetUpPageState createState() => _ClientSetUpPageState();
}

class _ClientSetUpPageState extends State<ClientSetUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leadingWidth: 110,
        leading: GestureDetector(
          onTap: () {

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                ModalRoute.withName('/')
            );

          },
          child: Row(
            children: [
              Wrap(
                spacing: -8,
                children: [
                  Center(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.lightGreen[600],
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.lightGreen[600],
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        centerTitle: true,

        title: Text(
          'Client Site Setup',
          style: TextStyle(
            color: Colors.lightGreen[600],
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          mobile: Column(
            children: [
              ClientSetupPageWidget(),
              
            ],
          ),
          tab: Column(
            children: [

              ClientSetupPageTabWidgte(),
              
            ],
          ),
        ),
      ),
    );
  }
}
