import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/utils/const.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
Stream<QuerySnapshot> getReports() {
  Stream<QuerySnapshot> querySnapshot =
      firestore.collection(CLOUD_REPORTS).snapshots();

  return querySnapshot;
}

Future<bool> uploadReport(Report report) async {
  try {
    await firestore.collection(CLOUD_REPORTS).doc().set(report.toMap());
    return true;
  } catch (error) {
    return false;
  }
}

 
String getStringFromBool(bool value) {
  if (value) {
    return 'Yes';
  } else {
    return 'No';
  }
}
