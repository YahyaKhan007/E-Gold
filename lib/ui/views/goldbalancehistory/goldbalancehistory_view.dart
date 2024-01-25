import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/goldbalancehistory/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'goldbalancehistory_viewmodel.dart';

class GoldbalancehistoryView extends StackedView<GoldbalancehistoryViewModel> {
  const GoldbalancehistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GoldbalancehistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: kAppBar(
        context: context,
        onButtonPressed: () {},
        title: Text(
          "My Gold",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
              color: Colors.amber,
              height: 100,
              width: screenWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Gold Balance",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w300),
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
            KLineChart(
              data: [
                ChartDataModel(timePeriod: 'Jan', value: 20),
                ChartDataModel(timePeriod: 'Feb', value: 40),
                ChartDataModel(timePeriod: 'Mar', value: 60),
                ChartDataModel(timePeriod: 'Apr', value: 80),
                ChartDataModel(timePeriod: 'May', value: 50),
                ChartDataModel(timePeriod: 'Jun', value: 30),
              ],
              maxYValue: 150,
            ),
            verticalSpaceLarge,
            ElevatedButton(onPressed: () {}, child: const Text('Buy'))
          ],
        ),
      ),
    );
  }

  @override
  GoldbalancehistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GoldbalancehistoryViewModel();
}
