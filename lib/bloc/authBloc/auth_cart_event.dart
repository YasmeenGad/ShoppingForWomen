part of 'auth_cart_bloc.dart';

class AuthCartEvent {}

class AddCart extends AuthCartEvent {
  String image;
  String name;
  String price;
  AddCart({required this.image, required this.name, required this.price});
}

class RemoveCart extends AuthCartEvent {
  String image;
  String name;
  String price;
  RemoveCart({required this.image, required this.name, required this.price});
}
