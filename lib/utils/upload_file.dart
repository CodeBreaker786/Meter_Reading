import 'package:path/path.dart' as Path;

import 'dart:io';
 
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future uploadFile(File file,) async {
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child('files')
      .child(Path.basename(file.path));
  firebase_storage.UploadTask uploadTask =
      ref.putData(await file.readAsBytes());

  return await ref.getDownloadURL();
}
