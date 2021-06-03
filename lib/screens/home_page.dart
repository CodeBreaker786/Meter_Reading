import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/screens/create_report_home.dart';
import 'package:metr_reading/services/could_firebase.dart';

class HomePage extends StatefulWidget {
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
      body: StreamBuilder(
          stream: getReports(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              List<Report> reports = [];
              snapshot.data.docs.forEach(
                  (report) => reports.add(Report.fromMap(report.data())));
              return ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(reports[index].client[0].toUpperCase()),
                      ),
                      title: Text(reports[index].client.toString()),
                    ),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CreateReportPage(),
            ),
          );
        },
      ),
    );
  }
}
