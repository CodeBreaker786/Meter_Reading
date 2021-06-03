class Meter {
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
   
  Meter(
      {this.supplyNumber,
      this.supplyName,
      this.supplyReference,
      this.meterRead,
      this.parentMeter,
      this.meterModel,
      this.manufacturer,
      this.floor,
      this.demiseServed,
      this.location,
      });
}
