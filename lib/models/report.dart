import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:metr_reading/models/meter.dart';

class Report {
  String client;
  String site;
  String building;
  String customerReferenceNo;
  String carriedoutonbehalfof;
  String contactName;
  String email;
  String phoneNo;
  String survey;
  DateTime dateSurveyCarriedOut;
  String accompainedBy;
  String siteEngineer;
  String siteEngineerEmail;
  List<Meter> meters;
  Report({
    @required this.client,
    @required this.site,
    @required this.building,
    @required this.customerReferenceNo,
    @required this.carriedoutonbehalfof,
    @required this.contactName,
    @required this.email,
    @required this.phoneNo,
    @required this.survey,
    @required this.dateSurveyCarriedOut,
    @required this.accompainedBy,
    @required this.siteEngineer,
    @required this.siteEngineerEmail,
    @required this.meters,
  });

  Report copyWith({
    String client,
    String site,
    String building,
    String customerReferenceNo,
    String carriedoutonbehalfof,
    String contactName,
    String email,
    String phoneNo,
    String survey,
    DateTime dateSurveyCarriedOut,
    String accompainedBy,
    String siteEngineer,
    String siteEngineerEmail,
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
      survey: survey ?? this.survey,
      dateSurveyCarriedOut: dateSurveyCarriedOut ?? this.dateSurveyCarriedOut,
      accompainedBy: accompainedBy ?? this.accompainedBy,
      siteEngineer: siteEngineer ?? this.siteEngineer,
      siteEngineerEmail: siteEngineerEmail ?? this.siteEngineerEmail,
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
      'survey': survey,
      'dateSurveyCarriedOut': dateSurveyCarriedOut,
      'accompainedBy': accompainedBy,
      'siteEngineer': siteEngineer,
      'siteEngineerEmail': siteEngineerEmail,
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
      survey: map['survey'],
      dateSurveyCarriedOut: map['dateSurveyCarriedOut'].toDate(),
      accompainedBy: map['accompainedBy'],
      siteEngineer: map['siteEngineer'],
      siteEngineerEmail: map['siteEngineerEmail'],
      meters: List<Meter>.from(map['meters']?.map((x) => Meter.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Report(client: $client, site: $site, building: $building, customerReferenceNo: $customerReferenceNo, carriedoutonbehalfof: $carriedoutonbehalfof, contactName: $contactName, email: $email, phoneNo: $phoneNo, survey: $survey, dateSurveyCarriedOut: $dateSurveyCarriedOut, accompainedBy: $accompainedBy, siteEngineer: $siteEngineer, siteEngineerEmail: $siteEngineerEmail, meters: $meters)';
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
        other.survey == survey &&
        other.dateSurveyCarriedOut == dateSurveyCarriedOut &&
        other.accompainedBy == accompainedBy &&
        other.siteEngineer == siteEngineer &&
        other.siteEngineerEmail == siteEngineerEmail &&
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
        survey.hashCode ^
        dateSurveyCarriedOut.hashCode ^
        accompainedBy.hashCode ^
        siteEngineer.hashCode ^
        siteEngineerEmail.hashCode ^
        meters.hashCode;
  }
}
