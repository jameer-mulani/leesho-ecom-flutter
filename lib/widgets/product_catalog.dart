import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:flutter_ecom_app/widgets/product_tile.dart';

class ProductCatalog extends StatelessWidget {
  const ProductCatalog(
      {Key? key,
      required this.products,
      required this.onProductSelected,})
      : super(key: key);

  final List<dynamic> products;

  final void Function(Product product) onProductSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 0,
        childAspectRatio: 4 / 3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(
          product: products[index],
          onProductSelected: onProductSelected,
        );
      },
    );
  }
}
