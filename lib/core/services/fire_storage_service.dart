import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';

class FireStorageService implements StorageService {

  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile({required String path, required File file}) async {
    var fileName = p.basename(file.path);
    var extension = p.extension(file.path);
    final imageRef = storageRef.child("$path/$fileName.$extension");
    await imageRef.putFile(file);
    var url = await imageRef.getDownloadURL();
    return url;
  }
}