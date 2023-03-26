import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  const PriceText({super.key, required this.price, this.priceWithDiscount});

  final double price;
  final double? priceWithDiscount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CustomText(text: price.toString()),
            priceWithDiscount != null
                ? CustomText(
                    text: priceWithDiscount.toString(),
                    isWithDiscount: true,
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key, required this.text, this.isWithDiscount = false});

  final String text;
  final bool isWithDiscount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff212529),
          fontSize: 18,
        ),
        children: const [
          TextSpan(
            text: '/Month',
            style: TextStyle(fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
