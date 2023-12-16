import 'package:chipapp/hive/product.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ProductStorage {
  static const String _boxName = 'productman';

  Future<Box<Product>> _openBox() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    try {
      Hive.init(appDocumentDirectory.path);
      return await Hive.openBox<Product>(_boxName);
    } catch (e) {
      print('Error opening Hive box: $e');
      rethrow; // Re-throw the exception after printing the error
    }
  }

  Future<void> saveProduct(Product product) async {
    try {
      final box = await _openBox();
      await box.add(product);
      print('Product saved: $product');
    } catch (e) {
      print('Error saving product: $e');
    }
  }

  Future<List<Product>> getProducts() async {
    try {
      final box = await _openBox();
      // print("jjlkllllllllllllll");
      // print(box.values.toList());
      return box.values.toList();
    } catch (e) {
      print('Error getting products: $e');
      return []; // Return an empty list or handle the error as needed
    }
  }
}
