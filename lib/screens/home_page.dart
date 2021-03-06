import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/screens/create_report_home.dart';
import 'package:metr_reading/screens/report_viwer.dart';
import 'package:metr_reading/services/could_firebase.dart';
import 'package:metr_reading/utils/const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int repoIndex;
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
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: getReports(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              snapshot.data.docs.forEach(
                  (report) => reports.add(Report.fromMap(report.data())));
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  index = index;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoRow(
                              title: 'Contact Name:',
                              info: reports[index].contactName,
                            ),
                            buildInfoRow(
                              title: 'Client:',
                              info: reports[index].client,
                            ),
                            buildInfoRow(
                              title: 'Site:',
                              info: reports[index].site,
                            ),
                            buildInfoRow(
                              title: 'Building',
                              info: reports[index].building,
                            ),
                            buildInfoRow(
                              title: 'Carried out on: ',
                              info: df
                                  .format(reports[index].dateSurveyCarriedOut),
                            ),
                            buildInfoRow(
                              title: 'Carried out on behalf of:',
                              info: reports[index].carriedoutonbehalfof,
                            ),
                            buildInfoRow(
                              title: 'Meters',
                              info: '',
                            ),
                            Expanded(
                              child: reports[index].meters.length != 0
                                  ? SingleChildScrollView(
                                      child: ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        controller: _scrollController,
                                        scrollDirection: Axis.vertical,
                                        itemCount: reports[index].meters.length,
                                        itemBuilder: (context, index) {
                                          repoIndex = index;
                                          return Slidable(
                                            actionPane:
                                                SlidableDrawerActionPane(),
                                            //  actionExtentRatio: 0.25,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.green
                                                      .withOpacity(.4),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: AssetImage(
                                                    'assets/meter.png',
                                                  ),
                                                  foregroundColor: Colors.white,
                                                ),
                                                title:
                                                    Text(reports[index].client),
                                                subtitle:
                                                    Text(reports[index].site),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              IconSlideAction(
                                                caption: 'Archive',
                                                color: Colors.blue,
                                                icon: Icons.archive,
                                                onTap: () => null,
                                              ),
                                              IconSlideAction(
                                                caption: 'Share',
                                                color: Colors.indigo,
                                                icon: Icons.share,
                                                onTap: () => null,
                                              ),
                                            ],
                                            secondaryActions: <Widget>[
                                              IconSlideAction(
                                                caption: 'More',
                                                color: Colors.black45,
                                                icon: Icons.more_horiz,
                                                onTap: () => null,
                                              ),
                                              IconSlideAction(
                                                caption: 'Delete',
                                                color: Colors.red,
                                                icon: Icons.delete,
                                                onTap: () {
                                                  reports[index]
                                                      .meters
                                                      .removeAt(index);
                                                  setState(() {});
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return Divider(
                                            height: 1,
                                          );
                                        },
                                      ),
                                    )
                                  : Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30),
                                        child: Text(
                                          "No Meter added yet ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 28.0, color: Colors.white),
          backgroundColor: Colors.green,
          visible: true,
          curve: Curves.bounceInOut,
          children: [
            SpeedDialChild(
              child: Icon(Icons.open_in_new, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CreateReportPage(),
                  ),
                );
              },
              label: 'Add New Meter',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.lightGreen[600],
            ),
            SpeedDialChild(
              child: Icon(Icons.edit, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () {},
              label: 'Edit Report',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.lightGreen[600],
            ),
            SpeedDialChild(
              child: Icon(Icons.view_quilt, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ReportViwer(
                      report: reports[repoIndex],
                    ),
                  ),
                );
              },
              label: 'View Report',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.lightGreen[600],
            )
          ]),
    );
  }

  buildTableCellRow({String title, String info}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textScaleFactor: 1.5,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info, textScaleFactor: 1.5),
      ),
    ]);
  }

  buildInfoRow({String title, String info}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(info,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
        ],
      ),
    );
  }
}
