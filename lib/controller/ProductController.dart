import 'package:flutter/foundation.dart';

import '../model/Product.dart';


class ProductController{

  //DEFAULT LIST
  List<Product> productList = [
    Product('Smartphone', 12000),
    Product('Laptop', 60000),
    Product('Headphones', 3000),
    Product('Tablet', 7000),
    Product('Smartwatch', 1500),
  ];

  //RETURN ALL PRODUCT
  Future<List<Product>> getAllProduct() async{
    return productList;
  }


  //RETURN PRODUCTS WITHIN PRICE RANGE
  Future<List<Product>> getProductPriceRange(int start, int end) async{
    List<Product> productListNew =[];

    productListNew = productList.where((element) => element.price > start && element.price < end).toList();

    if (kDebugMode) {
      print(productListNew);
    }
    return productListNew;
  }

  //RETURN PRODUCTS WITH UPDATED PRICE
  Future<List<Product>> getProductDiscountedPrice(int discount) async{
    List<Product> productListNew =[];
    for(int x =0; x<productList.length;x++){
        productListNew.add(Product(productList[x].name, productList[x].price - (productList[x].price * discount/100) ));
    }

    if (kDebugMode) {
      print(productListNew);
    }
    return productListNew;
  }



}