import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:shoppingapp/class_detatils/class_details.dart';

part 'auth_cart_event.dart';
part 'auth_cart_state.dart';

class AuthCartBloc extends Bloc<AuthCartEvent, AuthCartState> {
  List<Details> carts = [];
  int counter = 0;

  AuthCartBloc() : super(AddCartInitial()) {
    on<AuthCartEvent>((event, emit) {
      if (event is AddCart) {
        carts.add(
            Details(image: event.image, name: event.name, price: event.price));
        counter++;

        emit(AddCartSuccess());
      } else if (event is RemoveCart) {
        carts.remove(
            Details(image: event.image, name: event.name, price: event.price));
        counter--;
        emit(RemoveCartSuccess());
      }
    });
  }
}
// on<RemoveCart>((event, emit) {
//       carts.remove(
//           Details(image: event.image, name: event.name, price: event.price));
//       emit(RemoveCartSuccess());
//     });

//     on<AddCart>((event, emit) {
//       carts.add(
//           Details(image: event.image, name: event.name, price: event.price));
//       counter++;
//       emit(AddCartSuccess());
//     });