class Product {
  String id;
  String title;
  String description;
  double price;
  List<String> images;
  int stock;
  String category;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.stock,
    required this.category,
  });

  factory Product.fromMap(String id, Map<String, dynamic> map) {
    return Product(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      images: List<String>.from(map['images'] ?? []),
      stock: (map['stock'] ?? 0),
      category: map['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'images': images,
      'stock': stock,
      'category': category,
    };
  }
}
