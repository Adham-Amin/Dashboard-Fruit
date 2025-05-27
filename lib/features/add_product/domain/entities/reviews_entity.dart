class ReviewsEntity {
  final String image;
  final String name;
  final String date;
  final double rating;
  final String review;

  ReviewsEntity({
    required this.image,
    required this.name,
    required this.date,
    required this.rating,
    required this.review,
  });

  factory ReviewsEntity.fromJson(Map<String, dynamic> json) {
    return ReviewsEntity(
      image: json['image'],
      name: json['name'],
      date: json['date'],
      rating: json['rating'],
      review: json['review'],
    );
  }

  toJson() {
    return {
      'image': image,
      'name': name,
      'date': date,
      'rating': rating,
      'review': review,
    };
  }
}
