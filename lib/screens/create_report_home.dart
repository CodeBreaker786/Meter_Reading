import 'dart:io';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:metr_reading/models/meter.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/screens/add_meter_page.dart';
import 'package:metr_reading/screens/pdf_viewer.dart';
import 'package:metr_reading/services/could_firebase.dart';
import 'package:metr_reading/services/pfd.dart';
import 'package:metr_reading/widgets/flush_bar.dart';
import 'package:metr_reading/widgets/globle_dropdwon.dart';
import 'package:metr_reading/widgets/globle_textFiled.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/widgets/document.dart';

class CreateReportPage extends StatefulWidget {
  @override
  _CreateReportPageState createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ExpansionTileCardState> card1 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card2 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card3 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card4 = new GlobalKey();
  TextEditingController _editingControllerClient = TextEditingController();
  TextEditingController _editingControllerSite = TextEditingController();
  TextEditingController _editingControllerBuilding = TextEditingController();
  TextEditingController _editingControllerCustomer = TextEditingController();
  TextEditingController _editingControllerCarried = TextEditingController();
  TextEditingController _editingControllerContactName = TextEditingController();
  TextEditingController _editingControllerEmail = TextEditingController();
  TextEditingController _editingControllerPhohneNo = TextEditingController();
  TextEditingController _editingControllerSurvey = TextEditingController();
  TextEditingController _editingControllerDateSurveyCarriedOut =
      TextEditingController();
  TextEditingController _editingControllerAccompainedBy =
      TextEditingController();
  TextEditingController _editingControllerSiteEngineer =
      TextEditingController();
  TextEditingController _editingControllerSiteEngineerEmail =
      TextEditingController();
  List<Meter> meters = [];
  List<Report> reports = [];
  final ScrollController _scrollController = ScrollController();
  List<bool> measureToggle = List.generate(4, (index) => false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        title: Text(
          'Client Site Setup',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ExpansionTileCard(
                    key: card1,
                    animateTrailing: true,
                    //   finalPadding: EdgeInsets.symmetric(vertical: 12),
                    expandedTextColor: Colors.green,
                    title: Text(
                      'Your Title ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    children: [
                      GlobalTextField(
                        hintText: 'Client:',
                        controller: _editingControllerClient,
                        validator: (String text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Client";
                          } else {
                            return null;
                          }
                        },
                      ),
                      GlobalTextField(
                        hintText: 'Site:',
                        controller: _editingControllerSite,
                        validator: (String text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Site";
                          } else {
                            return null;
                          }
                        },
                      ),
                      GlobalTextField(
                        hintText: 'Building:',
                        controller: _editingControllerBuilding,
                      ),
                      GlobalTextField(
                        hintText: 'Customer Reference No:',
                        controller: _editingControllerCustomer,
                        validator: (String text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Customer Reference No";
                          } else {
                            return null;
                          }
                        },
                      ),
                      GlobalTextField(
                        hintText: 'Carried out on behalf of:',
                        controller: _editingControllerCarried,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ExpansionTileCard(
                    key: card2,
                    animateTrailing: true,
                    finalPadding: EdgeInsets.symmetric(vertical: 12),
                    expandedTextColor: Colors.green,
                    title: Text(
                      'Your Title ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    children: [
                      Column(
                        children: [
                          GlobalTextField(
                            hintText: 'Contact Name:',
                            controller: _editingControllerContactName,
                            validator: (String text) {
                              if (text == null || text.isEmpty) {
                                return "Please Enter Contact Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          GlobalTextField(
                            hintText: 'E-mail:',
                            controller: _editingControllerEmail,
                          ),
                          GlobalTextField(
                            hintText: 'Phone No:',
                            controller: _editingControllerPhohneNo,
                          ),
                          //survey carried out by drop down menu

                          GlobalDropdwon(
                              textEditingController: _editingControllerSurvey,
                              hintText: 'Survey',
                              onChanged: (value) {
                                setState(() {
                                  _editingControllerSurvey.text = value;
                                });
                              },
                              getItemList: (searchText) async {
                                await Future.delayed(
                                    Duration(seconds: 1), () {});
                                return ['$searchText'];
                              }),
                          GlobalTextField(
                            hintText: 'Date Survey Carried Out:',
                            controller: _editingControllerDateSurveyCarriedOut,
                          ),
                          GlobalTextField(
                            hintText: 'Accompained By:',
                            controller: _editingControllerAccompainedBy,
                          ),
                          GlobalTextField(
                            hintText: 'Site Engineer:',
                            controller: _editingControllerSiteEngineer,
                          ),
                          GlobalTextField(
                            hintText: 'Site Engineer E-mail:',
                            controller: _editingControllerSiteEngineerEmail,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ExpansionTileCard(
                    key: card3,
                    animateTrailing: true,
                    finalPadding: EdgeInsets.symmetric(vertical: 12),
                    expandedTextColor: Colors.green,
                    title: Text(
                      'Test Meter Used',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.lightGreen[600],
                            child: Text(
                              "Thermal",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.lightGreen[600],
                            child: Text(
                              "Electrical",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.lightGreen[600],
                            child: Text(
                              "Other",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(
                                20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //meterselectionbuttoncodeendhere

                      SizedBox(
                        height: 20,
                      ),

                      //selectioncontainer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 100,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.lightGreen[600],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Model",
                                        style: TextStyle(
                                          color: Colors.lightGreen[600],
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 35,
                            width: 100,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.lightGreen[600],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Make",
                                        style: TextStyle(
                                          color: Colors.lightGreen[600],
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 35,
                            width: 100,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.lightGreen[600],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Serial No",
                                        style: TextStyle(
                                          color: Colors.lightGreen[600],
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(
                                MaterialIcons.attach_file,
                                size: 40,
                                color: Colors.lightGreen[600],
                              ),
                              onPressed: null),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              'Attach Calibration\nCertificate',
                              style: TextStyle(
                                color: Colors.lightGreen[600],
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ExpansionTileCard(
                    key: card4,
                    animateTrailing: true,
                    expandedTextColor: Colors.green,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Meters',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Meter meter = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMeterPage()),
                            );

                            if (meter != null) {
                              setState(() {
                                meters.add(meter);
                              });
                              card4.currentState?.expand();
                            }
                          },
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: meters.length,
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
                                subtitle: Text('SlidableDrawerDelegate'),
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
                                  meters.removeAt(index);
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                    height: 50.0,
                    child: GestureDetector(
                      onTap: () {
                        reports.clear();
                        meters.forEach((meter) {
                          Report report = new Report();

                          report.client = _editingControllerClient.text;
                          report.site = _editingControllerSite.text;
                          report.building = _editingControllerBuilding.text;
                          report.customerReferenceNo =
                              _editingControllerCustomer.text;
                          report.carriedoutonbehalfof =
                              _editingControllerCarried.text;
                          report.contactName =
                              _editingControllerContactName.text;
                          report.email = _editingControllerEmail.text;
                          report.phoneNo = _editingControllerPhohneNo.text;
                          report.survey = _editingControllerSurvey.text;
                          report.dateSurveyCarriedOut =
                              _editingControllerDateSurveyCarriedOut.text;
                          report.accompainedBy =
                              _editingControllerAccompainedBy.text;
                          report.siteEngineer =
                              _editingControllerSiteEngineer.text;
                          report.siteEngineerEmail =
                              _editingControllerSiteEngineerEmail.text;
                          report.supplyReference = meter.supplyReference;
                          report.supplyName = meter.supplyName;
                          report.supplyNumber = meter.supplyNumber;
                          report.meterModel = meter.meterModel;
                          report.manufacturer = meter.manufacturer;
                          report.parentMeter = meter.parentMeter;
                          report.floor = meter.floor;
                          report.demiseServed = meter.demiseServed;
                          report.location = meter.location;

                          reports.add(report);
                        });
                        reports.forEach((report) async {
                          await uploadReports(report.toMap());
                        });
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
                              child: Text(
                                "Save Report",
                                style: TextStyle(
                                  color: Colors.lightGreen[600],
                                  fontFamily: 'Montserrat',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0, color: Colors.white),
        backgroundColor: Colors.green,
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesome.file_excel_o, color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () => print('Pressed Read Later'),
            label: 'Generate Excel Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
          SpeedDialChild(
            child: Icon(Octicons.file_pdf, color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () async {
              card1.currentState.expand();
              card2.currentState.expand();
              card3.currentState.expand();
              card4.currentState.expand();
              await Future.delayed(Duration(milliseconds: 100));
              if (_formKey.currentState.validate()) {
                reports.clear();
                meters.forEach((meter) {
                  Report report = Report();

                  report.client = _editingControllerClient.text;
                  report.site = _editingControllerSite.text;
                  report.building = _editingControllerBuilding.text;
                  report.customerReferenceNo = _editingControllerCustomer.text;
                  report.carriedoutonbehalfof = _editingControllerCarried.text;
                  report.contactName = _editingControllerContactName.text;
                  report.email = _editingControllerEmail.text;
                  report.phoneNo = _editingControllerPhohneNo.text;
                  report.survey = _editingControllerSurvey.text;
                  report.dateSurveyCarriedOut =
                      _editingControllerDateSurveyCarriedOut.text;
                  report.accompainedBy = _editingControllerAccompainedBy.text;
                  report.siteEngineer = _editingControllerSiteEngineer.text;
                  report.siteEngineerEmail =
                      _editingControllerSiteEngineerEmail.text;
                  report.supplyReference = meter.supplyReference;
                  report.supplyName = meter.supplyName;
                  report.supplyNumber = meter.supplyNumber;
                  report.meterModel = meter.meterModel;
                  report.manufacturer = meter.manufacturer;
                  report.parentMeter = meter.parentMeter;
                  report.floor = meter.floor;
                  report.demiseServed = meter.demiseServed;
                  report.location = meter.location;

                  reports.add(report);
                });
                Document pdf =
                    await reportView(context: context, reports: reports);
                final String dir =
                    (await getApplicationDocumentsDirectory()).path;
                final String path = '$dir/report.pdf';
                final File file = File(path);
                await file.writeAsBytes(pdf.save());
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PdfViewerPage(path: path),
                  ),
                );
              } else {
                buildFlushBar(
                    buildContext: context,
                    title: "Please fill the the form above",
                    subtitle:
                        "you Can’t procced unti you give the Mandatory information");
              }
            },
            label: 'Generate PDF Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
          SpeedDialChild(
            child: Icon(Fontisto.onenote, color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () => print('Pressed Code'),
            label: 'Generate Note Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
          SpeedDialChild(
            child: Icon(MaterialCommunityIcons.emoticon_angry_outline,
                color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () => print('Pressed Code'),
            label: 'Generate Fault Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
        ],
      ),
    );
  }
}
