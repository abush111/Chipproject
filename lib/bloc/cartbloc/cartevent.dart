import 'package:chipapp/hive/cart.dart';
import 'package:equatable/equatable.dart';


abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Cart cartItem;

  AddToCartEvent(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class FetchCartEvent extends CartEvent {}

// Add other events as needed for your application
