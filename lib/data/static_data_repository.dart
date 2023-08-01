import 'dart:convert';

import 'package:flutter_ecom_app/data/static_products_json.dart';
import 'package:flutter_ecom_app/models/product.dart';

List allProducts =
    json.decode(kProductJson).map((e) => Product.fromJson(e)).toList();

List allProductsSortedByPriceLowToHigh(){
    List list = List.of(allProducts);

    list.sort((a, b) {
      Product aa = a as Product;
      Product bb = b as Product;

      if(aa.price == bb.price)
          return 0;
      if(aa.price > bb.price)
          return 1;
      return -1;
    },);
    return list;
}


List allProductsSortedByPriceHighToLow(){
    List list = List.of(allProducts);
    list.sort((a, b) {
        Product aa = a as Product;
        Product bb = b as Product;
        if(aa.price == bb.price)
            return 0;
        if(aa.price > bb.price)
            return -1;
        return 1;
    },);
    return list;
}


List allProductsSortedByRatingHighToLow(){
  List list = List.of(allProducts);
  list.sort((a, b) {
    Product aa = a as Product;
    Product bb = b as Product;
    if(aa.rating == bb.rating)
      return 0;
    if(aa.rating > bb.rating)
      return -1;
    return 1;
  },);
  return list;
}

List allProductsSortedByRatingLowToHigh(){
  List list = List.of(allProducts);
  list.sort((a, b) {
    Product aa = a as Product;
    Product bb = b as Product;
    if(aa.rating == bb.rating)
      return 0;
    if(aa.rating > bb.rating)
      return 1;
    return -1;
  },);
  return list;
}