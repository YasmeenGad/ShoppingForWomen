part of 'add_favorite_cart_bloc.dart';

class AddFavoriteCartEvent {}

class AddFavoriteCart extends AddFavoriteCartEvent {
  String image;
  String name;
  String price;
  AddFavoriteCart(
      {required this.image, required this.name, required this.price});
}
