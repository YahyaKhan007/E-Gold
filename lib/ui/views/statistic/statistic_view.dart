import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/statistic/widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import 'statistic_viewmodel.dart';

class StatisticView extends StackedView<StatisticViewModel> {
  const StatisticView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StatisticViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: kAppBar(
            onButtonPressed: viewModel.onButtonPressed,
            context: context,
            title: const Text('Statistic')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Balance',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black54),
              ),
              verticalSpaceSmall,
              Text(
                '\$1222,4433',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overview',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                      ),
                      const DropdownMenu(
                          width: 120,
                          inputDecorationTheme: InputDecorationTheme(
                              isDense: true,
                              filled: true,
                              fillColor: Colors.amber),
                          initialSelection: 0,
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 0, label: 'Weekly'),
                            DropdownMenuEntry(value: 1, label: 'Monthly'),
                            DropdownMenuEntry(value: 2, label: 'Yearly'),
                          ]),
                    ],
                  ),
                  verticalSpaceLarge,
                  const KBarChart(weeklySummary: [
                    {
                      'expanse': 2000.0,
                      'income': 1500.0,
                    },
                    {
                      'expanse': 2000.0,
                      'income': 1200.0,
                    },
                    {
                      'expanse': 2000.0,
                      'income': 1000.0,
                    },
                    {
                      'expanse': 2000.0,
                      'income': 1000.0,
                    },
                    {
                      'expanse': 2000.0,
                      'income': 1000.0,
                    },
                    {
                      'expanse': 2000.0,
                      'income': 1000.0,
                    },
                    {
                      'expanse': 2000.0,
                      'income': 1000.0,
                    },
                  ], maxYValue: 2000, minYValue: 1000)
                ],
              ),
              verticalSpaceMedium,
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 56)),
                  child: const Text('Buy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  StatisticViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StatisticViewModel();
}
