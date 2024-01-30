// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';
import 'sellgold_sheet_model.dart';

class SellgoldSheet extends StackedView<SellgoldSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const SellgoldSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  Widget buildTitle(String title, {double fontSize = 20.0}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget buildRadioListItem(
      String title,
      int value,
      double splashRadius,
      BuildContext context,
      SellgoldSheetModel viewModel,
      ) {
    return SizedBox(
      height: 32,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 0.0),
        title: Text(title),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
        minLeadingWidth: 0,
        trailing: Radio<int>(
          value: value,
          groupValue: viewModel.selectedOption,
          activeColor: Colors.yellow,
          fillColor: MaterialStateProperty.all(Colors.yellow),
          splashRadius: splashRadius,
          onChanged: (value) {
            viewModel.selectedOption = value!;
          },
        ),
      ),
    );
  }

  @override
  Widget builder(
      BuildContext context,
      SellgoldSheetModel viewModel,
      Widget? child,
      ) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFFCEBC4), width: 0.5),
      borderRadius: BorderRadius.circular(6.0),
    );

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        width: screenWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          color: Color(0xFFF9D075),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title ?? 'Sell Your Holdings',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            verticalSpaceMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceTiny,
                buildTitle('Amount to sell?', fontSize: 20.0),
                verticalSpaceTiny,
                SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        bottom: 2.0,
                        top: 0.0,
                      ),
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder,
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const VerticalDivider(
                            color: Color(0xffFFDA00),
                            width: 2.0,
                            indent: 4,
                            endIndent: 1.25,
                            thickness: 2.0,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              shape: const BeveledRectangleBorder(),
                              padding: const EdgeInsets.all(2.0),
                              foregroundColor: const Color(0xFF21BF73),
                            ),
                            onPressed: () {},
                            child: const Text('Max'),
                          ),
                          horizontalSpaceMedium,
                          const Text('Available: 1500 (6gm)'),
                        ],
                      ),
                      hintText: '\$500 (2gm)',
                    ),
                    keyboardType: TextInputType.number,
                    controller: viewModel.textEditingController,
                    validator: (value) => null,
                  ),
                ),
                verticalSpaceMedium,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('Select a method'),
                    buildRadioListItem('Crypto', 1, 20, context, viewModel),
                    buildRadioListItem(
                        'Pickup Physical Gold', 2, 25, context, viewModel),
                    verticalSpaceLarge,
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF21BF73),
                          minimumSize: const Size(140.0, 48.0),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Sell',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  SellgoldSheetModel viewModelBuilder(BuildContext context) =>
      SellgoldSheetModel();
}