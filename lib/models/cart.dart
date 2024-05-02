



class CartItem {
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
  final String CartItemId;

  CartItem({
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
    required this.CartItemId,
  });
}

class Collection {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<String> CartItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Collection({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.CartItems,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}
