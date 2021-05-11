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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlobalTextField(
              hintText: 'Supply Reference:',
              controller: _editingControllerSupplyReference,
            ),
            GlobalTextField(
              hintText: 'Supply Name:',
              controller: _editingControllerSupplyName,
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
                }),
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
                }),
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
                }),
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
                }),
            GlobalTextField(
              hintText: 'Location',
              controller: _editingControllerLocation,
            ),
          ],
        ),
      ),
    );
  }
}
