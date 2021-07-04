import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/utils/const.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
Stream<QuerySnapshot> getReports() {
  Stream<QuerySnapshot> querySnapshot =
      _firestore.collection(CLOUD_REPORTS).snapshots();

  return querySnapshot;
}

Future<bool> uploadReport(Report report) async {
  try {
    await _firestore
        .collection(CLOUD_REPORTS)
        .doc(report.customerReferenceNo)
        .set(report.toMap());
    return true;
  } catch (error) {
    return false;
  }
}

addManufacture(String data) async {
  await _firestore.collection(MANUFACTURS).doc(data);
}

getManufactures() async {
  DocumentSnapshot documentSnapshot =
      await _firestore.collection(MANUFACTURS).doc().get();
}

String getStringFromBool(bool value) {
  if (value) {
    return 'Yes';
  } else {
    return 'No';
  }
}
