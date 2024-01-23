import 'package:e_gold/ui/widgets/lineChartSilver.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import 'sliverbalancehistory_viewmodel.dart';

class SliverbalancehistoryView
    extends StackedView<SliverbalancehistoryViewModel> {
  const SliverbalancehistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SliverbalancehistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
              color: Colors.amber,
              height: screenHeight(context) * 0.28,
              width: screenWidth(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: viewModel.goBack,
                  ),
                  SizedBox(
                    width: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("My Silver",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontWeight: FontWeight.w600)),
                        verticalSpaceLarge,
                        Text(
                          "Your Sliver Balance",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "\$1290.000",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            KLineChart(
              gradientColors: [Colors.grey.shade400, Colors.grey.shade500],
              lineChartHeading: 'Silver Balance History',
            ),
            verticalSpaceLarge,
            ElevatedButton(onPressed: () {}, child: const Text('Buy'))
          ],
        ),
      ),
    );
  }

  @override
  SliverbalancehistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SliverbalancehistoryViewModel();
}
