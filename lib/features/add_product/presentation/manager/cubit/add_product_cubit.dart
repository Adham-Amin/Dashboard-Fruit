import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imageRepo, required this.productRepo})
    : super(AddProductInitial());

  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  void addProduct(AddProductEntity product) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(product.imageFile);
    result.fold((failure) {
      emit(AddProductError(message: failure.message));
    },
     (url) async {
      product.imageUrl = url;
      var result = await productRepo.addProduct(product);
      result.fold(
        (failure) => emit(AddProductError(message: failure.message)),
        (_) => emit(AddProductSuccess()),
      );
    });
  }
}
