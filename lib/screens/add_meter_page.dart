import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metr_reading/models/meter.dart';
import 'package:metr_reading/screens/create_report_home.dart';
import 'package:metr_reading/services/could_firebase.dart';
import 'package:metr_reading/utils/get_file_size.dart';
import 'package:metr_reading/widgets/flush_bar.dart';
import 'package:metr_reading/widgets/globle_dropdwon.dart';
import 'package:metr_reading/widgets/globle_textFiled.dart';
import 'package:metr_reading/widgets/toggle_button.dart';
import 'package:path/path.dart' as Path;

class AddMeterPage extends StatefulWidget {
  AddMeterPage({Key key}) : super(key: key);

  @override
  _AddMeterPageState createState() => _AddMeterPageState();
}

class _AddMeterPageState extends State<AddMeterPage>
    with TickerProviderStateMixin {
  List<bool> _cardList = List.generate(5, (index) => index == 0 ? true : false);
  final _formKey = GlobalKey<FormState>();
  TextEditingController _editingControllerSupplyReference =
      TextEditingController();
  TextEditingController _editingControllerSupplyName = TextEditingController();
  TextEditingController _editingControllerSerialNumber =
      TextEditingController();
  TextEditingController _editingControllerMeterRead = TextEditingController();
  TextEditingController _editingControllerParentMeter = TextEditingController();
  TextEditingController _editingControllerMeterModel = TextEditingController();
  TextEditingController _editingControllerMeterType =
      TextEditingController(text: 'Sub Meter');
  TextEditingController _editingControllerManufacturer =
      TextEditingController();
  TextEditingController _editingControllerFloor = TextEditingController();
  TextEditingController _editingControllerDemiseServed =
      TextEditingController();
  TextEditingController _editingControllerLocation = TextEditingController();
  TextEditingController _editingControllerMeter = TextEditingController();
  TextEditingController _editingControllerCommonProtocol =
      TextEditingController();
  TextEditingController _editingControllerSlaveID = TextEditingController();

  TextEditingController _editingControllerElectricPluse =
      TextEditingController();
  TextEditingController _editingControllerCTRatioMeterOnMeter =
      TextEditingController();
  TextEditingController _editingControllerBreakerRating =
      TextEditingController();
  TextEditingController _editingControllerMainT1Temperature =
      TextEditingController();
  TextEditingController _editingControllerBetteryT1Temperature =
      TextEditingController();
  TextEditingController _editingControllerThermalImageNo =
      TextEditingController();
  TextEditingController _editingControllerKT1 = TextEditingController();
  TextEditingController _editingControllerKW = TextEditingController();
  TextEditingController _editingControllerFlowRate = TextEditingController();
  TextEditingController _editingControllerVolumeOnMeter =
      TextEditingController();
  TextEditingController _editingControllerVolumeOnBMS = TextEditingController();
  File attachImage;
  String fileSize = '';

  bool mID = false;
  bool aMR = false;
  bool onBuss = false;
  bool onNetwork = false;
  bool pluseLeadRequired = false;
  bool voltageL1L2L3 = false;
  bool cTPhaseOrientationOk = false;
  bool currentTestedOk = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
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
                    supplyNumber: _editingControllerSerialNumber.text,
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
                    location: _editingControllerLocation.text,
                    mID: mID,
                    aMR: aMR,
                    onNetwork: onNetwork,
                    onBuss: onBuss,
                    commonProtocol: _editingControllerCommonProtocol.text,
                    slaveID: _editingControllerSlaveID.text,
                    pluseLeadRequuired: pluseLeadRequired,
                    electricMeterPluse: _editingControllerElectricPluse.text,
                    voltageL1L2L3Ok: voltageL1L2L3,
                    ctPhaseOrientationOk: cTPhaseOrientationOk,
                    currentTestedOk: currentTestedOk,
                    ctRationOnMeter: _editingControllerCTRatioMeterOnMeter.text,
                    breakerRating: _editingControllerBreakerRating.text,
                    mainT1Temperature: _editingControllerMainT1Temperature.text,
                    batteryT1Temperature:
                        _editingControllerBetteryT1Temperature.text,
                    thermalImageNo: _editingControllerThermalImageNo.text,
                    kT12: _editingControllerKT1.text,
                    kW: _editingControllerKW.text,
                    flowRate: _editingControllerFlowRate.text,
                    volumeOnMeter: _editingControllerVolumeOnMeter.text,
                    volumeOnBMS: _editingControllerVolumeOnBMS.text,
                  );
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5).copyWith(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    elevation: 1,
                    expansionCallback: (index, isExpanded) {
                      for (int i = 0; i < _cardList.length; i++) {
                        if (i == index) {
                          _cardList[index] = !isExpanded;
                        } else {
                          _cardList[i] = false;
                        }
                      }
                      setState(() {});
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Text(
                            'Meter Details',
                            style: buildTileTitleStyle(),
                          ),
                        ),
                        isExpanded: _cardList[0],
                        body: Column(
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
                                  await Future.delayed(
                                      Duration(seconds: 0), () {});
                                  return [
                                    'Thermal',
                                    'Electric',
                                    'Gas',
                                    'Water'
                                  ];
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
                              hintText: 'Serial Number',
                              controller: _editingControllerSerialNumber,
                            ),
                            GlobalDropdwon(
                                hintText: 'Meter Type',
                                textEditingController:
                                    _editingControllerMeterType,
                                onChanged: (value) {
                                  setState(() {
                                    _editingControllerMeterType.text = value;
                                  });
                                },
                                getItemList: (searchText) async {
                                  await Future.delayed(
                                      Duration(seconds: 0), () {});
                                  return [
                                    'Main Fiscal',
                                    'Check Meter',
                                    'Sub Meter',
                                  ];
                                }),
                            GlobalDropdwon(
                                hintText: 'Meter Read',
                                textEditingController:
                                    _editingControllerMeterRead,
                                onChanged: (value) {
                                  setState(() {
                                    _editingControllerMeterRead.text = value;
                                  });
                                },
                                getItemList: (searchText) async {
                                  await Future.delayed(
                                      Duration(seconds: 0), () {});
                                  return [
                                    'kWh',
                                    'MWh',
                                    'Litres',
                                    'M3',
                                  ];
                                }),
                            GlobalDropdwon(
                                hintText: 'Parent Meter',
                                textEditingController:
                                    _editingControllerParentMeter,
                                onChanged: (value) {
                                  setState(() {
                                    _editingControllerParentMeter.text = value;
                                  });
                                },
                                getItemList: (searchText) async {
                                  DocumentSnapshot supplyName = await firestore
                                      .collection('app_data')
                                      .doc('supplyName')
                                      .get();

                                  List list = List<String>.from(
                                      supplyName.data()['list']);

                                  return list.toList();
                                }),
                            GlobalDropdwon(
                              hintText: 'Manufacturer',
                              textEditingController:
                                  _editingControllerManufacturer,
                              onChanged: (value) async {
                                setState(() {
                                  _editingControllerManufacturer.text = value;
                                });
                              },
                              getItemList: (searchText) async {
                                DocumentSnapshot manufacturer = await firestore
                                    .collection('app_data')
                                    .doc('manufacturer')
                                    .get();

                                List list = List<String>.from(
                                    manufacturer.data()['list']);

                                return list.toList();
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
                              textEditingController:
                                  _editingControllerMeterModel,
                              onChanged: (value) {
                                setState(() {
                                  _editingControllerMeterModel.text = value;
                                });
                              },
                              getItemList: (searchText) async {
                                DocumentSnapshot meterModel = await firestore
                                    .collection('app_data')
                                    .doc('meterModel')
                                    .get();

                                List list = List<String>.from(
                                    meterModel.data()['list']);

                                return list.toList();
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
                              textEditingController:
                                  _editingControllerDemiseServed,
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
                          ],
                        ),
                      ),
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Text(
                            'MID Enable',
                            style: buildTileTitleStyle(),
                          ),
                        ),
                        isExpanded: _cardList[1],
                        body: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'MID Enable ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreen[600]),
                              ),
                              toggleButton(
                                function: (value) {
                                  mID = value;
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Text(
                            'AMR Enable ',
                            style: buildTileTitleStyle(),
                          ),
                        ),
                        isExpanded: _cardList[2],
                        body: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'AMR Enable ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightGreen[600],
                                    ),
                                  ),
                                  toggleButton(
                                    function: (value) {
                                      aMR = value;
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'On Network',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightGreen[600],
                                    ),
                                  ),
                                  toggleButton(
                                    function: (value) {
                                      onNetwork = value;
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'On BMS',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightGreen[600],
                                    ),
                                  ),
                                  toggleButton(
                                    function: (value) {
                                      onBuss = value;
                                    },
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
                              hintText: 'Slave ID',
                              controller: _editingControllerSlaveID,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Pulse Lead Required',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightGreen[600],
                                      ),
                                    ),
                                  ),
                                  toggleButton(
                                    value: pluseLeadRequired,
                                    function: (value) {
                                      pluseLeadRequired = value;
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                child: Text(
                                  'Electric Meter',
                                  style: buildTileTitleStyle(),
                                ),
                              ),
                          isExpanded: _cardList[3],
                          body: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Voltage L1 & L2 & L3 Ok ?',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightGreen[600],
                                        ),
                                      ),
                                    ),
                                    toggleButton(
                                      function: (value) {
                                        voltageL1L2L3 = value;
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'CT Phase Orientation Ok',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightGreen[600],
                                        ),
                                      ),
                                    ),
                                    toggleButton(
                                      function: (value) {
                                        cTPhaseOrientationOk = value;
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Current Tested Ok?',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightGreen[600],
                                        ),
                                      ),
                                    ),
                                    toggleButton(
                                      function: (value) {
                                        currentTestedOk = value;
                                      },
                                    )
                                  ],
                                ),
                              ),

                              GlobalTextField(
                                hintText: 'CT Ratio on Meter',
                                controller:
                                    _editingControllerCTRatioMeterOnMeter,
                              ),
                              GlobalTextField(
                                hintText: 'Breaker Rating',
                                controller: _editingControllerBreakerRating,
                              ),

                              //Breaker Rating
                            ],
                          )),
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Text(
                            'Heat Meter',
                            style: buildTileTitleStyle(),
                          ),
                        ),
                        isExpanded: _cardList[4],
                        body: Column(
                          children: [
                            GlobalTextField(
                              hintText: 'Add T1 Temperature',
                              prefixText: 'Mains     ',
                              controller: _editingControllerMainT1Temperature,
                            ),
                            GlobalTextField(
                              hintText: 'Add T1 Temperature',
                              prefixText: 'Battery   ',
                              controller:
                                  _editingControllerBetteryT1Temperature,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: attachImage == null
                                  ? InkWell(
                                      onTap: () async {
                                        final XFile photo = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        // FilePickerResult result =
                                        //     await FilePicker.platform
                                        //         .pickFiles();
                                        // if (result != null) {
                                        //   attachImage = await File(
                                        //           result.files.single.path)
                                        //       .create();
                                        //   fileSize = await getFileSize(
                                        //       attachImage.path, 1);
                                        //   setState(() {});
                                        // } else {}
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                MaterialIcons.file_upload,
                                                size: 40,
                                                color: Colors.lightGreen[600],
                                              ),
                                              onPressed: null),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              'Add thermal image',
                                              style: TextStyle(
                                                color: Colors.lightGreen[600],
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : ListTile(
                                      title: Text(
                                        Path.basename(attachImage.path)
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.lightGreen[600],
                                          fontSize: 18,
                                        ),
                                      ),
                                      subtitle: Text(fileSize),
                                      trailing: InkWell(
                                          onTap: () async {
                                            await File(attachImage.path)
                                                .delete();
                                            attachImage = null;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          )),
                                    ),
                            ),
                            GlobalTextField(
                              hintText: 'Add Thermal Image No',
                              controller: _editingControllerThermalImageNo,
                            ),
                            GlobalTextField(
                              hintText: 'K(T1-2)',
                              controller: _editingControllerKT1,
                            ),
                            GlobalTextField(
                              hintText: 'KW',
                              controller: _editingControllerKW,
                            ),
                            GlobalTextField(
                              hintText: 'Flow Rate',
                              controller: _editingControllerFlowRate,
                            ),
                            GlobalTextField(
                              hintText: 'Volume on Meter',
                              controller: _editingControllerVolumeOnMeter,
                            ),
                            GlobalTextField(
                              hintText: 'Volume on BMS',
                              controller: _editingControllerVolumeOnBMS,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25, right: 25),
                  //   child: TextFormField(
                  //     maxLines: 8,
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //           // width: 0.0 produces a thin "hairline" border
                  //           borderRadius: BorderRadius.all(Radius.circular(20)),
                  //           borderSide: BorderSide.none,
                  //           //borderSide: const BorderSide(),
                  //         ),
                  //         hintStyle: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.white,
                  //         ),
                  //         filled: true,
                  //         fillColor: Colors.lightGreen[600],
                  //         hintText: 'Add Note/Issue'),
                  //   ),
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
