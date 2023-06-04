import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final String id;
  final String price;
  final String title;
  final String images;
  final double rating;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.images,
    required this.rating,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"],
    title: json["title"],
    images: json["images"],
    rating: json["rating"]?.toDouble(),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "title": title,
    "images": images,
    "rating": rating,
    "description": description,
  };
}
