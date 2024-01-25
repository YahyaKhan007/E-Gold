import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'in_store_payment_screen_viewmodel.dart';

class InStorePaymentScreenView
    extends StackedView<InStorePaymentScreenViewModel> {
  const InStorePaymentScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InStorePaymentScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'In-Store Payment',
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
            Row(
              children: [
                Image.asset(profile),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Make a payment at the store',
                      style: TextStyle(
                        color: kcLightText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Select In-Store Payment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Unique ID',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
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
                      'E-Gold-1312-3126-2411-2312',
                      style: TextStyle(
                        color: kcLightText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0.16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Visit Physical Store',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(logo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Instructions:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: Text(
                        'Visit the store and show the \ngenerated unique ID to the cashier.',
                        style: TextStyle(
                          color: kcLightText,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  InStorePaymentScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InStorePaymentScreenViewModel();
}
