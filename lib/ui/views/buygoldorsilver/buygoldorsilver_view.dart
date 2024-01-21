import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buygoldorsilver_viewmodel.dart';

class BuygoldorsilverView extends StackedView<BuygoldorsilverViewModel> {
  const BuygoldorsilverView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuygoldorsilverViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: kAppBar(
          backgroundColor: Colors.amber,
          appBarHeight: 180,
          toolbarHeight: 180,
          context: context,
          onButtonPressed: () {},
          title: Column(
            children: [
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[400],
                          foregroundColor: Colors.black),
                      onPressed: viewModel.onGoldButtonPressed,
                      child: const Text('Gold'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black),
                      onPressed: viewModel.onSilverButtonPressed,
                      child: const Text('Silver'),
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,
              const Text("I am buying Silver")
            ],
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: PageView(
                controller: viewModel.pageController,
                onPageChanged: (int page) {},
                children: const [
                  // Page 1
                  Center(
                    child: Text('Page 1'),
                  ),
                  // Page 2
                  Center(
                    child: Text('Page 2'),
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
  BuygoldorsilverViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuygoldorsilverViewModel();
}
