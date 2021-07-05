import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadPdfToStorage(File pdfFile) async {
  try {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('pdfs/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask =
        ref.putFile(pdfFile, SettableMetadata(contentType: 'pdf'));

    TaskSnapshot snapshot = await uploadTask;

    String url = await snapshot.ref.getDownloadURL();

    print("url:$url");
    return url;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
