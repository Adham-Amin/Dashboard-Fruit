import 'dart:io';

class AddProductEntity {
  final String code;
  final String name;
  final String description;
  final num price;
  final File imageFile;
  final String? imageUrl;
  final bool isFeaturedProduct;

  AddProductEntity({
    required this.isFeaturedProduct,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.imageFile,
    this.imageUrl,
  });
}
