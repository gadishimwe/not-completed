import 'package:flutter/material.dart';
import 'package:interview_app/features/presentation/providers/products.dart';
import 'package:interview_app/features/presentation/ui/widgets/pricing_card.dart';
import 'package:provider/provider.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      Provider.of<Products>(context, listen: false).getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(title: const Text('Pricing')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return PricingCard(
              price: products[index].price,
              priceWithDiscount: products[index].discountPrice,
            );
          },
        ),
      ),
    );
  }
}
