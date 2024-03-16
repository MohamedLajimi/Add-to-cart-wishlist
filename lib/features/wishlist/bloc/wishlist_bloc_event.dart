part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocEvent {}

class WishlistInitialEvent extends WishlistBlocEvent{}

class WishlistRemoveFromWishListEvent extends WishlistBlocEvent {
  final ProductModel productModel;

  WishlistRemoveFromWishListEvent({required this.productModel});
}
