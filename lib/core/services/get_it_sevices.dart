import 'package:fruit_hub_dashboard/core/services/fire_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FireStorageService>(FireStorageService());
}
