import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/themes/app_theme.dart';

class CartCheckoutSuccess extends StatelessWidget {
  const CartCheckoutSuccess({Key? key, required this.onScreenDismissed})
      : super(key: key);

  final void Function() onScreenDismissed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: appMainBackgroundGradient),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yay!, your order has been placed",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      onScreenDismissed();
                    },
                    child: Text(
                      'Shop more!',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
