import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// class StripeApi {
//   Future<Map<String, dynamic>> createPaymentIntent({
//     required String amount,
//     required String currency,
//   }) async {
//     await dotenv.load(fileName: "assets/env/.env");
//     try {
//       Map<String, dynamic> body = {
//         'amount': amount,
//         'currency': currency,
//       };

//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: body,
//       );

//       if (response.statusCode == 200) {
//         return json.decode(response.body);
//       } else {
//         // Handle API error, log the response, or throw an exception
//         print('Payment Intents API error: ${response.body}');
//         throw Exception('Failed to create payment intent');
//       }
//     } catch (err) {
//       throw Exception(err);
//     }
//   }
// }
class StripeApi {
  Future<Map<String, dynamic>> createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    await dotenv.load(fileName: "assets/env/.env");
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        // Convert the body to a query string
        body: Uri.encodeFull(Uri(queryParameters: body).query),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        // Handle API error, log the response, or throw an exception
        print('Payment Intents API error: ${response.body}');
        throw Exception('Failed to create payment intent');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
