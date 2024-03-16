import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:flutter_application_1/models/home_product_model.dart';

class WishlistTile extends StatelessWidget {
  const WishlistTile(
      {super.key, required this.productModel, required this.wishlistBloc});
  final ProductModel productModel;
  final WishlistBloc wishlistBloc;
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
        trailing: IconButton(
            onPressed: () {
              wishlistBloc.add(WishlistRemoveFromWishListEvent(productModel: productModel));
            },
            icon: const Icon(Icons.favorite)),
      ),
    );
  }
}
