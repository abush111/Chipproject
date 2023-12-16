import 'package:chipapp/hive/cart.dart';
import 'package:equatable/equatable.dart';


abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitialState extends CartState {}

class CartLoadedState extends CartState {
  final List<Cart> cartItems;

  CartLoadedState(this.cartItems);

  @override
  List<Object?> get props => [cartItems];
}

class CartErrorState extends CartState {
  final String error;

  CartErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
