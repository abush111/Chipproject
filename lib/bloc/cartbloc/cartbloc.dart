import 'package:chipapp/bloc/cartbloc/cartevent.dart';
import 'package:chipapp/bloc/cartbloc/cartstate.dart';
import 'package:chipapp/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../hive/cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  // Reference to the Hive box
  final Box<Cart> cartBox = Hive.box<Cart>('carts');

  CartBloc() : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) {
      cartBox.add(event.cartItem);
      Constants.totalitem = event.cartItem.name.length;
      print(event.cartItem);
      emit(CartLoadedState(cartBox.values.toList()));
    });

    on<FetchCartEvent>((event, emit) {
      emit(CartLoadedState(cartBox.values.toList()));
    });
    // Add handlers for other events as needed
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    // This is intentionally left empty because event handling is done in the constructor.
  }
}
