import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_screen_viewmodel.dart';

class DashboardScreenView extends StackedView<DashboardScreenViewModel> {
  const DashboardScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: IndexedStack(
        index: viewModel.currentPageIndex,
        children: viewModel.pages,
      ),
      bottomNavigationBar: Container(
        color: kcBackgroundColor,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30.0)),
                      child: Container(
                        height: screenHeight(context) * .1,
                        width: screenWidth(context),
                        color: Colors.black,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NavIconsButtons(
                              onPressed: () {
                                viewModel.pageChange(0);
                              },
                              image: dashboard,
                              text: 'Home',
                            ),
                            NavIconsButtons(
                              onPressed: () {
                                viewModel.pageChange(1);
                              },
                              image: history,
                              text: 'History',
                            ),
                            NavIconsButtons(
                              onPressed: () {
                                viewModel.pageChange(2);
                              },
                              image: black,
                              text: '  Buy',
                            ),
                            NavIconsButtons(
                              onPressed: () {
                                viewModel.pageChange(3);
                              },
                              image: sip,
                              text: 'Sip',
                            ),
                            NavIconsButtons(
                              onPressed: () {
                                viewModel.pageChange(4);
                              },
                              image: account,
                              text: 'Account',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 55,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            viewModel.pageChange(2);
                          },
                          icon: Image.asset(buy),
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
  DashboardScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardScreenViewModel();
}

class NavIconsButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  String? text;
  NavIconsButtons({
    super.key,
    required this.onPressed,
    required this.image,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Image.asset(
            image,
            height: 40,
          ),
        ),
        Text(
          text!,
          style: const TextStyle(color: Colors.yellow),
        ),
      ],
    );
  }
}
