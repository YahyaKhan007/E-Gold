import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/home/home_viewmodel.dart';
import 'package:e_gold/ui/widgets/LastTransactionsWidget.dart';
import 'package:e_gold/ui/widgets/customHomeMetalButton.dart';
import 'package:e_gold/ui/widgets/homeGoldenContainer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HomeGoldenContainer(
              onPressedNotification: viewModel.notification,
              gold: viewModel.goldContainer,
              silver: viewModel.silverContainer,
            ),

            verticalSpaceSmall,
            SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < 4; i++)
                    HomeMetalButton(
                      containerColor: viewModel.currentPageIndex == i
                          ? const Color(0xFFFFDA00)
                          : const Color(0xFFF5B118),
                      title: i == 0
                          ? 'Crypto'
                          : i == 1
                              ? 'Card'
                              : i == 2
                                  ? 'Bank'
                                  : 'InStore',
                      onTap: () => viewModel.navigateToPage(i),
                    ),
                ],
              ),
            ),

            // PageView
            Expanded(
              child: PageView(
                controller: viewModel.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  LastTransactionsWidget(
                    transactionTypeImage: bitCoin,
                  ),
                  LastTransactionsWidget(
                    transactionTypeImage: masterCard,
                  ),
                  LastTransactionsWidget(
                    transactionTypeImage: bank,
                  ),
                  LastTransactionsWidget(
                    transactionTypeImage: store,
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
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
