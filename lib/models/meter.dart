import 'dart:convert';

import 'package:flutter/material.dart';

class Meter {
  String meter;
  String meterType;
  String supplyReference;
  String supplyName;
  String supplyNumber;
  String meterRead;
  String parentMeter;
  String meterModel;
  String manufacturer;
  String floor;
  String demiseServed;
  String location;
  String serialNumber;
  String mID;
  String aMR;
  String commonProtocol;
  String onNetwork;
  String onBuss;
  String slaveID;
  String note;
  Meter({
    @required this.meter,
    @required this.meterType,
    @required this.supplyReference,
    @required this.supplyName,
    @required this.supplyNumber,
    @required this.meterRead,
    @required this.parentMeter,
    @required this.meterModel,
    @required this.manufacturer,
    @required this.floor,
    @required this.demiseServed,
    @required this.location,
    @required this.serialNumber,
    @required this.mID,
    @required this.aMR,
    @required this.commonProtocol,
    @required this.onNetwork,
    @required this.onBuss,
    @required this.slaveID,
    @required this.note,
  });

  Meter copyWith({
    String meter,
    String meterType,
    String supplyReference,
    String supplyName,
    String supplyNumber,
    String meterRead,
    String parentMeter,
    String meterModel,
    String manufacturer,
    String floor,
    String demiseServed,
    String location,
    String serialNumber,
    String mID,
    String aMR,
    String commonProtocol,
    String onNetwork,
    String onBuss,
    String slaveID,
    String note,
  }) {
    return Meter(
      meter: meter ?? this.meter,
      meterType: meterType ?? this.meterType,
      supplyReference: supplyReference ?? this.supplyReference,
      supplyName: supplyName ?? this.supplyName,
      supplyNumber: supplyNumber ?? this.supplyNumber,
      meterRead: meterRead ?? this.meterRead,
      parentMeter: parentMeter ?? this.parentMeter,
      meterModel: meterModel ?? this.meterModel,
      manufacturer: manufacturer ?? this.manufacturer,
      floor: floor ?? this.floor,
      demiseServed: demiseServed ?? this.demiseServed,
      location: location ?? this.location,
      serialNumber: serialNumber ?? this.serialNumber,
      mID: mID ?? this.mID,
      aMR: aMR ?? this.aMR,
      commonProtocol: commonProtocol ?? this.commonProtocol,
      onNetwork: onNetwork ?? this.onNetwork,
      onBuss: onBuss ?? this.onBuss,
      slaveID: slaveID ?? this.slaveID,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'meter': meter,
      'meterType': meterType,
      'supplyReference': supplyReference,
      'supplyName': supplyName,
      'supplyNumber': supplyNumber,
      'meterRead': meterRead,
      'parentMeter': parentMeter,
      'meterModel': meterModel,
      'manufacturer': manufacturer,
      'floor': floor,
      'demiseServed': demiseServed,
      'location': location,
      'serialNumber': serialNumber,
      'mID': mID,
      'aMR': aMR,
      'commonProtocol': commonProtocol,
      'onNetwork': onNetwork,
      'onBuss': onBuss,
      'slaveID': slaveID,
      'note': note,
    };
  }

  factory Meter.fromMap(Map<String, dynamic> map) {
    return Meter(
      meter: map['meter'],
      meterType: map['meterType'],
      supplyReference: map['supplyReference'],
      supplyName: map['supplyName'],
      supplyNumber: map['supplyNumber'],
      meterRead: map['meterRead'],
      parentMeter: map['parentMeter'],
      meterModel: map['meterModel'],
      manufacturer: map['manufacturer'],
      floor: map['floor'],
      demiseServed: map['demiseServed'],
      location: map['location'],
      serialNumber: map['serialNumber'],
      mID: map['mID'],
      aMR: map['aMR'],
      commonProtocol: map['commonProtocol'],
      onNetwork: map['onNetwork'],
      onBuss: map['onBuss'],
      slaveID: map['slaveID'],
      note: map['note'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meter.fromJson(String source) => Meter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meter(meter: $meter, meterType: $meterType, supplyReference: $supplyReference, supplyName: $supplyName, supplyNumber: $supplyNumber, meterRead: $meterRead, parentMeter: $parentMeter, meterModel: $meterModel, manufacturer: $manufacturer, floor: $floor, demiseServed: $demiseServed, location: $location, serialNumber: $serialNumber, mID: $mID, aMR: $aMR, commonProtocol: $commonProtocol, onNetwork: $onNetwork, onBuss: $onBuss, slaveID: $slaveID, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Meter &&
        other.meter == meter &&
        other.meterType == meterType &&
        other.supplyReference == supplyReference &&
        other.supplyName == supplyName &&
        other.supplyNumber == supplyNumber &&
        other.meterRead == meterRead &&
        other.parentMeter == parentMeter &&
        other.meterModel == meterModel &&
        other.manufacturer == manufacturer &&
        other.floor == floor &&
        other.demiseServed == demiseServed &&
        other.location == location &&
        other.serialNumber == serialNumber &&
        other.mID == mID &&
        other.aMR == aMR &&
        other.commonProtocol == commonProtocol &&
        other.onNetwork == onNetwork &&
        other.onBuss == onBuss &&
        other.slaveID == slaveID &&
        other.note == note;
  }

  @override
  int get hashCode {
    return meter.hashCode ^
        meterType.hashCode ^
        supplyReference.hashCode ^
        supplyName.hashCode ^
        supplyNumber.hashCode ^
        meterRead.hashCode ^
        parentMeter.hashCode ^
        meterModel.hashCode ^
        manufacturer.hashCode ^
        floor.hashCode ^
        demiseServed.hashCode ^
        location.hashCode ^
        serialNumber.hashCode ^
        mID.hashCode ^
        aMR.hashCode ^
        commonProtocol.hashCode ^
        onNetwork.hashCode ^
        onBuss.hashCode ^
        slaveID.hashCode ^
        note.hashCode;
  }
}
