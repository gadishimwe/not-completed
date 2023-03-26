import 'package:flutter/material.dart';
import 'package:interview_app/features/data/models/product.dart';
import 'package:interview_app/features/presentation/providers/products.dart';
import 'package:interview_app/features/presentation/ui/widgets/price_text.dart';
import 'package:provider/provider.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<Products>(context).selectedProduct;
    Color color = product.id == selectedProduct?.id
        ? product.discountPrice == null
            ? const Color(0xffFCE168)
            : const Color(0xffFFB6A8)
        : const Color(0xffBDBDBD);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 230,
            height: 227,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: color,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.4),
                    border: Border.all(
                      color: color,
                    ),
                    borderRadius: BorderRadius.circular(
                      29,
                    ),
                  ),
                  child: Icon(Icons.alarm, size: 32, color: color),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F4F7),
                    borderRadius: BorderRadius.circular(
                      29,
                    ),
                  ),
                  child: Text(
                    product.product,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                PriceText(
                  price: product.price,
                  priceWithDiscount: product.discountPrice,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
