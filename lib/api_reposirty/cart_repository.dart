// import 'package:chipapp/bloc/cartbloc/cartbloc.dart';
// import 'package:chipapp/bloc/cartbloc/cartevent.dart';
// import 'package:chipapp/hive/cart.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

// class CartRepo {
//   final CartBloc _cartBloc;

//   CartRepo(this._cartBloc);

//   static const String _boxName = 'Cart_repo';

//   Future<Box<Cart>> _openBox() async {
//     final appDocumentDirectory =
//         await path_provider.getApplicationDocumentsDirectory();

//     try {
//       Hive.init(appDocumentDirectory.path);
//       return await Hive.openBox<Cart>(_boxName);
//     } catch (e) {
//       print('Error opening Hive box: $e');
//       rethrow; // Re-throw the exception after printing the error
//     }
//   }

//   Future<void> addToCart(Cart product) async {
//     try {
//       final box = await _openBox();
//       await box.add(product);
//       print('Product saved: $product');

//       // Dispatch an event to update the CartBloc state
//       _cartBloc.add(AddToCartEvent(product));
//     } catch (e) {
//       print('Error saving product: $e');
//     }
//   }

//   Future<List<Cart>> getCartItems() async {
//     try {
//       final box = await _openBox();
//       final List<Cart> cartItems = box.values.toList();
//       return cartItems;
//     } catch (e) {
//       print('Error getting cart items: $e');
//       return [];
//     }
//   }
// }
