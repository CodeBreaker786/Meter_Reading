import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:metr_reading/widgets/mobile/homepage_widget.dart';
 
 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Feather.settings,
              size: 28,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: HomePageWidget(),
    );
  }
}
