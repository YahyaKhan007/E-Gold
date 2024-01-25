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
    final List<Map<String, dynamic>> dropdownData = [
      {'text': 'Weekly', 'value': 1},
      {'text': 'Monthly', 'value': 2},
      {'text': 'Year', 'value': 3},
    ];

    var dataYear = [
      ExpenseIncomeModel(dataOf: 'Jan', expenses: 500, income: 1000.500),
      ExpenseIncomeModel(dataOf: 'Feb', expenses: 600, income: 1000),
      ExpenseIncomeModel(dataOf: 'Mar', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'April', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'May', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Jun', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Jul', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Aug', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Sep', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Oct', expenses: 70, income: 1000),
      ExpenseIncomeModel(dataOf: 'Nov', expenses: 50, income: 1000),
      ExpenseIncomeModel(dataOf: 'Dec', expenses: 80, income: 1000),
    ];

    var dataMonth = [
      ExpenseIncomeModel(dataOf: '1', expenses: 500, income: 1000.500),
      ExpenseIncomeModel(dataOf: '2', expenses: 600, income: 1000),
      ExpenseIncomeModel(dataOf: '3', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '4', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '5', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '6', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '7', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '8', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '9', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '10', expenses: 70, income: 1000),
      ExpenseIncomeModel(dataOf: '11', expenses: 50, income: 1000),
      ExpenseIncomeModel(dataOf: '12', expenses: 80, income: 1000),
      ExpenseIncomeModel(dataOf: '1', expenses: 500, income: 1000.500),
      ExpenseIncomeModel(dataOf: '2', expenses: 600, income: 1000),
      ExpenseIncomeModel(dataOf: '3', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '4', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '5', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '6', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '7', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '8', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '9', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: '10', expenses: 70, income: 1000),
      ExpenseIncomeModel(dataOf: '11', expenses: 50, income: 1000),
      ExpenseIncomeModel(dataOf: '12', expenses: 80, income: 1000),
      ExpenseIncomeModel(dataOf: '10', expenses: 70, income: 1000),
      ExpenseIncomeModel(dataOf: '11', expenses: 50, income: 1000),
      ExpenseIncomeModel(dataOf: '12', expenses: 80, income: 1000),
    ];

    var dataWeek = [
      ExpenseIncomeModel(dataOf: 'Mon', expenses: 500, income: 1000.500),
      ExpenseIncomeModel(dataOf: 'Tue', expenses: 600, income: 1000),
      ExpenseIncomeModel(dataOf: 'Wed', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Thu', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Fri', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Sat', expenses: 700, income: 1000),
      ExpenseIncomeModel(dataOf: 'Sun', expenses: 700, income: 1000),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: kAppBar(
            onButtonPressed: viewModel.onButtonPressed,
            context: context,
            title: const Text('Statistic')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
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
                      SizedBox(
                        width: 108,
                        height: 48,
                        child: DropdownButtonFormField<dynamic>(
                          isDense: true,
                          value: viewModel.selectedValue,
                          dropdownColor: Colors.amber,
                          borderRadius: BorderRadius.circular(8.0),
                          padding: const EdgeInsets.all(0),
                          style: const TextStyle(fontSize: 12.0),
                          decoration: const InputDecoration(
                            isDense: true,
                            fillColor: Colors.amber,
                            iconColor: Colors.white,
                          ),
                          hint: Text(
                            viewModel.selectedValue.toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          items: dropdownData.map((data) {
                            return DropdownMenuItem<dynamic>(
                                value: data['value'],
                                child: Text(
                                  data['text'].toString(),
                                ));
                          }).toList(),
                          onChanged: viewModel.onButtonPressedDropDown,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceLarge,
                  KBarChart(
                      data: viewModel.selectedValue == 1
                          ? dataWeek
                          : viewModel.selectedValue == 2
                              ? dataMonth
                              : dataYear,
                      maxYValue: 1500,
                      minYValue: 0)
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
