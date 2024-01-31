import 'package:flutter/material.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'buy_dialog_dialog_model.dart';

const double _graphicSize = 60;

class BuyDialogDialog extends StackedView<BuyDialogDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BuyDialogDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyDialogDialogModel viewModel,
    Widget? child,
  ) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(20.0),
      children: [
        SimpleDialogOption(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to buy x amount of gold for amount \$${request.data}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => viewModel.cancel(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kcBackgroundColor),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: viewModel.confirm,
                      child: const Text('Confirm'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  BuyDialogDialogModel viewModelBuilder(BuildContext context) =>
      BuyDialogDialogModel(amount: request.data);
}
