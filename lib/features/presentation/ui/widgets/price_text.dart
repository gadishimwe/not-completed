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
            Stack(
              children: [
                CustomText(
                  text: price.toStringAsFixed(
                      price.truncateToDouble() == price ? 0 : 1),
                ),
                priceWithDiscount != null
                    ? Positioned(
                        top: 8,
                        child: Transform.rotate(
                          angle: -8.39,
                          child: Container(
                            height: 4,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color(0xffFD6161),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
            SizedBox(height: 8),
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
        text: '$text€',
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
