import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/models/product.dart';
import 'package:flutter_ecom_app/screens/all_products_screen.dart';
import 'package:flutter_ecom_app/screens/cart_checkout_success.dart';
import 'package:flutter_ecom_app/screens/cart_screen.dart';
import 'package:flutter_ecom_app/screens/favorites_screen.dart';
import 'package:flutter_ecom_app/screens/product_details_screen.dart';
import 'package:flutter_ecom_app/themes/app_theme.dart';
import 'package:flutter_ecom_app/widgets/app_bottom_nav_bar.dart';

class LeeshoHomeScreen extends StatefulWidget {
  const LeeshoHomeScreen({Key? key}) : super(key: key);

  @override
  State<LeeshoHomeScreen> createState() => _LeeshoHomeScreenState();
}

class _LeeshoHomeScreenState extends State<LeeshoHomeScreen> {
  Widget? mainContent;

  final List _favorites = [];
  final List _cartItems = [];
  String _activeScreenAppBarTitle = 'Home';
  int _tabIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  void _onProductRemovedFromFav(Product product) {
    setState(() {
      _favorites.remove(product);
    });
    _showSnackBar("Product removed from your favorites.");
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ));
  }

  void _onProductFavClicked(Product product) {
    bool isProductAlreadyFav = _favorites.contains(product);
    String message = '';
    if (isProductAlreadyFav) {
      setState(() {
        _favorites.remove(product);
      });
      message = 'Product removed from your favorites';
    } else {
      setState(() {
        _favorites.add(product);
      });
      message = 'Product added to your favorites!';
    }
    _showSnackBar(message);
  }

  void _onProductBuyClicked(Product product) {
    _cartItems.add(product);
    _showSnackBar("Product added to your Cart");
  }

  void _onProductSelected(Product product) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ProductDetailsScreen(
            product: product,
            onFavoriteClicked: _onProductFavClicked,
            onProductBuyClicked: _onProductBuyClicked);
      },
    ));
  }

  void _onCartItemRemoved(Product product) {
    setState(() {
      _cartItems.remove(product);
    });
  }

  void _onCheckoutCompleted(){
    setState(() {
      _cartItems.clear();
    });
    Navigator.of(context).pop();
  }

  void _onCartCheckout(List cartItems) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return CartCheckoutSuccess(onScreenDismissed: _onCheckoutCompleted,);
      },
    ));
  }

  void _showCartScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return CartScreen(
          cartItems: _cartItems,
          onCartItemRemoved: _onCartItemRemoved,
          onCartItemCheckOut: _onCartCheckout,
        );
      },
    ));
  }

  @override
  void initState() {
    // mainContent = AllProductsScreen(
    //   onFavClicked: _onProductFavClicked,
    //   onBuyClicked: _onProductBuyClicked,
    //   onProductSelected: _onProductSelected,
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabIndex == 0) {
      setState(() {
        mainContent = AllProductsScreen(
          onFavClicked: _onProductFavClicked,
          onBuyClicked: _onProductBuyClicked,
          onProductSelected: _onProductSelected,
        );
        _activeScreenAppBarTitle = 'Home';
      });
    }

    if (_tabIndex == 1) {
      //fav tab
      setState(() {
        mainContent = FavoritesScreen(
          favorites: _favorites,
          onProductSelected: _onProductSelected,
          onProductRemovedFromFavorites: _onProductRemovedFromFav,
        );
        _activeScreenAppBarTitle = 'Favorites';
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            _activeScreenAppBarTitle,
          ),
          actions: [
            IconButton(
              onPressed: _showCartScreen,
              icon: const Icon(Icons.shopping_cart_outlined),
              color:
                  Theme.of(context).colorScheme.onPrimaryContainer.withRed(100),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(gradient: appMainBackgroundGradient),
          child: mainContent,
        ),
        bottomNavigationBar: LeeshoAppBottomNavBar(
          onTabChangeCallback: _onTabChange,
        ));
  }
}
