import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class MetalPriceService {
  final String apiUrl = 'https://api.metalpriceapi.com/v1/latest';
  final String apiKey = 'c1ed5106aa1cf0b8bc66981fe6b253c7';
  final String baseCurrency = 'AED';
  final List<String> currencies = ['AED', 'XAU', 'XAG'];

  Future<Map<String, dynamic>> getMetalPrices() async {
    final response = await http.get(
      Uri.parse(
          '$apiUrl?api_key=$apiKey&base=$baseCurrency&currencies=${currencies.join(',')}'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load metal prices');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final String apiUrl = 'https://www.goldapi.io/api/XAU/AED';
    final String accessToken = 'goldapi-j2xprls2zahtb-io';

    log('came to fetchhing...');

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'x-access-token': accessToken},
    );

    print(response.statusCode);

    // if (response.statusCode == 200) {
    //   // Parse the JSON data
    //   Map<String, dynamic> data = json.decode(response.body);
    //   print(data);
    //   return data;
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // throw an exception.
    //   throw Exception('Failed to load data');
    // }
    Map<String, dynamic> data = json.decode(response.body);

    print("data");
    return data;
  }
}
