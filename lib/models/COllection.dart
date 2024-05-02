class uSERCollection {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<String> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  uSERCollection({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory uSERCollection.fromJson(Map<String, dynamic> json) => uSERCollection(
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