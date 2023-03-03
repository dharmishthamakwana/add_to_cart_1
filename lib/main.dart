
import 'package:add_to_cart_1/screen/cart/cart_screen.dart';
import 'package:add_to_cart_1/screen/detiles/view/details_screen.dart';
import 'package:add_to_cart_1/screen/home/provider/home_provider.dart';
import 'package:add_to_cart_1/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Homescreen(),
          'product' : (context) => Productscreen(),
          'cart' : (context) => Cartscreen(),
        },
      ),
    ),
  );
}
