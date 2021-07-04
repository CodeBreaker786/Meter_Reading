import 'dart:convert';

import 'package:metr_reading/models/test_meter.dart';

class Meter {
  String meter;
  String supplyReference;
  String supplyName;
  String supplyNumber;
  String meterType;
  String meterRead;
  String parentMeter;
  String manufacturer;
  String meterModel;
  String floor;
  String demiseServed;
  String location;
  bool mID;
  bool aMR;
  bool onNetwork;
  bool onBuss;
  String commonProtocol;
  String slaveID;
  bool pluseLeadRequuired;
  String electricMeterPluse;
  bool voltageL1L2L3Ok;
  bool ctPhaseOrientationOk;
  bool currentTestedOk;
  String ctRationOnMeter;
  String breakerRating;
  String mainT1Temperature;
  String batteryT1Temperature;
  String thermalImageNo;
  String kT12;
  String kW;
  String flowRate;
  String volumeOnMeter;
  String volumeOnBMS;
  String note;
  TestMeter testMeter;
  Meter({
     this.meter,
     this.supplyReference,
     this.supplyName,
     this.supplyNumber,
     this.meterType,
     this.meterRead,
     this.parentMeter,
     this.manufacturer,
     this.meterModel,
     this.floor,
     this.demiseServed,
     this.location,
     this.mID,
     this.aMR,
     this.onNetwork,
     this.onBuss,
     this.commonProtocol,
     this.slaveID,
     this.pluseLeadRequuired,
     this.electricMeterPluse,
     this.voltageL1L2L3Ok,
     this.ctPhaseOrientationOk,
     this.currentTestedOk,
     this.ctRationOnMeter,
     this.breakerRating,
     this.mainT1Temperature,
     this.batteryT1Temperature,
     this.thermalImageNo,
     this.kT12,
     this.kW,
     this.flowRate,
     this.volumeOnMeter,
     this.volumeOnBMS,
     this.note,
     this.testMeter,
  });
   

  Meter copyWith({
    String meter,
    String supplyReference,
    String supplyName,
    String supplyNumber,
    String meterType,
    String meterRead,
    String parentMeter,
    String manufacturer,
    String meterModel,
    String floor,
    String demiseServed,
    String location,
    bool mID,
    bool aMR,
    bool onNetwork,
    bool onBuss,
    String commonProtocol,
    String slaveID,
    bool pluseLeadRequuired,
    String electricMeterPluse,
    bool voltageL1L2L3Ok,
    bool ctPhaseOrientationOk,
    bool currentTestedOk,
    String ctRationOnMeter,
    String breakerRating,
    String mainT1Temperature,
    String batteryT1Temperature,
    String thermalImageNo,
    String kT12,
    String kW,
    String flowRate,
    String volumeOnMeter,
    String volumeOnBMS,
    String note,
    TestMeter testMeter,
  }) {
    return Meter(
      meter: meter ?? this.meter,
      supplyReference: supplyReference ?? this.supplyReference,
      supplyName: supplyName ?? this.supplyName,
      supplyNumber: supplyNumber ?? this.supplyNumber,
      meterType: meterType ?? this.meterType,
      meterRead: meterRead ?? this.meterRead,
      parentMeter: parentMeter ?? this.parentMeter,
      manufacturer: manufacturer ?? this.manufacturer,
      meterModel: meterModel ?? this.meterModel,
      floor: floor ?? this.floor,
      demiseServed: demiseServed ?? this.demiseServed,
      location: location ?? this.location,
      mID: mID ?? this.mID,
      aMR: aMR ?? this.aMR,
      onNetwork: onNetwork ?? this.onNetwork,
      onBuss: onBuss ?? this.onBuss,
      commonProtocol: commonProtocol ?? this.commonProtocol,
      slaveID: slaveID ?? this.slaveID,
      pluseLeadRequuired: pluseLeadRequuired ?? this.pluseLeadRequuired,
      electricMeterPluse: electricMeterPluse ?? this.electricMeterPluse,
      voltageL1L2L3Ok: voltageL1L2L3Ok ?? this.voltageL1L2L3Ok,
      ctPhaseOrientationOk: ctPhaseOrientationOk ?? this.ctPhaseOrientationOk,
      currentTestedOk: currentTestedOk ?? this.currentTestedOk,
      ctRationOnMeter: ctRationOnMeter ?? this.ctRationOnMeter,
      breakerRating: breakerRating ?? this.breakerRating,
      mainT1Temperature: mainT1Temperature ?? this.mainT1Temperature,
      batteryT1Temperature: batteryT1Temperature ?? this.batteryT1Temperature,
      thermalImageNo: thermalImageNo ?? this.thermalImageNo,
      kT12: kT12 ?? this.kT12,
      kW: kW ?? this.kW,
      flowRate: flowRate ?? this.flowRate,
      volumeOnMeter: volumeOnMeter ?? this.volumeOnMeter,
      volumeOnBMS: volumeOnBMS ?? this.volumeOnBMS,
      note: note ?? this.note,
      testMeter: testMeter ?? this.testMeter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'meter': meter,
      'supplyReference': supplyReference,
      'supplyName': supplyName,
      'supplyNumber': supplyNumber,
      'meterType': meterType,
      'meterRead': meterRead,
      'parentMeter': parentMeter,
      'manufacturer': manufacturer,
      'meterModel': meterModel,
      'floor': floor,
      'demiseServed': demiseServed,
      'location': location,
      'mID': mID,
      'aMR': aMR,
      'onNetwork': onNetwork,
      'onBuss': onBuss,
      'commonProtocol': commonProtocol,
      'slaveID': slaveID,
      'pluseLeadRequuired': pluseLeadRequuired,
      'electricMeterPluse': electricMeterPluse,
      'voltageL1L2L3Ok': voltageL1L2L3Ok,
      'ctPhaseOrientationOk': ctPhaseOrientationOk,
      'currentTestedOk': currentTestedOk,
      'ctRationOnMeter': ctRationOnMeter,
      'breakerRating': breakerRating,
      'mainT1Temperature': mainT1Temperature,
      'batteryT1Temperature': batteryT1Temperature,
      'thermalImageNo': thermalImageNo,
      'kT12': kT12,
      'kW': kW,
      'flowRate': flowRate,
      'volumeOnMeter': volumeOnMeter,
      'volumeOnBMS': volumeOnBMS,
      'note': note,
      'testMeter': testMeter.toMap(),
    };
  }

  factory Meter.fromMap(Map<String, dynamic> map) {
    return Meter(
      meter: map['meter'],
      supplyReference: map['supplyReference'],
      supplyName: map['supplyName'],
      supplyNumber: map['supplyNumber'],
      meterType: map['meterType'],
      meterRead: map['meterRead'],
      parentMeter: map['parentMeter'],
      manufacturer: map['manufacturer'],
      meterModel: map['meterModel'],
      floor: map['floor'],
      demiseServed: map['demiseServed'],
      location: map['location'],
      mID: map['mID'],
      aMR: map['aMR'],
      onNetwork: map['onNetwork'],
      onBuss: map['onBuss'],
      commonProtocol: map['commonProtocol'],
      slaveID: map['slaveID'],
      pluseLeadRequuired: map['pluseLeadRequuired'],
      electricMeterPluse: map['electricMeterPluse'],
      voltageL1L2L3Ok: map['voltageL1L2L3Ok'],
      ctPhaseOrientationOk: map['ctPhaseOrientationOk'],
      currentTestedOk: map['currentTestedOk'],
      ctRationOnMeter: map['ctRationOnMeter'],
      breakerRating: map['breakerRating'],
      mainT1Temperature: map['mainT1Temperature'],
      batteryT1Temperature: map['batteryT1Temperature'],
      thermalImageNo: map['thermalImageNo'],
      kT12: map['kT12'],
      kW: map['kW'],
      flowRate: map['flowRate'],
      volumeOnMeter: map['volumeOnMeter'],
      volumeOnBMS: map['volumeOnBMS'],
      note: map['note'],
      testMeter: TestMeter.fromMap(map['testMeter']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meter.fromJson(String source) => Meter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meter(meter: $meter, supplyReference: $supplyReference, supplyName: $supplyName, supplyNumber: $supplyNumber, meterType: $meterType, meterRead: $meterRead, parentMeter: $parentMeter, manufacturer: $manufacturer, meterModel: $meterModel, floor: $floor, demiseServed: $demiseServed, location: $location, mID: $mID, aMR: $aMR, onNetwork: $onNetwork, onBuss: $onBuss, commonProtocol: $commonProtocol, slaveID: $slaveID, pluseLeadRequuired: $pluseLeadRequuired, electricMeterPluse: $electricMeterPluse, voltageL1L2L3Ok: $voltageL1L2L3Ok, ctPhaseOrientationOk: $ctPhaseOrientationOk, currentTestedOk: $currentTestedOk, ctRationOnMeter: $ctRationOnMeter, breakerRating: $breakerRating, mainT1Temperature: $mainT1Temperature, batteryT1Temperature: $batteryT1Temperature, thermalImageNo: $thermalImageNo, kT12: $kT12, kW: $kW, flowRate: $flowRate, volumeOnMeter: $volumeOnMeter, volumeOnBMS: $volumeOnBMS, note: $note, testMeter: $testMeter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Meter &&
      other.meter == meter &&
      other.supplyReference == supplyReference &&
      other.supplyName == supplyName &&
      other.supplyNumber == supplyNumber &&
      other.meterType == meterType &&
      other.meterRead == meterRead &&
      other.parentMeter == parentMeter &&
      other.manufacturer == manufacturer &&
      other.meterModel == meterModel &&
      other.floor == floor &&
      other.demiseServed == demiseServed &&
      other.location == location &&
      other.mID == mID &&
      other.aMR == aMR &&
      other.onNetwork == onNetwork &&
      other.onBuss == onBuss &&
      other.commonProtocol == commonProtocol &&
      other.slaveID == slaveID &&
      other.pluseLeadRequuired == pluseLeadRequuired &&
      other.electricMeterPluse == electricMeterPluse &&
      other.voltageL1L2L3Ok == voltageL1L2L3Ok &&
      other.ctPhaseOrientationOk == ctPhaseOrientationOk &&
      other.currentTestedOk == currentTestedOk &&
      other.ctRationOnMeter == ctRationOnMeter &&
      other.breakerRating == breakerRating &&
      other.mainT1Temperature == mainT1Temperature &&
      other.batteryT1Temperature == batteryT1Temperature &&
      other.thermalImageNo == thermalImageNo &&
      other.kT12 == kT12 &&
      other.kW == kW &&
      other.flowRate == flowRate &&
      other.volumeOnMeter == volumeOnMeter &&
      other.volumeOnBMS == volumeOnBMS &&
      other.note == note &&
      other.testMeter == testMeter;
  }

  @override
  int get hashCode {
    return meter.hashCode ^
      supplyReference.hashCode ^
      supplyName.hashCode ^
      supplyNumber.hashCode ^
      meterType.hashCode ^
      meterRead.hashCode ^
      parentMeter.hashCode ^
      manufacturer.hashCode ^
      meterModel.hashCode ^
      floor.hashCode ^
      demiseServed.hashCode ^
      location.hashCode ^
      mID.hashCode ^
      aMR.hashCode ^
      onNetwork.hashCode ^
      onBuss.hashCode ^
      commonProtocol.hashCode ^
      slaveID.hashCode ^
      pluseLeadRequuired.hashCode ^
      electricMeterPluse.hashCode ^
      voltageL1L2L3Ok.hashCode ^
      ctPhaseOrientationOk.hashCode ^
      currentTestedOk.hashCode ^
      ctRationOnMeter.hashCode ^
      breakerRating.hashCode ^
      mainT1Temperature.hashCode ^
      batteryT1Temperature.hashCode ^
      thermalImageNo.hashCode ^
      kT12.hashCode ^
      kW.hashCode ^
      flowRate.hashCode ^
      volumeOnMeter.hashCode ^
      volumeOnBMS.hashCode ^
      note.hashCode ^
      testMeter.hashCode;
  }
}
