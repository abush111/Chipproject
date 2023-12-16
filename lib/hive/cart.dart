import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  int count; // Corrected to int for counting items in the cart

  @HiveField(3)
  Uint8List imageBytes;

  Cart({
    required this.name,
    required this.price,
    required this.count,
    required this.imageBytes,
  });
}
