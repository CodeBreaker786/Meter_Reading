import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:metr_reading/models/meter.dart';

import 'package:metr_reading/widgets/globle_dropdwon.dart';
import 'package:metr_reading/widgets/globle_textFiled.dart';

class AddMeterPage extends StatefulWidget {
  AddMeterPage({Key key}) : super(key: key);

  @override
  _AddMeterPageState createState() => _AddMeterPageState();
}

class _AddMeterPageState extends State<AddMeterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _editingControllerSupplyReference =
      TextEditingController();
  TextEditingController _editingControllerSupplyName = TextEditingController();
  TextEditingController _editingControllerSupplyNumber =
      TextEditingController();
  TextEditingController _editingControllerMeterRead = TextEditingController();
  TextEditingController _editingControllerParentMeter = TextEditingController();
  TextEditingController _editingControllerMeterModel = TextEditingController();
  TextEditingController _editingControllerManufacturer =
      TextEditingController();
  TextEditingController _editingControllerFloor = TextEditingController();
  TextEditingController _editingControllerDemiseServed =
      TextEditingController();
  TextEditingController _editingControllerLocation = TextEditingController();
  List<bool> measureToggle = List.generate(4, (index) => false);
  List<bool> meterTypeToggle = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                      supplyName: _editingControllerSupplyName.text,
                      supplyReference: _editingControllerMeterRead.text,
                      parentMeter: _editingControllerParentMeter.text,
                      meterModel: _editingControllerMeterModel.text,
                      manufacturer: _editingControllerManufacturer.text,
                      floor: _editingControllerFloor.text,
                      demiseServed: _editingControllerDemiseServed.text,
                      location: _editingControllerLocation.text);
                  Navigator.pop(context, meter);
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
                GlobalTextField(
                  hintText: 'Meter Read:',
                  controller: _editingControllerMeterRead,
                ),
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
                  hintText: 'Meter Model',
                  textEditingController: _editingControllerMeterModel,
                  onChanged: (value) {},
                  getItemList: (searchText) async {
                    await Future.delayed(Duration(seconds: 2), () {});
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
                  hintText: 'Manufacturer',
                  textEditingController: _editingControllerManufacturer,
                  onChanged: (value) {},
                  getItemList: (searchText) async {
                    await Future.delayed(Duration(seconds: 2), () {});
                    return [
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter'
                    ];
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
                  hintText: 'Floor',
                  textEditingController: _editingControllerFloor,
                  onChanged: (value) {},
                  getItemList: (searchText) async {
                    await Future.delayed(Duration(seconds: 2), () {});
                    return [
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter'
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
                    await Future.delayed(Duration(seconds: 2), () {});
                    return [
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter',
                      'Parent Meter'
                    ];
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
                  padding: const EdgeInsets.only(left: 14, top: 12),
                  child: ToggleButtons(
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
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        child: Text(
                          'Litres',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        child: Text(
                          'M3',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        child: Text(
                          'Others',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
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
                                vertical: 12, horizontal: 30),
                            child: Text(
                              'Main\nFiscal',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 30),
                            child: Text(
                              'Check\nMeter',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 30),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                            labelStyle: TextStyle(fontSize: 20),
                            labelColor: Colors.green,
                            unselectedLabelColor: Colors.grey,
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
                        height: 600,
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Hide',
                                        style: TextStyle(
                                          color: Colors.lightGreen[600],
                                          fontSize: 15,
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
                                        'AMR is Enable',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.lightGreen[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
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
                                          'On Network',
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
                                        Container(
                                          width: 80,
                                          height: 80,
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
                                          'On BMS?',
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
                                  height: 10,
                                ),

                                Text(
                                  'Comms Protocol Please Select One',
                                  style: TextStyle(
                                    color: Colors.lightGreen[600],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Center(
                                        child: Text(
                                          "Pulse",
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Center(
                                        child: Text(
                                          "Modbus",
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Center(
                                        child: Text(
                                          "M-Bus",
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Center(
                                        child: Text(
                                          "Other",
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
                                  ],
                                ),
                                //comms protocol end here

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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
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
                                      'Pulse Lead Required',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.lightGreen[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.ac_unit)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
