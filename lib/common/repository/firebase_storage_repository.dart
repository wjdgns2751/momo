import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseStorageRepositoryProvider = Provider(
  (ref) => FirebaseStorageRepository(firebaseStorage: FirebaseStorage.instance),
);

class FirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  FirebaseStorageRepository({required this.firebaseStorage});

  // Firebase Storage에 파일을 저장하고 해당 파일의 URL을 반환하는 메서드입니다.
  storeFileToFirebase(String ref, var file) async {
    UploadTask? uploadTask;

    // 파일이 File 타입인 경우 putFile 메서드를 사용하여 업로드 작업을 수행합니다.
    if (file is File) {
      uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    }

    // 파일이 Uint8List 타입인 경우 putData 메서드를 사용하여 업로드 작업을 수행합니다.
    if (file is Uint8List) {
      uploadTask = firebaseStorage.ref().child(ref).putData(file);
    }

    TaskSnapshot snapshot = await uploadTask!;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
