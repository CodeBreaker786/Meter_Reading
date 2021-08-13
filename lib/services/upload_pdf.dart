import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:metr_reading/widgets/loading_utils.dart';

Future<String> uploadFileToStorage(File file) async {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  try {
    firebase_storage.Reference ref =
        storage.ref().child(Path.basename(file.path).toString());
    firebase_storage.UploadTask uploadTask = ref.putFile(
      file,
    );

    uploadTask.snapshotEvents.listen((firebase_storage.TaskSnapshot snapshot) {
      print(snapshot.bytesTransferred / snapshot.totalBytes);
      showLoagingWithProgress(
          message: "Uploading File",
          progress: snapshot.bytesTransferred / snapshot.totalBytes);
      if ((snapshot.bytesTransferred / snapshot.totalBytes) >= 1) {
        EasyLoading.dismiss();
      }
    }, onError: (e) async {
      if (e.code == 'permission-denied') {
        showError(
            error:
                'User does not have permission to upload to this reference.');
       
      }
      showError(error: e.toString());
       
    });

    String url = await ref.getDownloadURL();
    await EasyLoading.dismiss();
    return url;
  } catch (e) {
    showError(error: e.toString());
    return null;
  }
}
