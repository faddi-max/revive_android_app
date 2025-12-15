class Product {
  String id;
  String name;
  String category;
  String price;
  String image;
  String description;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      "category": category,
      "price": price,
      "image": image,
      "description": description,
    };
  }
}
