import 'package:bloc/bloc.dart';
import 'package:shoppingapp/class_detatils/class_details.dart';
// import 'package:meta/meta.dart';

part 'add_favorite_cart_event.dart';
part 'add_favorite_cart_state.dart';

class AddFavoriteCartBloc
    extends Bloc<AddFavoriteCartEvent, AddFavoriteCartState> {
  List<Details> addFav = [];
  AddFavoriteCartBloc() : super(AddFavoriteCartInitial()) {
    on<AddFavoriteCartEvent>((event, emit) {
      if (event is AddFavoriteCart) {
        addFav.add(
            Details(image: event.image, name: event.name, price: event.price));
        emit(AddFavoriteCartSuccess());
      }
    });
  }
}
