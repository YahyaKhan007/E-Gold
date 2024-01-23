import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/addCryptoGoldenContainer1.dart';
import 'package:e_gold/ui/widgets/addCryptoGoldenContainer2.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_crypto_screen_viewmodel.dart';

class AddCryptoScreenView extends StackedView<AddCryptoScreenViewModel> {
  const AddCryptoScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddCryptoScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Crypto',
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AddCryptoGoldenContainer1(),
            const AddCryptoGoldenContainer2(),
            Center(
              child: GestureDetector(
                onTap: viewModel.viewTransaction,
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
          ],
        ),
      ),
    );
  }

  @override
  AddCryptoScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddCryptoScreenViewModel();
}
