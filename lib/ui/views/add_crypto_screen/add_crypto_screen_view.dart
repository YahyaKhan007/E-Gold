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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  AddCryptoScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddCryptoScreenViewModel();
}
