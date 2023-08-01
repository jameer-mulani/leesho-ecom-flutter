class Product {
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating,
      required this.count});

  Product.fromJson(Map<String, dynamic> map): id = map['id'],
        title = map['title'],
        price = map['price'],
        description = map['description'],
        category = map['category'],
        image = map['image'],
        rating = map['rating']['rate'],
        count = map['rating']['count'];

  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final num rating;
  final int count;

  @override
  String toString() {
    return 'Product{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating, count: $count}';
  }
}
