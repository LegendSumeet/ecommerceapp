
import 'dart:convert';

List<GetOrders> getOrdersFromJson(String str) => List<GetOrders>.from(json.decode(str).map((x) => GetOrders.fromJson(x)));

String getOrdersToJson(List<GetOrders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOrders {
  final ShippingAddress shippingAddress;
  final String id;
  final String customerClerkId;
  final List<ProductElement> products;
  final String shippingRate;
  final int totalAmount;
  final DateTime createdAt;
  final int v;

  GetOrders({
    required this.shippingAddress,
    required this.id,
    required this.customerClerkId,
    required this.products,
    required this.shippingRate,
    required this.totalAmount,
    required this.createdAt,
    required this.v,
  });

  factory GetOrders.fromJson(Map<String, dynamic> json) => GetOrders(
    shippingAddress: ShippingAddress.fromJson(json["shippingAddress"]),
    id: json["_id"],
    customerClerkId: json["customerClerkId"],
    products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
    shippingRate: json["shippingRate"],
    totalAmount: json["totalAmount"],
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "shippingAddress": shippingAddress.toJson(),
    "_id": id,
    "customerClerkId": customerClerkId,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "shippingRate": shippingRate,
    "totalAmount": totalAmount,
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}

class ProductElement {
  final ProductProduct product;
  final int quantity;
  final String id;

  ProductElement({
    required this.product,
    required this.quantity,
    required this.id,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    product: ProductProduct.fromJson(json["product"]),
    quantity: json["quantity"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
    "quantity": quantity,
    "_id": id,
  };
}

class ProductProduct {
  final String id;
  final String title;
  final String description;
  final List<String> media;
  final String category;
  final List<String> collections;
  final List<dynamic> tags;
  final List<dynamic> sizes;
  final List<dynamic> colors;
  final int price;
  final int expense;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String productId;

  ProductProduct({
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

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    media: List<String>.from(json["media"].map((x) => x)),
    category: json["category"],
    collections: List<String>.from(json["collections"].map((x) => x)),
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
    "collections": List<dynamic>.from(collections.map((x) => x)),
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

class ShippingAddress {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  ShippingAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    street: json["street"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postalCode"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "postalCode": postalCode,
    "country": country,
  };
}
