import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseServices;

  ProductRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, void>> addProduct(AddProductEntity product) async {
    try {
      await databaseServices.addData(
        path: BackendEndpoints.products,
        data: product.toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to add product'));
    }
  }
}
