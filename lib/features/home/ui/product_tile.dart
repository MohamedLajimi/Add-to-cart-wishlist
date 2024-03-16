import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_application_1/models/home_product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.productModel, required this.homeBloc});
  final ProductModel productModel;
  final HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(productModel.imgUrl), fit: BoxFit.fill)),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          productModel.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(productModel.description),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productModel.price.toString() + "\$",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productModel));
                    },
                    icon: Icon(Icons.favorite_border_outlined)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productModel));
                    },
                    icon: Icon(Icons.shopping_bag_outlined))
              ],
            )
          ],
        ),
      ]),
    );
  }
}
