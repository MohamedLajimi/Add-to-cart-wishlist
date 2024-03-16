import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/cart_items.dart';
import 'package:flutter_application_1/models/home_product_model.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: CartItems.cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    CartItems.cartItems.remove(event.productModel);
    emit(CartSuccessState(cartItems: CartItems.cartItems));
  }
}
