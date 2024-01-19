import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/views/home/home_viewmodel.dart';
import 'package:e_gold/ui/widgets/customHomeMetalButton.dart';
import 'package:e_gold/ui/widgets/customHomeTransactionRow.dart';
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
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeGoldenContainer(),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeMetalButton(
                          containerColor: kcYellowBright,
                          title: 'Gold',
                        ),
                        HomeMetalButton(
                          containerColor: kcSilverLight,
                          title: 'Silver',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last Transactions',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: kcYellowBright,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        HomeTransactionRow(
                          buttonColor: kcSuccessGreen,
                          buttonText: 'Completed',
                          btc: '+0.001',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HomeTransactionRow(
                          buttonColor: kcFailRed,
                          buttonText: 'Failed',
                          btc: '-0.001',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HomeTransactionRow(
                          buttonColor: kcPendingGrey,
                          buttonText: 'Pending',
                          btc: '-0.001',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HomeTransactionRow(
                          buttonColor: kcPendingGrey,
                          buttonText: 'Pending',
                          btc: '-0.001',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
