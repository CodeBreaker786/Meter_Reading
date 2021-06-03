import 'dart:convert';

class Report {
  String id;
  String client;
  String site;
  String building;
  String customerReferenceNo;
  String carriedoutonbehalfof;
  String contactName;
  String email;
  String phoneNo;
  String survey;
  String dateSurveyCarriedOut;
  String accompainedBy;
  String siteEngineer;
  String siteEngineerEmail;
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
  Report(
      {this.id,
      this.client,
      this.site,
      this.building,
      this.customerReferenceNo,
      this.carriedoutonbehalfof,
      this.contactName,
      this.email,
      this.phoneNo,
      this.survey,
      this.dateSurveyCarriedOut,
      this.accompainedBy,
      this.siteEngineer,
      this.siteEngineerEmail,
      this.supplyReference,
      this.supplyName,
      this.supplyNumber,
      this.meterRead,
      this.parentMeter,
      this.meterModel,
      this.manufacturer,
      this.floor,
      this.demiseServed,
      this.location});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      id: map['id'],
      client: map['client'],
      site: map['site'],
      building: map['building'],
      customerReferenceNo: map['customerReferenceNo'],
      carriedoutonbehalfof: map['carriedoutonbehalfof'],
      contactName: map['contactName'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      survey: map['survey'],
      dateSurveyCarriedOut: map['dateSurveyCarriedOut'],
      accompainedBy: map['accompainedBy'],
      siteEngineer: map['siteEngineer'],
      siteEngineerEmail: map['siteEngineerEmail'],
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
    );
  }

  String toJson() => json.encode(toMap());

  // factory Report.fromJson(String source) => Report.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Report(id: $id, client: $client, site: $site, building: $building, customerReferenceNo: $customerReferenceNo, carriedoutonbehalfof: $carriedoutonbehalfof, contactName: $contactName, email: $email, phoneNo: $phoneNo, survey: $survey, dateSurveyCarriedOut: $dateSurveyCarriedOut, accompainedBy: $accompainedBy, siteEngineer: $siteEngineer, siteEngineerEmail: $siteEngineerEmail, supplyReference: $supplyReference, supplyName: $supplyName, supplyNumber: $supplyNumber, meterRead: $meterRead, parentMeter: $parentMeter, meterModel: $meterModel, manufacturer: $manufacturer, floor: $floor, demiseServed: $demiseServed, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Report &&
        other.id == id &&
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
        other.supplyReference == supplyReference &&
        other.supplyName == supplyName &&
        other.supplyNumber == supplyNumber &&
        other.meterRead == meterRead &&
        other.parentMeter == parentMeter &&
        other.meterModel == meterModel &&
        other.manufacturer == manufacturer &&
        other.floor == floor &&
        other.demiseServed == demiseServed &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        client.hashCode ^
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
        supplyReference.hashCode ^
        supplyName.hashCode ^
        supplyNumber.hashCode ^
        meterRead.hashCode ^
        parentMeter.hashCode ^
        meterModel.hashCode ^
        manufacturer.hashCode ^
        floor.hashCode ^
        demiseServed.hashCode ^
        location.hashCode;
  }
}
