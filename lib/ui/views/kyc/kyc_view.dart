import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import 'kyc_viewmodel.dart';

class KycView extends StackedView<KycViewModel> {
  const KycView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Column(
      children: [
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(viewModel.pages.length, (int index) {
            return GestureDetector(
              onTap: () {
                viewModel.pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: viewModel.currentPage == index
                      ? Colors.white
                      : Colors.black,
                ),
                child: Center(child: Text('${index + 1}')),
              ),
            );
          }),
        ),
        Expanded(
          child: PageView(
              controller: viewModel.pageController,
              onPageChanged: viewModel.onPageChanged,
              children: viewModel.pages),
        ),
        const SizedBox(height: 16),
      ],
    ));
  }

  @override
  KycViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycViewModel();

  @override
  void onViewModelReady(KycViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
