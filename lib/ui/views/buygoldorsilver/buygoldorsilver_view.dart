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
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 44,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: kcLightText),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: kcBackgroundColor,
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'Enter text here',
                            style: TextStyle(
                              color: kcLightText,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
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
                          'Next',
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
