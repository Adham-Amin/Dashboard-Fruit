import 'dart:io';

abstract class StorageService {
  Future<String> uploadFile({required String path, required File file});
}