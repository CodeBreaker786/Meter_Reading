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
      this.supplyNumber,
      this.supplyName,
      this.supplyReference,
      this.meterRead,
      this.parentMeter,
      this.meterModel,
      this.manufacturer,
      this.floor,
      this.demiseServed,
      this.location});
}
