import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  Uint8List imageBytes;

  Product({
    required this.name,
    required this.price,
    required this.imageBytes,
  });
}
