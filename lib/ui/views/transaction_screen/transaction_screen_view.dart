import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customAddPaymentMethod.dart';
import 'package:e_gold/ui/widgets/customTransactionScreenContainerRow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'transaction_screen_viewmodel.dart';

class TransactionScreenView extends StackedView<TransactionScreenViewModel> {
  const TransactionScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TransactionScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Deposit Successful',
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Your funds are now available for use',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  saly,
                  height: MediaQuery.of(context).size.height * .3,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'USD 500.00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.32,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AddPaymentMethod(
                image: store,
                title: 'Successfully Paid to E-Gold',
                text: '24 Nov 2022, 1:43 PM',
                onPressed: () {},
                icon: false,
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                height: 148,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 8,
                      offset: Offset(2, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransactionScreenContainerRow(
                      text1: 'Reference ID',
                      text2: 'PRN23456',
                    ),
                    TransactionScreenContainerRow(
                      text1: 'Payment Method',
                      text2: 'Mastercard ending 1213',
                    ),
                    TransactionScreenContainerRow(
                      text1: 'Updated balance',
                      text2: '\$1000',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 236,
                    height: 48,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
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
                        'View Transaction',
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
              const SizedBox(
                height: 16,
              ),
              Center(
                child: GestureDetector(
                  onTap: viewModel.backToHome,
                  child: Container(
                    width: 236,
                    height: 48,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
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
                        'Back to Home',
                        style: TextStyle(
                          color: Colors.black,
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
      ),
    );
  }

  @override
  TransactionScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactionScreenViewModel();
}
