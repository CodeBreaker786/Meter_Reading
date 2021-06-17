import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/screens/create_report_home.dart';
import 'package:metr_reading/services/could_firebase.dart';
import 'package:metr_reading/utils/const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
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
              List<Report> reports = [];
              snapshot.data.docs.forEach(
                  (report) => reports.add(Report.fromMap(report.data())));
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
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
                            reports[index].meters.length != 0
                                ? ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    controller: _scrollController,
                                    scrollDirection: Axis.vertical,
                                    itemCount: reports[index].meters.length,
                                    itemBuilder: (context, index) {
                                      return Slidable(
                                        actionPane: SlidableDrawerActionPane(),
                                        //  actionExtentRatio: 0.25,
                                        child: Container(
                                          color: Colors.green.withOpacity(.4),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              backgroundImage: AssetImage(
                                                'assets/meter.png',
                                              ),
                                              foregroundColor: Colors.white,
                                            ),
                                            title: Text('Tile no $index'),
                                            subtitle:
                                                Text('SlidableDrawerDelegate'),
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
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: Text(
                                      "No Meter added yet ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(info,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
        ],
      ),
    );
  }
}
