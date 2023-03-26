class Product {
  final int id;
  final String product;
  final double price;
  final double? discountPrice;

  Product({
    required this.id,
    required this.product,
    required this.price,
    this.discountPrice,
  });

  factory Product.fromJson(data) {
    return Product(
      id: data['id'],
      product: data['product'],
      price: data['price'],
      discountPrice: data['discount_price'],
    );
  }
}
