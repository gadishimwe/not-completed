class Product {
  final String id;
  final String username;
  final double price;
  final double? discountPrice;

  Product({
    required this.id,
    required this.username,
    required this.price,
    this.discountPrice,
  });

  factory Product.fromJson(data) {
    return Product(
      id: data['id'],
      username: data['username'],
      price: data['price'],
      discountPrice: data['discountPrice'],
    );
  }
}
