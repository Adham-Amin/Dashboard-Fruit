import 'dart:io';
import 'package:fruit_hub_dashboard/core/errors/custom_exception.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseStorageService implements StorageService {
  final supabase = Supabase.instance.client;

  @override
  Future<String> uploadFile({required String path, required File file}) async {
    try {
      final fileName = p.basename(file.path);

      final existingFiles = await supabase.storage.from(path).list();
      final fileExists = existingFiles.any((f) => f.name == fileName);

      if (!fileExists) {
        await supabase.storage.from(path).upload(fileName, file);
      } else {
        throw CustomException(message: 'The Image already exists.');
      }

      final url = supabase.storage.from(path).getPublicUrl(fileName);
      return url;

    } catch (e) {
      throw CustomException(message: 'The Image already exists.');
    }
  }
}
