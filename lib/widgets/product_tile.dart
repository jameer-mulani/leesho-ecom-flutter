import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {Key? key,
      required this.product,
      required this.onProductSelected,})
      : super(key: key);

  final Product product;
  final void Function(Product product) onProductSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Theme.of(context).colorScheme.shadow,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            onProductSelected(product);
          },
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(product.image),
                fit: BoxFit.scaleDown,
                width: double.infinity,
                height: 300,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    color: Colors.black54.withOpacity(0.7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),

                        // const Spacer(),
                        //
                        // Expanded(
                        //   child: Text(
                        //     "${product.count} left",
                        //     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        //           color: Theme.of(context)
                        //               .colorScheme
                        //               .onPrimary,
                        //         ),
                        //   ),
                        // ),

                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.rating.toStringAsFixed(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star_outlined,
                              size: 14,
                              color: Colors.yellowAccent,
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
