import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/services/fire_storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';

class ImageRepoImpl implements ImageRepo {
  late final FireStorageService fireStorageService;
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      var url = await fireStorageService.uploadFile(
        path: BackendEndpoints.images,
        file: image,
      );
      return right(url);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to upload image'));
    }
  }
}
