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
    final isLoading = Provider.of<Products>(context).isLoading;
    final selectedProduct = Provider.of<Products>(context).selectedProduct;
    final selectProduct = Provider.of<Products>(context).selectProduct;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(title: const Text('Pricing')),
      body: Column(
        children: [
          !isLoading
              ? products.isNotEmpty
                  ? SizedBox(
                      height: 280,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16),
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return PricingCard(
                            product: products[index],
                            onTap: () => selectProduct(products[index]),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text(
                      'There are no products',
                    ))
              : const Center(child: CircularProgressIndicator()),
          Text('Selected product:'),
          Text(selectedProduct != null
              ? selectedProduct.product
              : 'No selected product'),
        ],
      ),
    );
  }
}
