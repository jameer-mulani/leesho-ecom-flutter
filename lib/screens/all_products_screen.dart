import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/data/static_data_repository.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:flutter_ecom_app/screens/product_details_screen.dart';
import 'package:flutter_ecom_app/themes/app_theme.dart';
import 'package:flutter_ecom_app/widgets/all_products_screen_filters_widget.dart';
import 'package:flutter_ecom_app/widgets/product_catalog.dart';
import 'package:flutter_ecom_app/widgets/product_filter_radio_modal_bottom_sheet.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen(
      {Key? key,
      required this.onFavClicked,
      required this.onBuyClicked,
      required this.onProductSelected})
      : super(key: key);

  final void Function(Product product) onFavClicked;
  final void Function(Product product) onBuyClicked;
  final void Function(Product product) onProductSelected;

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final _searchFieldController = TextEditingController();

  List _allProducts = allProducts;

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  void _onSortFilterSelected() {
    Widget bottomSheetContent = FilterRadioModalBottomSheet(
        titleList: sortContentList, indexMap: sortFilterIndex);
    _showModalBottomSheet(bottomSheetContent, 'sort');
  }

  void _onCategoryFilterSelected() {
    Widget bottomSheetContent = FilterRadioModalBottomSheet(
        titleList: categoryContentList, indexMap: categoryFilterIndex);
    _showModalBottomSheet(bottomSheetContent, 'category');
  }

  void _showModalBottomSheet(Widget child, String type) async {
    final value = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 4,
      context: context,
      builder: (context) => child,
    );

    if (type == 'sort') {
      switch (value['sortIndex']) {
        case 0:
          setState(() {
            _allProducts = allProductsSortedByPriceLowToHigh();
          });
          break;
        case 1:
          setState(() {
            _allProducts = allProductsSortedByPriceHighToLow();
          });
          break;
        case 2:
          setState(() {
            _allProducts = allProductsSortedByRatingHighToLow();
          });
          break;
        case 3:
          setState(() {
            _allProducts = allProductsSortedByRatingLowToHigh();
          });
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 2.0, left: 8, right: 8),
          child: TextField(
            controller: _searchFieldController,
            decoration: InputDecoration(
              labelText: 'Search product in the catalog',
              suffixIcon: IconButton(onPressed: (){
                _searchFieldController.clear();
                setState(() {
                  _allProducts = allProducts;
                });
              }, icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.primary,))
            ),
            maxLines: 1,
            clipBehavior: Clip.hardEdge,
            onSubmitted: (value) {
              _allProducts = allProducts;
              if (value.length > 3) {
                List newList = _allProducts.where((element) {
                  Product p = element as Product;
                  return (p.description
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      p.title.toLowerCase().contains(value.toLowerCase()));
                }).toList();

                setState(() {
                  _allProducts = newList;
                });
              } else {
                setState(() {
                  _allProducts = allProducts;
                });
              }

              print("AllProductScreen:SearchBox value : $value");
            },
          ),
        ),

        AllProductScreenFilterWidget(
          sortFilterSelected: _onSortFilterSelected,
          categoryFilterSelected: _onCategoryFilterSelected,
        ),

        Expanded(
            child: ProductCatalog(
          products: _allProducts,
          onProductSelected: widget.onProductSelected,
        ))

        // Center(
        //   child: ProductTile(product: allProducts[11])
        // )
      ],
    );
  }
}
