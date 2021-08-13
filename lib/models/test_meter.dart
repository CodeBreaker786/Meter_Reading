import 'dart:convert';

class TestMeter {
  String meterType;
  String meterMake;
  String meterModel;
  String serialNumber;
  String attachCertificate;
  TestMeter({
    this.meterType,
    this.meterMake,
    this.meterModel,
    this.serialNumber,
    this.attachCertificate,
    attachCalibrationCertificate,
  });

  TestMeter copyWith({
    String meterType,
    String meterMake,
    String meterModel,
    String serialNumber,
    String attachCertificate,
  }) {
    return TestMeter(
      meterType: meterType ?? this.meterType,
      meterMake: meterMake ?? this.meterMake,
      meterModel: meterModel ?? this.meterModel,
      serialNumber: serialNumber ?? this.serialNumber,
      attachCertificate: attachCertificate ?? this.attachCertificate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'meterType': meterType,
      'meterMake': meterMake,
      'meterModel': meterModel,
      'serialNumber': serialNumber,
      'attachCertificate': attachCertificate,
    };
  }

  factory TestMeter.fromMap(Map<String, dynamic> map) {
    return TestMeter(
      meterType: map['meterType'],
      meterMake: map['meterMake'],
      meterModel: map['meterModel'],
      serialNumber: map['serialNumber'],
      attachCertificate: map['attachCertificate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TestMeter.fromJson(String source) =>
      TestMeter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TestMeter(meterType: $meterType, meterMake: $meterMake, meterModel: $meterModel, serialNumber: $serialNumber, attachCertificate: $attachCertificate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TestMeter &&
        other.meterType == meterType &&
        other.meterMake == meterMake &&
        other.meterModel == meterModel &&
        other.serialNumber == serialNumber &&
        other.attachCertificate == attachCertificate;
  }

  @override
  int get hashCode {
    return meterType.hashCode ^
        meterMake.hashCode ^
        meterModel.hashCode ^
        serialNumber.hashCode ^
        attachCertificate.hashCode;
  }
}
