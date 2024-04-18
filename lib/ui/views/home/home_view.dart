import 'dart:ui';

import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/home/home_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/customHomeTransactionRow.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    final ScrollController mainScrollController = ScrollController();

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
            slivers: [
              SliverAppBar(
                // leading: CircleAvatar(
                //   backgroundColor: Colors.black,
                //   backgroundImage: NetworkImage(
                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa-PSsyWm0gWoz9gEe0eUxWoSO04S5QWvBbg&usqp=CAU'),
                // ),
                pinned: true,
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
                expandedHeight: 280, // Set the expanded height
                collapsedHeight: 90, // Set the collapsed height
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding:
                        const EdgeInsets.only(left: 22.0, right: 22, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 00, left: 00, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius:
                                    16, // Adjust the radius to your desired size
                                backgroundImage: viewModel
                                        .userService.user!.profileImg.isNotEmpty
                                    ? NetworkImage(
                                        viewModel.userService.user!.profileImg)
                                    : const AssetImage(profile)
                                        as ImageProvider,
                              ),
                              horizontalSpaceSmall,
                              Expanded(
                                child: Text(
                                  "Hi ${viewModel.userService.user!.name}!",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
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
                        // verticalSpaceSmall,
                        // viewModel.isBusy
                        //     ?
                        // const CircularProgressIndicator()
                        // :
                        // Text(
                        //   "Hi ${viewModel.userService.user!.name}",
                        //   style: const TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 34,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                    'assets/images/gold_ingots_gold_svgrepo_com1.png',
                                    height: 30),
                                const Text(
                                  "  AED ",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.yellow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                viewModel.isBusy
                                    ? const Text(
                                        ' ...  ',
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        currentGoldRate.toStringAsFixed(3),
                                        style: const TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                const Text(
                                  ' per gram',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: true,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/up_arrow_icon.png',
                                    color: kcGreen,
                                  ),
                                  const Text(
                                    ' Up to 5%',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: kcGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/up_arrow_icon.png',
                                    color: kcFailRed,
                                  ),
                                  const Text(
                                    ' Down to 5%',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: kcFailRed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Text(
                            //   "Here's Your Balance",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w100,
                            //       letterSpacing: 2),
                            // ),
                            // verticalSpaceSmall,
                            // Container(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 20, vertical: 8),
                            //   decoration: BoxDecoration(
                            //     color: const Color(0xffFFD4B8),
                            //     borderRadius: BorderRadius.circular(50),
                            //   ),
                            //   child: RichText(
                            //     text: TextSpan(
                            //       text: 'Current Gold rate: ',
                            //       // textAlign: TextAlign.end,
                            //       style: const TextStyle(
                            //         color: Color(0xff2F4A64),
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.normal,
                            //       ),
                            //       children: [
                            //         TextSpan(
                            //           text: currentGoldRate.toString(),
                            //           style: const TextStyle(
                            //             // color: Color(0xff2F4A64),
                            //             color: Colors.black54,
                            //             fontSize: 17,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //         const TextSpan(
                            //           text: ' AED ',
                            //           style: TextStyle(
                            //             // fontStyle: FontStyle.italic,
                            //             color: Color(0xff2F4A64),
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.normal,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        // const Text(
                        //   "Here's Your Balance.",
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 24,
                        //       fontWeight: FontWeight.w100,
                        //       letterSpacing: 2),
                        // ),

                        // ^  Wallet Showing
                        verticalSpaceSmall,
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: size.height * 0.13,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.white),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                                  child: SizedBox(
                                    height: size.height * 0.13,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Wallet",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  "AED  ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  viewModel.balanceService
                                                      .balanceData!.balance
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(right: 30),
                                        //   child: ProgressBar(
                                        //     value: viewModel.calculateResult(
                                        //         passedValue: double.parse(viewModel
                                        //             .balanceService.balanceData!.balance
                                        //             .toString())),
                                        //     backgroundColor: Colors.white,
                                        //     //specify only one: color or gradient
                                        //     color: const Color(0xff00DDA3),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            // horizontalSpaceLarge,
                            horizontalSpaceMedium,
                            Expanded(
                                child: Container(
                              height: size.height * 0.13,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Portfolio",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            " / ",
                                            style: TextStyle(
                                                color: totalMarginProfit >= 0
                                                    ? Colors.yellow
                                                    : Colors.red,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Margin",
                                            style: TextStyle(
                                                color: totalMarginProfit >= 0
                                                    ? Colors.yellow
                                                    : Colors.red,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      FittedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                "AED  ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                (viewModel.userService.user!
                                                            .totalGoldHoldings *
                                                        currentGoldRate)
                                                    .toStringAsFixed(2)
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 35,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                " / ",
                                                style: TextStyle(
                                                    color:
                                                        totalMarginProfit >= 0
                                                            ? Colors.yellow
                                                            : Colors.red,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                totalMarginProfit
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color:
                                                        totalMarginProfit >= 0
                                                            ? Colors.yellow
                                                            : Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(right: 0),
                                      //   child: ProgressBar(
                                      //     value: 0.4,
                                      //     backgroundColor: Colors.white,
                                      //     //specify only one: color or gradient
                                      //     color: Colors.grey,
                                      //   ),
                                      // gradient: LinearGradient(
                                      //   begin: Alignment.topLeft,
                                      //   end: Alignment.bottomRight,
                                      //   colors: [
                                      //     Colors.yellowAccent,
                                      //     Colors.deepOrange
                                      //   ],
                                      // ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
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
                              GestureDetector(
                                onTap: () {
                                  viewModel.changeSelection(selection: 'Bank');
                                },
                                child: transactionTypes(context,
                                    isSelected: viewModel.isSelected == 'Bank',
                                    image: 'assets/images/account_balance.png',
                                    text: 'Bank'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  viewModel.changeSelection(selection: 'Card');
                                },
                                child: transactionTypes(context,
                                    isSelected: viewModel.isSelected == 'Card',
                                    image: 'assets/images/credit_card.png',
                                    text: 'Card'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  viewModel.changeSelection(
                                      selection: 'Crypto');
                                },
                                child: transactionTypes(context,
                                    isSelected:
                                        viewModel.isSelected == 'Crypto',
                                    image: 'assets/images/bitcoin.png',
                                    text: 'Crypto'),
                              ),
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
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  addRepaintBoundaries: true,
                  addAutomaticKeepAlives: true,
                  [
                    viewModel.isSelected == 'Card' &&
                            viewModel.cardTransactions.isEmpty
                        ? Container(
                            color: Colors.white,
                            height: 200,
                            child: Center(
                              child: viewModel.isBusy
                                  ? const CircularProgressIndicator()
                                  : const Text('No Transactions For Card Yet'),
                            ),
                          )
                        : viewModel.isSelected == 'Crypto' &&
                                viewModel.cryptoTransactions.isEmpty
                            ? Container(
                                color: Colors.white,
                                height: 200,
                                child: Center(
                                  child: viewModel.isBusy
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          'No Transactions For Crypto Yet'),
                                ),
                              )
                            : viewModel.isSelected == 'Bank' &&
                                    viewModel.bankTransactions.isEmpty
                                ? Container(
                                    color: Colors.white,
                                    height: 200,
                                    child: Center(
                                      child: viewModel.isBusy
                                          ? const CircularProgressIndicator()
                                          : const Text(
                                              'No Transactions For Bank Yet'),
                                    ),
                                  )
                                : viewModel.isBusy
                                    ? Container(
                                        color: Colors.white,
                                        height: 200,
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        color: Colors.white,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          dragStartBehavior:
                                              DragStartBehavior.down,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: viewModel.isSelected ==
                                                  'Card'
                                              ? viewModel
                                                  .cardTransactions.length
                                              : viewModel.isSelected == 'Crypto'
                                                  ? viewModel
                                                      .cryptoTransactions.length
                                                  : viewModel
                                                      .bankTransactions.length,
                                          itemBuilder: ((context, index) {
                                            return HomeTransactionRow(
                                              // profileLoss: viewModel.,
                                              transactionDetails: viewModel
                                                          .isSelected ==
                                                      'Card'
                                                  ? viewModel
                                                      .cardTransactions[index]
                                                  : viewModel.isSelected ==
                                                          'Crypto'
                                                      ? viewModel
                                                              .cryptoTransactions[
                                                          index]
                                                      : viewModel
                                                              .bankTransactions[
                                                          index],
                                              //  viewModel.cryptoTransactions[index],
                                              buttonText: viewModel
                                                          .isSelected ==
                                                      'Card'
                                                  ? viewModel
                                                      .cardTransactions[index]
                                                      .status
                                                  : viewModel.isSelected ==
                                                          'Crypto'
                                                      ? viewModel
                                                          .cryptoTransactions[
                                                              index]
                                                          .status
                                                      : viewModel
                                                          .bankTransactions[
                                                              index]
                                                          .status,
                                              // viewModel.cryptoTransactions[index].status,
                                              btc: viewModel.isSelected ==
                                                      'Card'
                                                  ? viewModel
                                                      .cardTransactions[index]
                                                      .totalGoldBought
                                                      .toString()
                                                  : viewModel.isSelected ==
                                                          'Crypto'
                                                      ? viewModel
                                                          .cryptoTransactions[
                                                              index]
                                                          .totalGoldBought
                                                          .toString()
                                                      : viewModel
                                                          .bankTransactions[
                                                              index]
                                                          .totalGoldBought
                                                          .toString(),

                                              //  viewModel
                                              //     .cryptoTransactions[index].totalGoldBought
                                              //     .toString(),
                                              image: masterCard,
                                              imageBack: kcYellowBright,
                                              btcColor: kcYellowBright,
                                              onTap: () {},
                                            );
                                          }),
                                        ),
                                      ),
                    Container(
                      color: Colors.white,
                      height: viewModel.isSelected == 'Card' &&
                              viewModel.cardTransactions.length >= 2
                          ? 200
                          : viewModel.isSelected == 'Crypto' &&
                                  viewModel.cryptoTransactions.length >= 2
                              ? 200
                              : viewModel.isSelected == 'Bank' &&
                                      viewModel.bankTransactions.length >= 2
                                  ? 200
                                  : 200,
                    )
                  ],
                ),
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
      {required String image, required String text, required bool isSelected}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
          color: isSelected ? kcButtonBackground : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            color: isSelected ? Colors.grey.shade100 : Colors.black,
            height: 40,
          ),
          verticalSpaceSmall,
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
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
