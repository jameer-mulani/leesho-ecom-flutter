import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:flutter_ecom_app/screens/cart_screen_item.dart';
import 'package:flutter_ecom_app/themes/app_theme.dart';

class CartScreen extends StatelessWidget {
  CartScreen(
      {Key? key,
      required this.cartItems,
      required this.onCartItemCheckOut,
      required this.onCartItemRemoved})
      : super(key: key);

  final List cartItems;

  final void Function(Product product) onCartItemRemoved;
  final void Function(List cartItems) onCartItemCheckOut;

  Widget? mainContent;

  @override
  Widget build(BuildContext context) {
    mainContent = Center(
      child: Text(
        "Your Cart is empty!",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );

    if (cartItems.isNotEmpty) {
      mainContent = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Theme.of(context).colorScheme.tertiary,
                );
              },
              itemBuilder: (context, index) {
                return Dismissible(
                    key: ValueKey(cartItems[index]),
                    onDismissed: (direction) {
                      onCartItemRemoved(cartItems[index]);
                    },
                    background: Container(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    child: CartItem(product: cartItems[index]));
              },
              itemCount: cartItems.length,
            ),
          ),
          Container(
              color: Theme.of(context).colorScheme.tertiary,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: ElevatedButton(
                  onPressed: () {
                    onCartItemCheckOut(cartItems);
                  },
                  child: Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  )))
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Container(
          decoration: BoxDecoration(gradient: appMainBackgroundGradient),
          child: mainContent),
    );
  }
}
