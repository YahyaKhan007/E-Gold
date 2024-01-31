import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_new_card_payment_screen_viewmodel.dart';

class AddNewCardPaymentScreenView
    extends StackedView<AddNewCardPaymentScreenViewModel> {
  const AddNewCardPaymentScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddNewCardPaymentScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add a New Card',
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
          children: [
            CustomTextField(
              title: 'Card number',
              controller: viewModel.cardNumber,
              labelText: '',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  title: 'Expiry Date',
                  width: MediaQuery.of(context).size.width * .5,
                  keyboardType: TextInputType.number,
                  controller: viewModel.expiryDate,
                ),
                CustomTextField(
                  title: 'CVV',
                  width: MediaQuery.of(context).size.width * .3,
                  keyboardType: TextInputType.number,
                  maxLenght: 3,
                  controller: viewModel.cvv,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              title: 'Name on Card',
              keyboardType: TextInputType.text,
              controller: viewModel.nameOnCard,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Center(
              child: GestureDetector(
                onTap: viewModel.pressContinue,
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  AddNewCardPaymentScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddNewCardPaymentScreenViewModel();
}
