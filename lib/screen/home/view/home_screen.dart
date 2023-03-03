import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../provider/home_provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  ProductProvider? productProvider;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shopping App",
              style: TextStyle(color: Colors.black, letterSpacing: 2)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cart');
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              ProductModel p1 = ProductModel(
                  name: productProvider!.productData[index].name,
                  img: productProvider!.productData[index].img,
                  price: productProvider!.productData[index].price);
              Navigator.pushNamed(context, 'product', arguments: p1);
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.blue.shade100),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "${productProvider!.productData[index].img}",
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    "${productProvider!.productData[index].name}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${productProvider!.productData[index].price}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          itemCount: productProvider!.productData.length,
        ),
      ),
    );
  }
}
