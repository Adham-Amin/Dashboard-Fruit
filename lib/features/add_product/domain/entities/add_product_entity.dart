import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/domain/entities/reviews_entity.dart';

class AddProductEntity {
  final String code;
  final String name;
  final String description;
  final num price;
  final File imageFile;
  String? imageUrl;
  final bool isFeaturedProduct;
  final int expirationDate;
  final bool isOrignalProduct;
  final num calories;
  final num rating ;
  final num ratingCount;
  final List<ReviewsEntity> reviews;


  AddProductEntity({
    required this.reviews,
    required this.expirationDate,
    required this.isOrignalProduct,
    this.rating = 0,
    this.ratingCount = 0,
    required this.calories,  
    required this.isFeaturedProduct,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.imageFile,
    this.imageUrl,
  });

  toJson() => {
    'code': code,
    'name': name,
    'description': description,
    'price': price,
    'imageUrl': imageUrl,
    'isFeaturedProduct': isFeaturedProduct,
    'expirationDate': expirationDate,
    'isOrignalProduct': isOrignalProduct,
    'caleries': calories,
    'rating': rating,
    'ratingCount': ratingCount,
    'reviews': reviews
  };
}
