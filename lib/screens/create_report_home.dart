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
import 'package:metr_reading/services/pfd.dart';
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
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Meter Type',
                        style: TextStyle(
                          color: Colors.lightGreen[600],
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              "Yes/No",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                            color: Colors.lightGreen[600],
                          ),
                        ),
                        Text(
                          'MID Approved ?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightGreen[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                "Yes/No",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(200),
                              ),
                              color: Colors.lightGreen[600],
                            ),
                          ),
                        ),
                        Text(
                          'AMR Enable ?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightGreen[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Visibility(
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 510,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightGreen[600]),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //picture column
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen[600],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        heightFactor: 30,
                        widthFactor: 30,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            EvilIcons.camera,
                            color: Colors.white,
                            size: 100,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Attach Picture',
                      style: TextStyle(
                        color: Colors.lightGreen[600],
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                //picture column end here

                SizedBox(
                  height: 10,
                ),

                //note code start here
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    maxLines: 8,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                          //borderSide: const BorderSide(),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.lightGreen[600],
                        hintText: 'Add Note/Issue'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Technical Info',
                        style: TextStyle(
                          color: Colors.lightGreen[600],
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                //Meter Selection Code heat or electric

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            child: Center(
                              child: Icon(
                                Ionicons.ios_bulb,
                                color: Colors.white,
                                size: 100,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(200),
                              ),
                              color: Colors.lightGreen[600],
                            ),
                          ),
                        ),
                        Text(
                          'Electric Meter',
                          style: TextStyle(
                            color: Colors.lightGreen[600],
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            child: Center(
                              child: Icon(
                                Octicons.flame,
                                color: Colors.white,
                                size: 100,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(200),
                              ),
                              color: Colors.lightGreen[600],
                            ),
                          ),
                        ),
                        Text(
                          'Heat Meter',
                          style: TextStyle(
                            color: Colors.lightGreen[600],
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //meter selection heat or electirce code end here

                SizedBox(
                  height: 10,
                ),

                //electric meter code
                Visibility(
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 590,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightGreen[600]),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      'Hide',
                                      style: TextStyle(
                                        color: Colors.lightGreen[600],
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Electric Meter is Selected',
                                    style: TextStyle(
                                      color: Colors.lightGreen[600],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //addvoltage textfield
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'Enter Pulse'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: Center(
                                        child: Text(
                                          "Yes/No",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(200),
                                        ),
                                        color: Colors.lightGreen[600],
                                      ),
                                    ),
                                    Text(
                                      'Voltage L1 & L2\n & L3 Ok ?',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.lightGreen[600],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: Center(
                                        child: Text(
                                          "Yes/No",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(200),
                                        ),
                                        color: Colors.lightGreen[600],
                                      ),
                                    ),
                                    Text(
                                      'CT Phase Orientation\nOk',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.lightGreen[600],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Center(
                                    child: Text(
                                      "Yes/No",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(200),
                                    ),
                                    color: Colors.lightGreen[600],
                                  ),
                                ),
                                Text(
                                  'Current Tested\nOk?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightGreen[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //CT Ratio on meter

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'CT Ratio on Meter'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //Breaker Rating

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'Breaker Rating'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //electrice meter code end here

                SizedBox(
                  height: 10,
                ),

                //heat meter code
                Visibility(
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 850,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightGreen[600]),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      'Hide',
                                      style: TextStyle(
                                        color: Colors.lightGreen[600],
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Heat Meter is Selected',
                                    style: TextStyle(
                                      color: Colors.lightGreen[600],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: Center(
                                          child: Text(
                                            "Mains",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(200),
                                          ),
                                          color: Colors.lightGreen[600],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: Center(
                                          child: Text(
                                            "Battery",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(200),
                                          ),
                                          color: Colors.lightGreen[600],
                                        ),
                                      ),
                                      Text(
                                        'Power By',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightGreen[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 70,
                                            right: 70,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  // width: 0.0 produces a thin "hairline" border
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  borderSide: BorderSide.none,
                                                  //borderSide: const BorderSide(),
                                                ),
                                                hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                                filled: true,
                                                fillColor:
                                                    Colors.lightGreen[600],
                                                hintText: 'Add T1 Temperature'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 70,
                                            right: 70,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  // width: 0.0 produces a thin "hairline" border
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  borderSide: BorderSide.none,
                                                  //borderSide: const BorderSide(),
                                                ),
                                                hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                                filled: true,
                                                fillColor:
                                                    Colors.lightGreen[600],
                                                hintText: 'Add T2 Temperature'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  child: Center(
                                    child: Icon(
                                      EvilIcons.camera,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(200),
                                    ),
                                    color: Colors.lightGreen[600],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Add Thermal\nImage',
                                  style: TextStyle(
                                    color: Colors.lightGreen[600],
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                                top: 10,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'Add Thermal Image No'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //K t one and two
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                                top: 10,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'K(T1-2)'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //Temperature check
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'KW'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //Temperature check
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'Flow Rate'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //volume on meter
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'Volume on Meter'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //Volume on bms
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 70,
                                right: 70,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                      //borderSide: const BorderSide(),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightGreen[600],
                                    hintText: 'Volume on BMS'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //heat meter code end here

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                    height: 50.0,
                    child: GestureDetector(
                      onTap: () {},
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
              if (_formKey.currentState.validate()) {
                meters.forEach((meter) {
                  Report report = Report(
                    client: _editingControllerClient.text,
                    site: _editingControllerSite.text,
                    building: _editingControllerBuilding.text,
                    customerReferenceNo: _editingControllerCustomer.text,
                    carriedoutonbehalfof: _editingControllerCarried.text,
                    contactName: _editingControllerContactName.text,
                    email: _editingControllerEmail.text,
                    phoneNo: _editingControllerPhohneNo.text,
                    survey: _editingControllerSurvey.text,
                    dateSurveyCarriedOut:
                        _editingControllerDateSurveyCarriedOut.text,
                    accompainedBy: _editingControllerAccompainedBy.text,
                    siteEngineer: _editingControllerSiteEngineer.text,
                    siteEngineerEmail: _editingControllerSiteEngineerEmail.text,
                    supplyReference: meter.supplyReference,
                    supplyName: meter.supplyName,
                    supplyNumber: meter.supplyNumber,
                    meterModel: meter.meterModel,
                    manufacturer: meter.manufacturer,
                    parentMeter: meter.parentMeter,
                    floor: meter.floor,
                    demiseServed: meter.demiseServed,
                    location: meter.location,
                  );
                  reports.add(report);
                });
                Document pdf = await reportView(context: context,reports:reports);
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

 