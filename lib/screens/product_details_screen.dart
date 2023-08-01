import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:flutter_ecom_app/themes/app_theme.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {Key? key,
      required this.product,
      required this.onFavoriteClicked,
      required this.onProductBuyClicked})
      : super(key: key);

  final Product product;
  final void Function(Product product) onFavoriteClicked;
  final void Function(Product product) onProductBuyClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            product.title,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              onPressed: () {
                onFavoriteClicked(product);
              },
              icon: Icon(
                Icons.star,
                size: 20,
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withRed(100),
              ),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(gradient: appMainBackgroundGradient),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 300,
                  color: Colors.white,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(product.image),
                    fit: BoxFit.scaleDown,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                  textScaleFactor: 1.1,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Category: ${product.category}',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Price: \$${product.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      'Rating: ${product.rating}',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Hurry, only ${product.count} left in stock!',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    onProductBuyClicked(product);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      foregroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      elevation: 4),
                  child: const Text(
                    "Buy Now",
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ));
  }
}
