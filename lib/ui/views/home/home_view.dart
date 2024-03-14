import 'dart:developer';

import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/home/home_viewmodel.dart';
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart';
import 'package:e_gold/ui/widgets/customHomeMetalButton.dart';
import 'package:e_gold/ui/widgets/homeGoldenContainer.dart';
import 'package:e_gold/ui/widgets/lastTransactionsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../models/transactionDetails.dart';
import '../../widgets/customHomeTransactionRow.dart';
import '../transactiondetails/transactiondetails_view.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final ScrollController mainScrollController = ScrollController();

    List<Widget> transactionRows = [];
    for (int i = 0; i < viewModel.cryptoTransactions.length; i++) {
      TransactionDetails transaction = viewModel.cryptoTransactions[i];

      // Add HomeTransactionRow
      transactionRows.add(
        HomeTransactionRow(
          transactionDetails: transaction,
          buttonText: transaction.status,
          btc: transaction.totalGoldBought.toString(),
          image: masterCard,
          imageBack: kcYellowBright,
          btcColor: kcYellowBright,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransactiondetailsView(
                  transactionDetails: transaction,
                ),
              ),
            );
          },
        ),
      );

      // Add separator except for the last item
      if (i < viewModel.cardTransactions.length - 1) {
        transactionRows.add(verticalSpaceSmall);
      }
    }

    log(transactionRows.length.toString());
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back_home.png'),
                  fit: BoxFit.cover)),
          child: CustomScrollView(
            controller: mainScrollController,
            physics: const PageScrollPhysics(
                // parent: PageScrollPhysics(),
                ),
            slivers: [
              SliverAppBar(
                // leading: CircleAvatar(
                //   backgroundColor: Colors.black,
                //   backgroundImage: NetworkImage(
                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa-PSsyWm0gWoz9gEe0eUxWoSO04S5QWvBbg&usqp=CAU'),
                // ),
                pinned: false,
                // excludeHeaderSemantics: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: true,
                foregroundColor: Colors.white,
                // primary: false,
                // scrolledUnderElevation: 2,
                // title: Text(
                //   'Hi, Azeem!',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                expandedHeight: 250, // Set the expanded height
                collapsedHeight: 80, // Set the collapsed height
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 00, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black,
                                  backgroundImage:
                                      AssetImage('assets/images/profile.png')),
                              GestureDetector(
                                onTap: viewModel.notification,
                                child: Image.asset(
                                  'assets/images/wallet.png',
                                  height: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                        verticalSpaceSmall,
                        viewModel.isBusy
                            ? CircularProgressIndicator()
                            : Text(
                                "Hi ${viewModel.userService.user!.name}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        const Text(
                          "Here's Your Balance.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 2),
                        ),

                        // ^  Wallet Showing
                        verticalSpaceMedium,
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Wallet",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "\$",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          viewModel.balanceService.balanceData!
                                              .balance
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: ProgressBar(
                                        value: 0.8,
                                        backgroundColor: Colors.white,
                                        //specify only one: color or gradient
                                        color: Color(0xff00DDA3),
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Portfolio",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "\$",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "9,615",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: ProgressBar(
                                        value: 0.4,
                                        backgroundColor: Colors.white,
                                        //specify only one: color or gradient
                                        color: Colors.grey,
                                      ),
                                      // gradient: LinearGradient(
                                      //   begin: Alignment.topLeft,
                                      //   end: Alignment.bottomRight,
                                      //   colors: [
                                      //     Colors.yellowAccent,
                                      //     Colors.deepOrange
                                      //   ],
                                      // ),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceMedium,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              transactionTypes(context,
                                  image: 'assets/images/bitcoin.png',
                                  text: 'Crypto'),
                              transactionTypes(context,
                                  image: 'assets/images/credit_card.png',
                                  text: 'Card'),
                              transactionTypes(context,
                                  image: 'assets/images/account_balance.png',
                                  text: 'Bank'),
                            ],
                          ),
                          verticalSpaceMedium,
                          const Text(
                            "Transactions",
                            style: TextStyle(
                                color: Color(0xff33404F),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          // for (int i = 1; i < 25; i++)
                          //   const ListTile(
                          //     leading: CircleAvatar(),
                          //     title: Text("Dummy Person"),
                          //   )
                          // LastTransactionsWidget(
                          //                     transactions: viewModel.cardTransactions,
                          //                     transactionTypeImage: masterCard,
                          //                   ),
                          transactionRows.isEmpty
                              ? const SizedBox(
                                  height: 300,
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                          ...transactionRows
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),

        //  FutureBuilder(
        // future: viewModel.metalPriceService.fetchData(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else {
        //       // Map<String, dynamic>? metalPrices = snapshot.data;
        //       // Use metalPrices data to display information in your app
        //       return Column(
        //         children: [
        // HomeGoldenContainer(
        //             goldPrice:
        //                 // metalPrices?['price']?.toString() ??
        //                 'N/A',
        //             onPressedNotification: viewModel.notification,
        //             gold: viewModel.goldContainer,
        //             silver: viewModel.silverContainer,
        //           ),

        //           verticalSpaceMedium,
        //           SizedBox(
        //             height: 48,
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 for (var i = 0; i < 4; i++)
        //                   HomeMetalButton(
        //                     containerColor: viewModel.currentPageIndex == i
        //                         ? kcButtonBackground
        //                         : kcLightButtonBackground,
        //                     title: i == 0
        //                         ? 'Crypto'
        //                         : i == 1
        //                             ? 'Card'
        //                             : i == 2
        //                                 ? 'Bank'
        //                                 : 'InStore',
        //                     onTap: () => viewModel.navigateToPage(i),
        //                   ),
        //               ],
        //             ),
        //           ),

        //           // PageView
        //           Expanded(
        //             child: Padding(
        //               padding: EdgeInsets.only(right: width * 0.01),
        //               child: PageView(
        //                 controller: viewModel.pageController,
        //                 physics: const NeverScrollableScrollPhysics(),
        //                 children: [
        //                   LastTransactionsWidget(
        //                     onTapSeeAll: () {
        //                       Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (builder) =>
        //                                   const TransactionHistoryScreenView(
        //                                     check: true,
        //                                   )));
        //                     },
        //                     onTapSell: viewModel.onTapSell,
        //                     transactions: viewModel.cryptoTransactions,
        //                     transactionTypeImage: bitCoin,
        //                   ),
        // LastTransactionsWidget(
        //                     transactions: viewModel.cardTransactions,
        //                     transactionTypeImage: masterCard,
        //                   ),
        //                   LastTransactionsWidget(
        //                     transactions: viewModel.bankTransactions,
        //                     transactionTypeImage: bank,
        //                   ),
        //                   LastTransactionsWidget(
        //                     transactions: viewModel.inStoreTransactions,
        //                     transactionTypeImage: store,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }

  Widget transactionTypes(BuildContext context,
      {required String image, required String text}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          verticalSpaceSmall,
          Text(
            text,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
