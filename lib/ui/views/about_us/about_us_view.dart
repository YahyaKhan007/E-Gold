import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'about_us_viewmodel.dart';

class AboutUsView extends StackedView<AboutUsViewModel> {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutUsViewModel viewModel,
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
  AboutUsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutUsViewModel();
}
