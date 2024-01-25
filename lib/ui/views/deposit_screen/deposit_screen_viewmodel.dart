import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/stripe_api.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DepositScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final stripeApi = locator<StripeApi>();
  Map<String, dynamic>? paymentIntent;
  void goBack() {
    _navigationService.back();
  }

  void toInStorePayment() {
    _navigationService.navigateToInStorePaymentScreenView();
  }

  Future<void> createPaymentIntent() async {
    try {
      // Convert the amount to cents

      paymentIntent = await stripeApi.createPaymentIntent(
        amount: '100',
        currency: 'EUR',
      );

      print('Payment Intent: $paymentIntent');
    } catch (e) {
      print('Error creating payment intent: $e');
      // Handle error
    }
  }

  Future<void> processPayment() async {
    if (paymentIntent == null) {
      print('Payment intent is null. Call createPaymentIntent first.');
      return;
    }

    try {
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              merchantDisplayName: 'Fine Found',
            ),
          )
          .then((value) => {});

      await Stripe.instance
          .presentPaymentSheet()
          .then((value) => print("Payment success"));
    } catch (e) {
      print('Error during payment: $e');
      // Handle payment failure
    }
  }

  void toCryptoPayment() {
    _navigationService.navigateToCryptoPaymentScreenView();
  }

  void toCardPayment() {
    _navigationService.navigateToAddNewCardPaymentScreenView();
  }
}
