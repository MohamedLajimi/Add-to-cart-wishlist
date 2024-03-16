import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_application_1/features/cart/ui/cart_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartSuccessState) {
            final successState = state as CartSuccessState;
            return ListView.builder(
              itemCount: successState.cartItems.length,
              itemBuilder: (context, index) {
                return CartTile(
                    productModel: successState.cartItems[index],
                    cartBloc: cartBloc
                    );
              },
            );
          }
          return Container(
            child: Text("nothing"),
          );
        },
      ),
    );
  }
}
