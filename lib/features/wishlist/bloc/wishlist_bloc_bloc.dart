import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/home_product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBloc() : super(WishlistBlocInitial()) {
    on<WishlistBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
