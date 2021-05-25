import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
 
import 'package:metr_reading/screens/create_report_home.dart';

class HomePage  extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool widgetVisible = false;

  void showWidget() {
    setState(() {
      widgetVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      widgetVisible = false;
    });
  }

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
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 150),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateReportPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightGreen[600],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Create New Report",
                            style: TextStyle(
                              color: Colors.lightGreen[600],
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          //Button for existing report
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              child: GestureDetector(
                onTap: showWidget,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightGreen[600],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Open Existing Report",
                            style: TextStyle(
                              color: Colors.lightGreen[600],
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: widgetVisible,
              child: Container(
                  height: 400,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          textClient(),
                          clientTextField(),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 145, right: 15, top: 5),
                        child: Divider(
                          color: Colors.lightGreen[600],
                        ),
                      ),
                      Row(
                        children: [
                          textSite(),
                          siteTextField(),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 145, right: 15, top: 5),
                        child: Divider(
                          color: Colors.lightGreen[600],
                        ),
                      ),
                      Row(
                        children: [
                          textBuilding(),
                          buildingTextField(),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 145, right: 15, top: 5),
                        child: Divider(
                          color: Colors.lightGreen[600],
                        ),
                      ),
                      Row(
                        children: [
                          textSupplyReference(),
                          supplyReferenceTextField(),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 145, right: 15, top: 5),
                        child: Divider(
                          color: Colors.lightGreen[600],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.lightGreen[600],
                            child: Text("Cancel"),
                            onPressed: hideWidget,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.lightGreen[600],
                            child: Text("View Report"),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))),
          //
          // RaisedButton(
          //   child: Text('Hide Widget on Button Click'),
          //   onPressed: hideWidget,
          //   color: Colors.blue,
          //   textColor: Colors.white,
          //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          // ),
          //
          // RaisedButton(
          //   child: Text('Show Widget on Button Click'),
          //   onPressed: showWidget,
          //   color: Colors.blue,
          //   textColor: Colors.white,
          //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          // ),
        ],
      ),
    );
  }
}

Widget textClient() {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Text(
      'Client:',
      style: TextStyle(
        color: Colors.lightGreen[600],
        fontSize: 20,
        fontFamily: 'RoobertTRIAL-Regular',
        letterSpacing: 0.4,
      ),
    ),
  );
}

Widget clientTextField() {
  return Padding(
    padding: const EdgeInsets.only(left: 75, right: 30, top: 10),
    child: Container(
      height: 30,
      width: 300,
      child: TextFormField(
        // validator: (profileValue) {
        //   if (profileValue.length < 2) return "You enter invalid name";
        //   return null;
        // },
        // //controller: _name..text = profileModelFix.name,
        style: TextStyle(
          color: Colors.lightGreen[600],
          fontSize: 20,
          fontFamily: 'RoobertTRIAL-Regular',
          letterSpacing: 0.4,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            letterSpacing: 0.1,
            fontFamily: 'RoobertTRIAL-Regular',
          ),
          border: InputBorder.none,
          labelText: 'Enter Client Name Here',
          labelStyle: TextStyle(
            color: Colors.lightGreen[600],
            fontSize: 18,
            fontFamily: 'RoobertTRIAL-Regular',
            letterSpacing: 0.4,
          ),
        ),
      ),
    ),
  );
}

Widget textSite() {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Text(
      'Site:',
      style: TextStyle(
        color: Colors.lightGreen[600],
        fontSize: 20,
        fontFamily: 'RoobertTRIAL-Regular',
        letterSpacing: 0.4,
      ),
    ),
  );
}

Widget siteTextField() {
  return Padding(
    padding: const EdgeInsets.only(left: 90, right: 30, top: 10),
    child: Container(
      height: 30,
      width: 300,
      child: TextFormField(
        // validator: (profileValue) {
        //   if (profileValue.length < 2) return "You enter invalid name";
        //   return null;
        // },
        // //controller: _name..text = profileModelFix.name,
        style: TextStyle(
          color: Colors.lightGreen[600],
          fontSize: 20,
          fontFamily: 'RoobertTRIAL-Regular',
          letterSpacing: 0.4,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            letterSpacing: 0.1,
            fontFamily: 'RoobertTRIAL-Regular',
          ),
          border: InputBorder.none,
          labelText: 'Enter Site Here',
          labelStyle: TextStyle(
            color: Colors.lightGreen[600],
            fontSize: 18,
            fontFamily: 'RoobertTRIAL-Regular',
            letterSpacing: 0.4,
          ),
        ),
      ),
    ),
  );
}

Widget textBuilding() {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Text(
      'Building:',
      style: TextStyle(
        color: Colors.lightGreen[600],
        fontSize: 20,
        fontFamily: 'RoobertTRIAL-Regular',
        letterSpacing: 0.4,
      ),
    ),
  );
}

Widget buildingTextField() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 30, top: 10),
    child: Container(
      height: 30,
      width: 300,
      child: TextFormField(
        // validator: (profileValue) {
        //   if (profileValue.length < 2) return "You enter invalid name";
        //   return null;
        // },
        // //controller: _name..text = profileModelFix.name,
        style: TextStyle(
          color: Colors.lightGreen[600],
          fontSize: 20,
          fontFamily: 'RoobertTRIAL-Regular',
          letterSpacing: 0.4,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            letterSpacing: 0.1,
            fontFamily: 'RoobertTRIAL-Regular',
          ),
          border: InputBorder.none,
          labelText: 'Enter Building Here',
          labelStyle: TextStyle(
            color: Colors.lightGreen[600],
            fontSize: 18,
            fontFamily: 'RoobertTRIAL-Regular',
            letterSpacing: 0.4,
          ),
        ),
      ),
    ),
  );
}

Widget textSupplyReference() {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Text(
      'Reference:',
      style: TextStyle(
        color: Colors.lightGreen[600],
        fontSize: 20,
        fontFamily: 'RoobertTRIAL-Regular',
        letterSpacing: 0.4,
      ),
    ),
  );
}

Widget supplyReferenceTextField() {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 30, top: 10),
    child: Container(
      height: 30,
      width: 300,
      child: TextFormField(
        // validator: (profileValue) {
        //   if (profileValue.length < 2) return "You enter invalid name";
        //   return null;
        // },
        // //controller: _name..text = profileModelFix.name,
        style: TextStyle(
          color: Colors.lightGreen[600],
          fontSize: 20,
          fontFamily: 'RoobertTRIAL-Regular',
          letterSpacing: 0.4,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            letterSpacing: 0.1,
            fontFamily: 'RoobertTRIAL-Regular',
          ),
          border: InputBorder.none,
          labelText: 'Enter Supply Ref Here',
          labelStyle: TextStyle(
            color: Colors.lightGreen[600],
            fontSize: 18,
            fontFamily: 'RoobertTRIAL-Regular',
            letterSpacing: 0.4,
          ),
        ),
      ),
    ),
  );
}