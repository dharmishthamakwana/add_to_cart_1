import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/model/product_model.dart';
import '../home/provider/home_provider.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  ProductProvider? productProvider;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart Bucket",
              style: TextStyle(color: Colors.black, letterSpacing: 2)),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, value, child) => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    leading: Text("${productProvider!.productData[index].img}",
                        style: TextStyle(fontSize: 30)),
                    title: Text("${productProvider!.productData[index].name}",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700)),
                    subtitle: Text(
                        "${productProvider!.productData[index].price}",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              ProductModel p1 = ProductModel(
                                  img: productProvider!.productData[index].img,
                                  price: productProvider!
                                      .productData[index].price!,
                                  name:
                                      productProvider!.productData[index].name,
                                  q: productProvider!.productData[index].q! +
                                      1);
                              productProvider!.updateQa(index, p1);
                            },
                            icon: Icon(Icons.add)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("${productProvider!.productData[index].q}"),
                        ),
                        IconButton(
                            onPressed: () {
                              ProductModel p1 = ProductModel(
                                  img: productProvider!.productData[index].img,
                                  price: productProvider!
                                          .productData[index].price! /
                                      2,
                                  name:
                                      productProvider!.productData[index].name,
                                  q: productProvider!.productData[index].q! -
                                      1);
                              productProvider!.updateQa(index, p1);
                            },
                            icon: Icon(Icons.remove)),
                      ],
                    ),
                  ),
              itemCount: productProvider!.cartData.length),
        ),
      ),
    );
  }
}
