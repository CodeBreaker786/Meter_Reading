 
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:metr_reading/models/meter.dart';
import 'package:metr_reading/models/test_meter.dart';

class Report {
  String client;
  String site;
  String building;
  String customerReferenceNo;
  String carriedoutonbehalfof;
  String contactName;
  String email;
  String phoneNo;
  String siteEngineerphoneNo;
  DateTime dateSurveyCarriedOut;
  String accompainedBy;
  String siteEngineer;
  String siteEngineerEmail;
  TestMeter testMeter;
  List<Meter> meters;
  Report({
     this.client,
     this.site,
     this.building,
     this.customerReferenceNo,
     this.carriedoutonbehalfof,
     this.contactName,
     this.email,
     this.phoneNo,
     this.siteEngineerphoneNo,
     this.dateSurveyCarriedOut,
     this.accompainedBy,
     this.siteEngineer,
     this.siteEngineerEmail,
     this.testMeter,
     this.meters,
  });
   

  Report copyWith({
    String client,
    String site,
    String building,
    String customerReferenceNo,
    String carriedoutonbehalfof,
    String contactName,
    String email,
    String siteEngineerphoneNo,
    String phoneNo,
    DateTime dateSurveyCarriedOut,
    String accompainedBy,
    String siteEngineer,
    String siteEngineerEmail,
    TestMeter testMeter,
    List<Meter> meters,
  }) {
    return Report(
      client: client ?? this.client,
      site: site ?? this.site,
      building: building ?? this.building,
      customerReferenceNo: customerReferenceNo ?? this.customerReferenceNo,
      carriedoutonbehalfof: carriedoutonbehalfof ?? this.carriedoutonbehalfof,
      contactName: contactName ?? this.contactName,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      siteEngineerphoneNo: siteEngineerphoneNo ?? this.siteEngineerphoneNo,
      dateSurveyCarriedOut: dateSurveyCarriedOut ?? this.dateSurveyCarriedOut,
      accompainedBy: accompainedBy ?? this.accompainedBy,
      siteEngineer: siteEngineer ?? this.siteEngineer,
      siteEngineerEmail: siteEngineerEmail ?? this.siteEngineerEmail,
      testMeter: testMeter ?? this.testMeter,
      meters: meters ?? this.meters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'client': client,
      'site': site,
      'building': building,
      'customerReferenceNo': customerReferenceNo,
      'carriedoutonbehalfof': carriedoutonbehalfof,
      'contactName': contactName,
      'email': email,
      'phoneNo': phoneNo,
      'siteEngineerphoneNo': siteEngineerphoneNo,
      'dateSurveyCarriedOut': dateSurveyCarriedOut.millisecondsSinceEpoch,
      'accompainedBy': accompainedBy,
      'siteEngineer': siteEngineer,
      'siteEngineerEmail': siteEngineerEmail,
      'testMeter': testMeter.toMap(),
      'meters': meters?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      client: map['client'],
      site: map['site'],
      building: map['building'],
      customerReferenceNo: map['customerReferenceNo'],
      carriedoutonbehalfof: map['carriedoutonbehalfof'],
      contactName: map['contactName'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      siteEngineerphoneNo: map['siteEngineerphoneNo'],
      dateSurveyCarriedOut: DateTime.fromMillisecondsSinceEpoch(map['dateSurveyCarriedOut']),
      accompainedBy: map['accompainedBy'],
      siteEngineer: map['siteEngineer'],
      siteEngineerEmail: map['siteEngineerEmail'],
      testMeter: TestMeter.fromMap(map['testMeter']),
      meters: List<Meter>.from(map['meters']?.map((x) => Meter.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Report(client: $client, site: $site, building: $building, customerReferenceNo: $customerReferenceNo, carriedoutonbehalfof: $carriedoutonbehalfof, contactName: $contactName, email: $email, phoneNo: $phoneNo, siteEngineerphoneNo: $siteEngineerphoneNo, dateSurveyCarriedOut: $dateSurveyCarriedOut, accompainedBy: $accompainedBy, siteEngineer: $siteEngineer, siteEngineerEmail: $siteEngineerEmail, testMeter: $testMeter, meters: $meters)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Report &&
      other.client == client &&
      other.site == site &&
      other.building == building &&
      other.customerReferenceNo == customerReferenceNo &&
      other.carriedoutonbehalfof == carriedoutonbehalfof &&
      other.contactName == contactName &&
      other.email == email &&
      other.phoneNo == phoneNo &&
      other.siteEngineerphoneNo == siteEngineerphoneNo &&
      other.dateSurveyCarriedOut == dateSurveyCarriedOut &&
      other.accompainedBy == accompainedBy &&
      other.siteEngineer == siteEngineer &&
      other.siteEngineerEmail == siteEngineerEmail &&
      other.testMeter == testMeter &&
      listEquals(other.meters, meters);
  }

  @override
  int get hashCode {
    return client.hashCode ^
      site.hashCode ^
      building.hashCode ^
      customerReferenceNo.hashCode ^
      carriedoutonbehalfof.hashCode ^
      contactName.hashCode ^
      email.hashCode ^
      phoneNo.hashCode ^
      siteEngineerphoneNo.hashCode ^
      dateSurveyCarriedOut.hashCode ^
      accompainedBy.hashCode ^
      siteEngineer.hashCode ^
      siteEngineerEmail.hashCode ^
      testMeter.hashCode ^
      meters.hashCode;
  }
}
