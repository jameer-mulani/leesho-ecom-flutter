import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:flutter_ecom_app/widgets/product_tile.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(
      {Key? key,
      required this.favorites,
      required this.onProductSelected,
      required this.onProductRemovedFromFavorites})
      : super(key: key);

  final List favorites;
  final Function(Product) onProductSelected;
  final Function(Product) onProductRemovedFromFavorites;

  @override
  Widget build(BuildContext context) {
    if (favorites.isNotEmpty) {
      return ListView(
        children: [
          for (final f in favorites)
            Dismissible(
              key: ValueKey(f),
              onDismissed: (direction) {
                onProductRemovedFromFavorites(f);
              },
              background: Container(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
              ),
              child: Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ProductTile(
                      product: f, onProductSelected: onProductSelected)),
            )
        ],
      );

      //   ListView.builder(
      //   itemBuilder: (context, index) {
      //     // ProductTile(product: favorites[index], onProductSelected: onProductSelected);
      //     Text("item");
      //   },
      //   itemCount: favorites.length,
      // );
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your favorite list is empty,',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Text(
              'Explore product catalog, add some to your favorites',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }
  }
}
