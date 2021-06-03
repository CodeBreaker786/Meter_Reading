import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metr_reading/utils/const.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
Stream<QuerySnapshot> getReports() {
  Stream<QuerySnapshot> querySnapshot =
      _firestore.collection(CLOUD_REPORTS).snapshots();

  return querySnapshot;
}

uploadReports(Map map) async {
  await _firestore.collection(CLOUD_REPORTS).doc().set(map);
}

addManufacture(String data)async {
 await _firestore.collection(MANUFACTURS).doc(data);
}
getManufactures( ) async{
DocumentSnapshot documentSnapshot= await _firestore.collection(MANUFACTURS).doc().get();

}
