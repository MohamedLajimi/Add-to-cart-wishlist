import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_application_1/models/home_product_model.dart';

class CartTile extends StatelessWidget {
  const CartTile(
      {super.key, required this.productModel, required this.cartBloc});
  final ProductModel productModel;
  final CartBloc cartBloc;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(productModel.imgUrl),
        ),
        title: Text(
          productModel.name,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text("${productModel.price} \$"),
        trailing: IconButton(
            onPressed: () {
              cartBloc.add(CartRemoveFromCartEvent(productModel: productModel));
            },
            icon: const Icon(Icons.remove)),
      ),
    );
  }
}
