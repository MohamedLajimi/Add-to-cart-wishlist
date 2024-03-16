part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}
 
class HomeNavigateToWishlistActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}

class HomeProductAddedToCartActionState extends HomeActionState {}

class HomeProductAddedToWishlistActionState extends HomeActionState {}