import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier
{

  List<ProductModel> productData = [

    ProductModel(name: "Apple",price: 100,img: "🍎",q: 1),
    ProductModel(name: "Mango",price: 800,img: "🥭",q: 1),
    ProductModel(name: "Watermelon",price: 80,img: "🍉",q: 1),
    ProductModel(name: "Graps",price: 50,img: "🍇",q: 1),
    ProductModel(name: "Banana",price: 20,img: "🍌",q: 1),
    ProductModel(name: "Kiwi",price: 120,img: "🥝",q: 1),

  ];

  List<ProductModel> cartData = [

  ];

  void addcart(ProductModel p1)
  {
    cartData.add(p1);
    notifyListeners();
  }

  void updateQa(int index, ProductModel p1)
  {
    productData[index] = p1;
    notifyListeners();
  }



}
