import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_viewmodel.dart';
import 'package:e_gold/ui/widgets/buyGoldenContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:stacked/stacked.dart';

class BuyGoldOrSilverView extends StackedView<BuyGoldOrSilverViewModel> {
  final String balance;
  final String margin;
  final String withdrawMethod;
  const BuyGoldOrSilverView(
      {Key? key,
      required this.balance,
      required this.margin,
      required this.withdrawMethod})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyGoldOrSilverViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFB3E5FC), // Light blue
                Color(0xFFE1F5FE), // Lighter blue
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BuyGoldenContainer(
                  onBack: viewModel.onBack,
                  balance: viewModel.balance,
                  margin: viewModel.margin,
                  goldCheck: viewModel.gold,
                  checkGoldFunc: viewModel.goldVal,
                  checkSilverFunc: viewModel.silverVal,
                  amount: viewModel.amount,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NumericKeyboard(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1.28,
                            ),
                            rightIcon: const Icon(
                              Icons.backspace_outlined,
                            ),
                            onKeyboardTap: (String text) {
                              viewModel.onKeyboardTap(text);
                            },
                            rightButtonFn: viewModel.rightButtonfn,
                            rightButtonLongPressFn: viewModel.rightButtonLongfn,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          GestureDetector(
                            onTap: viewModel.toContinue,
                            child: Center(
                              child: Container(
                                width: 236,
                                height: 48,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                decoration: ShapeDecoration(
                                  color: kcButtonBackground,
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
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  BuyGoldOrSilverViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyGoldOrSilverViewModel(this.balance, this.margin, this.withdrawMethod);
}
