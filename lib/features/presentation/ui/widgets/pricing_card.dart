import 'package:flutter/material.dart';
import 'package:interview_app/features/presentation/ui/widgets/price_text.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({super.key, required this.price, this.priceWithDiscount});

  final double price;
  final double? priceWithDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 227,
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              color: const Color(0xffE0E0E0),
              borderRadius: BorderRadius.circular(
                29,
              ),
            ),
            child: const Icon(Icons.alarm, size: 32),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            decoration: BoxDecoration(
              color: const Color(0xffF5F4F7),
              borderRadius: BorderRadius.circular(
                29,
              ),
            ),
            child: const Text(
              'Amber Member',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PriceText(
            price: price,
            priceWithDiscount: priceWithDiscount,
          )
        ],
      ),
    );
  }
}
