// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:ecommerceapp/models/COllection.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final String id;
  final String title;
  final String description;
  final List<String> media;
  final String category;
  final List<Collection> collections;
  final List<dynamic> tags;
  final List<dynamic> sizes;
  final List<dynamic> colors;
  final int price;
  final int expense;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String productId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.media,
    required this.category,
    required this.collections,
    required this.tags,
    required this.sizes,
    required this.colors,
    required this.price,
    required this.expense,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.productId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    media: List<String>.from(json["media"].map((x) => x)),
    category: json["category"],
    collections: List<Collection>.from(json["collections"].map((x) => Collection.fromJson(x))),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
    colors: List<dynamic>.from(json["colors"].map((x) => x)),
    price: json["price"],
    expense: json["expense"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    productId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "media": List<dynamic>.from(media.map((x) => x)),
    "category": category,
    "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "sizes": List<dynamic>.from(sizes.map((x) => x)),
    "colors": List<dynamic>.from(colors.map((x) => x)),
    "price": price,
    "expense": expense,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": productId,
  };
}

class Collection {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<String> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Collection({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    products: List<String>.from(json["products"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "image": image,
    "products": List<dynamic>.from(products.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
