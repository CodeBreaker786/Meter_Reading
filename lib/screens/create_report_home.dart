import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:metr_reading/mobile/clientsetupaddmeterextended_widget.dart';
import 'package:metr_reading/models/meter.dart';
import 'package:metr_reading/screens/add_meter_page.dart';
import 'package:metr_reading/widgets/globle_dropdwon.dart';
import 'package:metr_reading/widgets/globle_textFiled.dart';

class CreateReportPage extends StatefulWidget {
  @override
  _CreateReportPageState createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
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
  final ScrollController _scrollController = ScrollController();
  List<bool> measureToggle = List.generate(4, (index) => false);
  List<bool> meterTypeToggle = List.generate(3, (index) => false);
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
                    ),
                    GlobalTextField(
                      hintText: 'Site:',
                      controller: _editingControllerSite,
                    ),
                    GlobalTextField(
                      hintText: 'Building:',
                      controller: _editingControllerBuilding,
                    ),
                    GlobalTextField(
                      hintText: 'Customer Reference No:',
                      controller: _editingControllerCustomer,
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
                    GlobalTextField(
                      hintText: 'Contact Name:',
                      controller: _editingControllerContactName,
                    ),
                    GlobalTextField(
                      hintText: 'E-mail:',
                      controller: _editingControllerEmail,
                    ),
                    GlobalTextField(
                      hintText: 'Phohne No:',
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
                          await Future.delayed(Duration(seconds: 1), () {});
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
                  title: Text(
                    'Total Meters',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: meters.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
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
                                title: Text('Tile n°$index'),
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
                        }),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        child: Text('Add Meter'),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () async {
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
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ToggleButtons(
                color: Colors.grey,
                borderColor: Colors.green,
                selectedColor: Colors.white,
                borderWidth: 3,
                borderRadius: BorderRadius.circular(12),
                selectedBorderColor: Colors.green,
                fillColor: Colors.green.withOpacity(.3),
                hoverColor: Colors.green,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(
                      'kWh',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(
                      'Litres',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(
                      'M3',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(
                      'Others',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
                isSelected: measureToggle,
                onPressed: (index) {
                  measureToggle = List.generate(
                      4, (value) => value == index ? true : false);
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ExpansionTileCard(
                  animateTrailing: true,
                  //   finalPadding: EdgeInsets.symmetric(vertical: 12),
                  expandedTextColor: Colors.green,
                  title: Text(
                    'Meter Type',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  children: [
                    ToggleButtons(
                      color: Colors.grey,
                      borderColor: Colors.green,
                      selectedColor: Colors.white,
                      borderWidth: 3,
                      borderRadius: BorderRadius.circular(12),
                      selectedBorderColor: Colors.green,
                      fillColor: Colors.green.withOpacity(.3),
                      hoverColor: Colors.green,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          child: Text(
                            'Main\nFiscal',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          child: Text(
                            'Check\nMeter',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          child: Text(
                            'Sub\nMeter',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      isSelected: meterTypeToggle,
                      onPressed: (index) {
                        meterTypeToggle = List.generate(
                            3, (value) => value == index ? true : false);
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              ClientSetupAddMeterExtended(),
            ],
          ),
        ),
      ),
    );
  }
}
