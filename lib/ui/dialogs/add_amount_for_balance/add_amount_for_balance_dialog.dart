import 'package:e_gold/ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_amount_for_balance_dialog_model.dart';

const double _graphicSize = 60;

class AddAmountForBalanceDialog
    extends StackedView<AddAmountForBalanceDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddAmountForBalanceDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddAmountForBalanceDialogModel viewModel,
    Widget? child,
  ) {
    return SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // backgroundColor: Colors.white,
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(20.0),
        children: [
          SimpleDialogOption(
            child: Form(
              key: viewModel.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    title: 'Amount',
                    controller: viewModel.amount,
                    keyboardType: TextInputType.number,
                    validator: viewModel.customValidator,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => viewModel.cancel(context),
                          child: Container(
                            // width: 150,
                            width: screenWidth(context) * 0.35,

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
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth(context) * 0.035,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        horizontalSpaceMedium,
                        GestureDetector(
                          onTap: () => viewModel.addBalance(context),
                          child: Container(
                            width: screenWidth(context) * 0.35,
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
                            child: Center(
                              child: Text(
                                'Add Balance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth(context) * 0.035,
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
          ),
        ]);
  }

  @override
  AddAmountForBalanceDialogModel viewModelBuilder(BuildContext context) =>
      AddAmountForBalanceDialogModel(data: request.data);
}
