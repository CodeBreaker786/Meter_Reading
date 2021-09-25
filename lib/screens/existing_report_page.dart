import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/screens/create_report_home.dart';
import 'package:metr_reading/screens/report_viwer.dart';
import 'package:metr_reading/screens/single_report_view.dart';
import 'package:metr_reading/services/could_firebase.dart';
import 'package:metr_reading/utils/const.dart';
import 'package:metr_reading/widgets/loading_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ExistigPage extends StatefulWidget {
  @override
  _ExistigPageState createState() => _ExistigPageState();
}

class _ExistigPageState extends State<ExistigPage> {
  int repoIndex = 0;
  List<Report> reports = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              Icons.logout,
              size: 28,
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: getReports(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              reports.clear();
              snapshot.data.docs.forEach(
                  (report) => reports.add(Report.fromMap(report.data())));
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  repoIndex = index;
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/report.png'),
                    ),
                    title: Text(reports[index].site),
                    subtitle: Text(reports[index].customerReferenceNo),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SingleReportView(
                            report: reports[index],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      thickness: 1,
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

      // floatingActionButton: SpeedDial(
      //     animatedIcon: AnimatedIcons.menu_close,
      //     animatedIconTheme: IconThemeData(size: 28.0, color: Colors.white),
      //     backgroundColor: Colors.green,
      //     visible: true,
      //     curve: Curves.bounceInOut,
      //     children: [
      //       SpeedDialChild(
      //         child:
      //             Icon(Icons.create_new_folder_outlined, color: Colors.white),
      //         backgroundColor: Colors.green,
      //         onTap: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(
      //               builder: (_) => CreateReportPage(),
      //             ),
      //           );
      //         },
      //         label: 'Create New Report',
      //         labelStyle:
      //             TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      //         labelBackgroundColor: Colors.lightGreen[600],
      //       ),
      //       SpeedDialChild(
      //         child: Icon(Icons.create_outlined, color: Colors.white),
      //         backgroundColor: Colors.green,
      //         onTap: () {},
      //         label: 'Edit Report',
      //         labelStyle:
      //             TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      //         labelBackgroundColor: Colors.lightGreen[600],
      //       ),
      // SpeedDialChild(
      //   child: Icon(Icons.view_carousel_outlined, color: Colors.white),
      //   backgroundColor: Colors.green,
      //   onTap: () async {
      //     if (reports.length != 0) {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (_) => ReportViwer(
      //             report: reports[repoIndex],
      //           ),
      //         ),
      //       );
      //     } else {
      //       showError(
      //           error:
      //               "There is no report Found\nPlaese slect report first");
      //     }
      //   },
      //   label: 'View Report',
      //   labelStyle:
      //       TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      //   labelBackgroundColor: Colors.lightGreen[600],
      // )
      // ]),
    );
  }
}
