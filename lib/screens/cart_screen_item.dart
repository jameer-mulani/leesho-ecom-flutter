import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Colors.white
              ),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(product.image),
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              children: [
                Text(
                  product.title.trim(),
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onBackground),
                ),

                const SizedBox(height: 8,),

                Text(product.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                  ),)
              ],
            ),
          )

        ],
      )
    );


/*      ListTile(
        title: Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        leading: SizedBox(
          width: 100,
          height: 150,
          child: Container(
            color: Colors.white,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(product.image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        subtitle: Text(product.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        ),),
      ),
    );*/
  }
}
