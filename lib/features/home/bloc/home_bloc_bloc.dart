import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/cart_items.dart';
import 'package:flutter_application_1/data/gorecery_data.dart';
import 'package:flutter_application_1/data/wishlist_items.dart';
import 'package:flutter_application_1/models/home_product_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imgUrl: e['imgUrl']))
            .toList()));
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist navigate button clicked");
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("cart navigate button clicked");
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cartbutton clicked");
    CartItems.cartItems.add(event.clickedProduct);
    emit(HomeProductAddedToCartActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("wishlist button clicked");
    WishlistItems.wishlistItems.add(event.clickedProduct);
    emit(HomeProductAddedToWishlistActionState());
  }
}
