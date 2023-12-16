import 'package:chipapp/model/productmodel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Productrepo {
  Productrepo();

  Future<List<Datum>> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('access');
    try {
      final response = await http.get(
        Uri.parse("https://stagingapi.chipchip.social/v1/products"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parse the response JSON
        final dynamic jsonResponse = json.decode(response.body);

        // Check if the JSON is a List
        if (jsonResponse is Map<String, dynamic> &&
            jsonResponse.containsKey('data')) {
          final List<Datum> productModels = List<Datum>.from(
              jsonResponse['data'].map((data) => Datum.fromJson(data)));
          return productModels;
        } else {
          // Handle the case where the response is not as expected
          throw Exception('Invalid JSON structure. Expected "data" key.');
        }
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
