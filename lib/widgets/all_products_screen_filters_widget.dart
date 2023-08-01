import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/widgets/product_filter_radio_modal_bottom_sheet.dart';

final sortContentList = [
  'Price: Lowest first',
  'Price: Highest first',
  'Rating: High rated first',
  'Rating: Low rated first',
];

final categoryContentList = [
  "Electronics",
  "Jewelery",
  "Men's clothing",
  "Women's clothing"
];

final sortFilterIndex = <String, int>{
  sortContentList[0]: 0,
  sortContentList[1]: 1,
  sortContentList[2]: 2,
  sortContentList[3]: 3,
};

final categoryFilterIndex = <String, int>{
  categoryContentList[0]: 0,
  categoryContentList[1]: 1,
  categoryContentList[2]: 2,
  categoryContentList[3]: 3,
};

class AllProductScreenFilterWidget extends StatelessWidget {
  const AllProductScreenFilterWidget({
    Key? key,
    required this.sortFilterSelected,
    required this.categoryFilterSelected,
  }) : super(key: key);

  final void Function() sortFilterSelected;
  final void Function() categoryFilterSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: const RoundedRectangleBorder(),
      child: Row(
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: sortFilterSelected,
              label: Text(
                'Sort',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 14,
                    ),
              ),
              icon: const Icon(
                Icons.compare_arrows,
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              onPressed: categoryFilterSelected,
              label: Text(
                'Category',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 14,
                    ),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
