import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:metr_reading/models/meter.dart';
import 'package:metr_reading/widgets/flush_bar.dart';
import 'package:metr_reading/widgets/globle_dropdwon.dart';
import 'package:metr_reading/widgets/globle_textFiled.dart';

class AddMeterPage extends StatefulWidget {
  AddMeterPage({Key key}) : super(key: key);

  @override
  _AddMeterPageState createState() => _AddMeterPageState();
}

class _AddMeterPageState extends State<AddMeterPage>
    with TickerProviderStateMixin {
  final GlobalKey<ExpansionTileCardState> card1 = new GlobalKey();
  TabController tabController1;
  TabController tabController2;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _editingControllerSupplyReference =
      TextEditingController();
  TextEditingController _editingControllerSupplyName = TextEditingController();
  TextEditingController _editingControllerSupplyNumber =
      TextEditingController();
  TextEditingController _editingControllerMeterRead = TextEditingController();
  TextEditingController _editingControllerParentMeter = TextEditingController();
  TextEditingController _editingControllerMeterModel = TextEditingController();
  TextEditingController _editingControllerMeterType = TextEditingController();
  TextEditingController _editingControllerManufacturer =
      TextEditingController();
  TextEditingController _editingControllerFloor = TextEditingController();
  TextEditingController _editingControllerDemiseServed =
      TextEditingController();
  TextEditingController _editingControllerLocation = TextEditingController();
  TextEditingController _editingControllerPluse = TextEditingController();
  TextEditingController _editingControllerMeter = TextEditingController();
  TextEditingController _editingControllerCommonProtocol =
      TextEditingController();

  bool onNetwork = false;
  bool onBuss = false;
  bool pluseLeadRequired = false;
  @override
  void initState() {
    tabController1 = TabController(vsync: this, length: 2);
    tabController2 = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          title: Text(
            'Add Meter',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  Meter meter = Meter(
                      supplyNumber: _editingControllerSupplyNumber.text,
                      meterRead: _editingControllerMeterRead.text,
                      supplyName: _editingControllerSupplyName.text,
                      supplyReference: _editingControllerMeterRead.text,
                      parentMeter: _editingControllerParentMeter.text,
                      meterType: _editingControllerMeterType.text,
                      meterModel: _editingControllerMeterModel.text,
                      manufacturer: _editingControllerManufacturer.text,
                      floor: _editingControllerFloor.text,
                      demiseServed: _editingControllerDemiseServed.text,
                      meter: _editingControllerMeter.text,
                      location: _editingControllerLocation.text);
                  Navigator.pop(context, meter);
                } else {
                  buildFlushBar(
                    buildContext: context,
                    title: "Incomplete Information",
                    subtitle: "Please enter the data which is required",
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.check,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlobalDropdwon(
                    hintText: 'Meter',
                    textEditingController: _editingControllerMeter,
                    onChanged: (value) {
                      setState(() {
                        _editingControllerMeter.text = value;
                      });
                    },
                    getItemList: (searchText) async {
                      await Future.delayed(Duration(seconds: 0), () {});
                      return ['Thermal', 'Electric', 'Gas', 'Water'];
                    }),
                GlobalTextField(
                  hintText: 'Supply Reference:',
                  controller: _editingControllerSupplyReference,
                  validator: (String text) {
                    if (text == null || text.isEmpty) {
                      return "Please Enter Supply Reference";
                    } else {
                      return null;
                    }
                  },
                ),
                GlobalTextField(
                  hintText: 'Supply Name:',
                  controller: _editingControllerSupplyName,
                  validator: (String text) {
                    if (text == null || text.isEmpty) {
                      return "Please Enter Supply Name";
                    } else {
                      return null;
                    }
                  },
                ),
                GlobalTextField(
                  hintText: 'Supply Number:',
                  controller: _editingControllerSupplyNumber,
                ),
                GlobalDropdwon(
                    hintText: 'Meter Type',
                    textEditingController: _editingControllerMeterType,
                    onChanged: (value) {
                      setState(() {
                        _editingControllerMeterType.text = value;
                      });
                    },
                    getItemList: (searchText) async {
                      await Future.delayed(Duration(seconds: 0), () {});
                      return [
                        'Main Fiscal',
                        'Check Meter',
                        'Sub Meter',
                      ];
                    }),
                GlobalDropdwon(
                    hintText: 'Meter Read',
                    textEditingController: _editingControllerMeterRead,
                    onChanged: (value) {
                      setState(() {
                        _editingControllerMeterRead.text = value;
                      });
                    },
                    getItemList: (searchText) async {
                      await Future.delayed(Duration(seconds: 0), () {});
                      return [
                        'kWh',
                        'Litres',
                        'M3',
                      ];
                    }),
                GlobalDropdwon(
                    hintText: 'Parent Meter',
                    textEditingController: _editingControllerParentMeter,
                    onChanged: (value) {
                      setState(() {
                        _editingControllerParentMeter.text = value;
                      });
                    },
                    getItemList: (searchText) async {
                      await Future.delayed(Duration(seconds: 2), () {});
                      return [
                        'Parent Meter',
                        'Parent Meter',
                        'Parent Meter',
                        'Parent Meter'
                      ];
                    }),
                GlobalDropdwon(
                  hintText: 'Manufacturer',
                  textEditingController: _editingControllerManufacturer,
                  onChanged: (value) {},
                  getItemList: (searchText) async {
                    return [searchText.toString()];
                  },
                  validator: (String text) {
                    if (text == null || text.isEmpty) {
                      return "Please Enter Manufacturer";
                    } else {
                      return null;
                    }
                  },
                ),
                GlobalDropdwon(
                  hintText: 'Meter Model',
                  textEditingController: _editingControllerMeterModel,
                  onChanged: (value) {},
                  getItemList: (searchText) async {
                    await Future.delayed(Duration(seconds: 1), () {});
                    return [
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter'
                    ];
                  },
                  validator: (String text) {
                    if (text == null || text.isEmpty) {
                      return "Please Enter Meter Model";
                    } else {
                      return null;
                    }
                  },
                ),
                GlobalDropdwon(
                  hintText: 'Floor',
                  textEditingController: _editingControllerFloor,
                  onChanged: (value) {
                    _editingControllerFloor.text = value;
                  },
                  getItemList: (searchText) async {
                    return [
                      "Ground floor",
                      "1st floor",
                      "3rd floor",
                      "4th floor",
                      "5th floor",
                      "6th floor"
                    ];
                  },
                  validator: (String text) {
                    if (text == null || text.isEmpty) {
                      return "Please Enter Floor";
                    } else {
                      return null;
                    }
                  },
                ),
                GlobalDropdwon(
                  hintText: 'Demise Served',
                  textEditingController: _editingControllerDemiseServed,
                  onChanged: (value) {},
                  getItemList: (searchText) async {
                    return [searchText.toString()];
                  },
                ),
                GlobalTextField(
                  hintText: 'Location',
                  controller: _editingControllerLocation,
                  validator: (String text) {
                    if (text == null || text.isEmpty) {
                      return "Please Enter Location";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      controller: tabController1,
                      labelStyle: TextStyle(fontSize: 20),
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.green,
                      indicatorPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      tabs: [
                        Tab(
                          text: 'MID Approved ?',
                        ),
                        Tab(
                          text: 'AMR Enable ?',
                        )
                      ]),
                ),
                Container(
                  height: 400,
                  child: TabBarView(
                    controller: tabController1,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'On Network',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.lightGreen[600],
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.green,
                                    onChanged: (value) async {
                                      setState(() {
                                        onNetwork = value;
                                      });
                                    },
                                    value: onNetwork,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'On Buss',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.lightGreen[600],
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.green,
                                    onChanged: (value) async {
                                      setState(() {
                                        onBuss = value;
                                      });
                                    },
                                    value: onBuss,
                                  )
                                ],
                              ),
                            ),
                            GlobalDropdwon(
                                hintText: 'Comms Protocol',
                                textEditingController:
                                    _editingControllerCommonProtocol,
                                onChanged: (value) {
                                  setState(() {
                                    _editingControllerCommonProtocol.text =
                                        value;
                                  });
                                },
                                getItemList: (searchText) async {
                                  await Future.delayed(
                                      Duration(seconds: 0), () {});
                                  return ['Modbus', 'Pulse', 'M-Bus', 'Water'];
                                }),
                            GlobalTextField(
                              hintText: 'Pulse',
                              controller: _editingControllerPluse,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pulse Lead Required',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.lightGreen[600],
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.green,
                                    onChanged: (value) async {
                                      setState(() {
                                        pluseLeadRequired = value;
                                      });
                                    },
                                    value: pluseLeadRequired,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AMR Enable ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightGreen[600],
                              ),
                            ),
                            Switch(
                              activeColor: Colors.green,
                              onChanged: (value) async {
                                setState(() {
                                  onNetwork = value;
                                });
                              },
                              value: onNetwork,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                  padding: const EdgeInsets.only(left: 20, top: 20),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      controller: tabController2,
                      labelStyle: TextStyle(fontSize: 20),
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.green,
                      indicatorPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      tabs: [
                        Tab(
                          text: '  Electric Meter',
                        ),
                        Tab(
                          text: 'Heat Meter',
                        )
                      ]),
                ),
                Container(
                  height: 900,
                  child: TabBarView(
                    controller: tabController2,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
