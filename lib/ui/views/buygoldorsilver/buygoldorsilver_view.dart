import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_viewmodel.dart';
import 'package:e_gold/ui/widgets/buyGoldenContainer.dart';
import 'package:flutter/material.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:stacked/stacked.dart';

class BuyGoldOrSilverView extends StackedView<BuyGoldOrSilverViewModel> {
  const BuyGoldOrSilverView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyGoldOrSilverViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuyGoldenContainer(
              goldCheck: viewModel.gold,
              checkGoldFunc: viewModel.goldVal,
              checkSilverFunc: viewModel.silverVal,
              amount: viewModel.amount,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NumericKeyboard(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
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
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BuyGoldOrSilverViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyGoldOrSilverViewModel();
}
