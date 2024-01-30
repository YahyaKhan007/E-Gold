import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/widgets/creditCardGoldenContainer.dart';
import 'package:e_gold/ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'card_payment_screen_viewmodel.dart';

class CardPaymentScreenView extends StackedView<CardPaymentScreenViewModel> {
  const CardPaymentScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardPaymentScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Enter Amount',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardGoldenContainer(),
            const SizedBox(
              height: 25,
            ),
            // CustomTextField(title: 'Amount', labelText: '',),
            CustomTextField(
              controller: viewModel.amount,
              title: 'Amount',
              labelText: 'Amount in USD (\$)',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: viewModel.cardCurrency,
              title: 'Card Currency',
              labelText: 'USD (\$)',
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Center(
              child: Container(
                width: 236,
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: ShapeDecoration(
                  color: kcYellowBright,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3FF5B119),
                      blurRadius: 8,
                      offset: Offset(2, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CardPaymentScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardPaymentScreenViewModel();
}
