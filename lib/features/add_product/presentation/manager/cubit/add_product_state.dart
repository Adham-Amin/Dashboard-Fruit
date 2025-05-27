part of 'add_product_cubit.dart';

abstract class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class AddProductLoading extends AddProductState {}
final class AddProductSuccess extends AddProductState {}
final class AddProductError extends AddProductState {
  final String message;
  AddProductError({required this.message});
}
