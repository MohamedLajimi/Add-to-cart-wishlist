import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/ui/cart_page.dart';
import 'package:flutter_application_1/features/home/ui/product_tile.dart';
import 'package:flutter_application_1/features/wishlist/ui/wishlist_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/features/home/bloc/home_bloc_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishList()));
        } else if (state is HomeProductAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.teal,
              content: Text("Item added to cart")));
        } else if (state is HomeProductAddedToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.teal,
              content: Text("Item added to wishlist")));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is HomeLoadedSuccessState) {
          final successState = state;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text(
                "Grocery App",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  },
                  icon: Icon(Icons.favorite_border_outlined),
                  color: Colors.white,
                ),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            body: ListView.builder(
              itemCount: successState.products.length,
              itemBuilder: (context, index) {
                return ProductTile(
                    homeBloc: homeBloc,
                    productModel: successState.products[index]);
              },
            ),
          );
        }

        if (state is HomeErrorState) {
          return Scaffold(
            body: Center(child: Text("Error")),
          );
        }

        return Container(
          child: Text("nothing"),
        ); // This line is unreachable but needed to satisfy the compiler
      },
    );
  }
}
