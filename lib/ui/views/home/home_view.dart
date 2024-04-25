import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';
import '../choose_payment_method/choose_payment_method_view.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kcAppBackgroundColor,
        body: Container(
            height: size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back_home.png'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  topRow(viewModel),
                  goldenContainer(viewModel, size),
                  verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: walletTypes(viewModel, size),
                  ),
                  verticalSpaceMedium,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChoosePaymentMethodView(
                            showBack: true,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 48,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: kcProfitColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/gold_icon.png',
                            scale: 2.5,
                          ),
                          horizontalSpaceSmall,
                          const Text(
                            "BUY GOLD",
                            style: TextStyle(
                                fontSize: 15,
                                color: kcTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )

            //  CustomScrollView(
            //   controller: mainScrollController,
            //   slivers: [

            //     SliverAppBar(
            //       // leading: CircleAvatar(
            //       //   backgroundColor: Colors.black,
            //       //   backgroundImage: NetworkImage(
            //       //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa-PSsyWm0gWoz9gEe0eUxWoSO04S5QWvBbg&usqp=CAU'),
            //       // ),
            //       pinned: true,
            //       // excludeHeaderSemantics: true,
            //       backgroundColor: Colors.transparent,
            //       elevation: 0,
            //       automaticallyImplyLeading: true,
            //       foregroundColor: Colors.white,
            //       // primary: false,
            //       // scrolledUnderElevation: 2,
            //       // title: Text(
            //       //   'Hi, Azeem!',
            //       //   style: TextStyle(
            //       //     color: Colors.white,
            //       //     fontSize: 24,
            //       //     fontWeight: FontWeight.bold,
            //       //   ),
            //       // ),
            //       expandedHeight: 500, // Set the expanded height
            //       collapsedHeight: 90, // Set the collapsed height
            //       flexibleSpace: FlexibleSpaceBar(
            //         background: Padding(
            //           padding:
            //               const EdgeInsets.only(left: 22.0, right: 22, top: 10),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               // Padding(
            //               //   padding: const EdgeInsets.only(
            //               //       top: 10, bottom: 00, left: 00, right: 0),
            //               //   child: Row(
            //               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               //     children: [
            //               //       CircleAvatar(
            //               //         radius:
            //               //             16, // Adjust the radius to your desired size
            //               //         backgroundImage: viewModel
            //               //                 .userService.user!.profileImg.isNotEmpty
            //               //             ? NetworkImage(
            //               //                 viewModel.userService.user!.profileImg)
            //               //             : const AssetImage(profile)
            //               //                 as ImageProvider,
            //               //       ),
            //               //       horizontalSpaceSmall,
            //               //       Expanded(
            //               //         child: Text(
            //               //           "Hi ${viewModel.userService.user!.name}!",
            //               //           style: const TextStyle(
            //               //             color: Colors.white,
            //               //             fontSize: 18,
            //               //             fontWeight: FontWeight.normal,
            //               //           ),
            //               //         ),
            //               //       ),
            //               //       GestureDetector(
            //               //         onTap: viewModel.notification,
            //               //         child: Image.asset(
            //               //           'assets/images/wallet.png',
            //               //           height: 20,
            //               //         ),
            //               //       )
            //               //     ],
            //               //   ),
            //               // ),
            //               // verticalSpaceSmall,
            //               // viewModel.isBusy
            //               //     ?
            //               // const CircularProgressIndicator()
            //               // :
            //               // Text(
            //               //   "Hi ${viewModel.userService.user!.name}",
            //               //   style: const TextStyle(
            //               //     color: Colors.white,
            //               //     fontSize: 34,
            //               //     fontWeight: FontWeight.bold,
            //               //   ),
            //               // ),
            //               Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Row(
            //                     mainAxisSize: MainAxisSize.min,
            //                     // mainAxisAlignment: MainAxisAlignment.end,
            //                     // crossAxisAlignment: CrossAxisAlignment.end,
            //                     children: [
            //                       Image.asset(
            //                           'assets/images/gold_ingots_gold_svgrepo_com1.png',
            //                           height: 30),
            //                       const Text(
            //                         "  AED ",
            //                         style: TextStyle(
            //                             fontStyle: FontStyle.normal,
            //                             color: Colors.yellow,
            //                             fontSize: 30,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                       viewModel.isBusy
            //                           ? const Text(
            //                               ' ...  ',
            //                               style: TextStyle(
            //                                   color: Colors.yellow,
            //                                   fontSize: 30,
            //                                   fontWeight: FontWeight.bold),
            //                             )
            //                           : Text(
            //                               currentGoldRate.toStringAsFixed(2),
            //                               style: const TextStyle(
            //                                   color: Colors.yellow,
            //                                   fontSize: 50,
            //                                   fontWeight: FontWeight.bold),
            //                             ),
            //                       const Text(
            //                         ' per gram',
            //                         style: TextStyle(
            //                             color: Colors.yellow,
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                     ],
            //                   ),
            //                   Visibility(
            //                     visible: true,
            //                     child: Row(
            //                       children: [
            //                         goldPercent >= 0
            //                             ? Image.asset(
            //                                 'assets/images/up_arrow_icon.png',
            //                                 color: kcGreen,
            //                               )
            //                             : Transform.rotate(
            //                                 angle: 3.14,
            //                                 child: Image.asset(
            //                                   'assets/images/up_arrow_icon.png',
            //                                   color: Colors.red.shade700,
            //                                 ),
            //                               ),
            //                         Text(
            //                           // ' Up to 5%',
            //                           " ${goldPercent >= 0 ? 'Up ' : 'Down '} ${goldPercent.toStringAsFixed(2).toString()} %",

            //                           style: TextStyle(
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.bold,
            //                             color: goldPercent >= 0
            //                                 ? kcGreen
            //                                 : Colors.red.shade700,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   Visibility(
            //                     visible: false,
            //                     child: Row(
            //                       children: [
            //                         Image.asset(
            //                           'assets/images/up_arrow_icon.png',
            //                           color: kcFailRed,
            //                         ),
            //                         const Text(
            //                           ' Down to 5%',
            //                           style: TextStyle(
            //                             fontSize: 15,
            //                             color: kcFailRed,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   // const Text(
            //                   //   "Here's Your Balance",
            //                   //   style: TextStyle(
            //                   //       color: Colors.white,
            //                   //       fontSize: 14,
            //                   //       fontWeight: FontWeight.w100,
            //                   //       letterSpacing: 2),
            //                   // ),
            //                   // verticalSpaceSmall,
            //                   // Container(
            //                   //   padding: const EdgeInsets.symmetric(
            //                   //       horizontal: 20, vertical: 8),
            //                   //   decoration: BoxDecoration(
            //                   //     color: const Color(0xffFFD4B8),
            //                   //     borderRadius: BorderRadius.circular(50),
            //                   //   ),
            //                   //   child: RichText(
            //                   //     text: TextSpan(
            //                   //       text: 'Current Gold rate: ',
            //                   //       // textAlign: TextAlign.end,
            //                   //       style: const TextStyle(
            //                   //         color: Color(0xff2F4A64),
            //                   //         fontSize: 14,
            //                   //         fontWeight: FontWeight.normal,
            //                   //       ),
            //                   //       children: [
            //                   //         TextSpan(
            //                   //           text: currentGoldRate.toString(),
            //                   //           style: const TextStyle(
            //                   //             // color: Color(0xff2F4A64),
            //                   //             color: Colors.black54,
            //                   //             fontSize: 17,
            //                   //             fontWeight: FontWeight.bold,
            //                   //           ),
            //                   //         ),
            //                   //         const TextSpan(
            //                   //           text: ' AED ',
            //                   //           style: TextStyle(
            //                   //             // fontStyle: FontStyle.italic,
            //                   //             color: Color(0xff2F4A64),
            //                   //             fontSize: 14,
            //                   //             fontWeight: FontWeight.normal,
            //                   //           ),
            //                   //         ),
            //                   //       ],
            //                   //     ),
            //                   //   ),
            //                   // ),
            //                 ],
            //               ),
            //               // const Text(
            //               //   "Here's Your Balance.",
            //               //   style: TextStyle(
            //               //       color: Colors.white,
            //               //       fontSize: 24,
            //               //       fontWeight: FontWeight.w100,
            //               //       letterSpacing: 2),
            //               // ),
            //               verticalSpaceSmall,
            //               // ^  Wallet Showing
            //               verticalSpaceSmall,
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   Expanded(
            //                       child: Container(
            //                     height: size.height * 0.17,
            //                     decoration: BoxDecoration(
            //                         // border: Border.all(color: Colors.white),
            //                         // color: kcButtonBackground,
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(15),
            //                         boxShadow: [
            //                           BoxShadow(
            //                             blurRadius: 3,
            //                             spreadRadius: 0.5,
            //                             color: Colors.black38.withOpacity(0.4),
            //                           )
            //                         ]),
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(15),
            //                       child:
            //                           //  BackdropFilter(
            //                           //   filter:
            //                           //       ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            //                           //   child:
            //                           SizedBox(
            //                         height: size.height * 0.17,
            //                         child: Column(
            //                           mainAxisAlignment: MainAxisAlignment.center,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.center,
            //                           children: [
            //                             const Text(
            //                               "Wallet",
            //                               style: TextStyle(
            //                                   color: kcGreen,
            //                                   fontSize: 14,
            //                                   fontWeight: FontWeight.bold),
            //                             ),
            //                             verticalSpaceSmall,
            //                             FittedBox(
            //                               child: Padding(
            //                                 padding: const EdgeInsets.symmetric(
            //                                     horizontal: 8),
            //                                 child: Row(
            //                                   mainAxisSize: MainAxisSize.min,
            //                                   children: [
            //                                     const Text(
            //                                       "AED  ",
            //                                       style: TextStyle(
            //                                           color: Colors.black,
            //                                           fontSize: 14,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     ),
            //                                     Text(
            //                                       viewModel.balanceService
            //                                           .balanceData!.balance
            //                                           .toString(),
            //                                       style: const TextStyle(
            //                                           color: Colors.black,
            //                                           fontSize: 14,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ),
            //                             // Padding(
            //                             //   padding: const EdgeInsets.only(right: 30),
            //                             //   child: ProgressBar(
            //                             //     value: viewModel.calculateResult(
            //                             //         passedValue: double.parse(viewModel
            //                             //             .balanceService.balanceData!.balance
            //                             //             .toString())),
            //                             //     backgroundColor: Colors.white,
            //                             //     //specify only one: color or gradient
            //                             //     color: const Color(0xff00DDA3),
            //                             //   ),
            //                             // ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                     // ),
            //                   )),
            //                   // horizontalSpaceLarge,
            //                   horizontalSpaceMedium,
            //                   // Expanded(
            //                   //     child: Container(
            //                   //   height: size.height * 0.13,
            //                   //   decoration: BoxDecoration(
            //                   //     // border: Border.all(color: Colors.white),
            //                   //     borderRadius: BorderRadius.circular(15),
            //                   //   ),
            //                   //   child: ClipRRect(
            //                   //     borderRadius: BorderRadius.circular(15),
            //                   //     child: BackdropFilter(
            //                   //       filter:
            //                   //           ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            //                   //       child: Column(
            //                   //         mainAxisAlignment: MainAxisAlignment.center,
            //                   //         crossAxisAlignment:
            //                   //             CrossAxisAlignment.center,
            //                   //         children: [
            //                   //           Row(
            //                   //             mainAxisAlignment:
            //                   //                 MainAxisAlignment.center,
            //                   //             crossAxisAlignment:
            //                   //                 CrossAxisAlignment.center,
            //                   //             children: [
            //                   //               const Text(
            //                   //                 "Portfolio",
            //                   //                 style: TextStyle(
            //                   //                     color: Colors.white,
            //                   //                     fontSize: 14,
            //                   //                     fontWeight: FontWeight.bold),
            //                   //               ),
            //                   //               Text(
            //                   //                 " / ",
            //                   //                 style: TextStyle(
            //                   //                     color: totalMarginProfit >= 0
            //                   //                         ? Colors.yellow
            //                   //                         : Colors.red,
            //                   //                     fontSize: 12,
            //                   //                     fontWeight: FontWeight.bold),
            //                   //               ),
            //                   //               Text(
            //                   //                 "Margin",
            //                   //                 style: TextStyle(
            //                   //                     color: totalMarginProfit >= 0
            //                   //                         ? Colors.yellow
            //                   //                         : Colors.red,
            //                   //                     fontSize: 11,
            //                   //                     fontWeight: FontWeight.bold),
            //                   //               ),
            //                   //             ],
            //                   //           ),
            //                   //           FittedBox(
            //                   //             child: Padding(
            //                   //               padding: const EdgeInsets.symmetric(
            //                   //                   horizontal: 8),
            //                   //               child: Row(
            //                   //                 mainAxisSize: MainAxisSize.min,
            //                   //                 children: [
            //                   //                   const Text(
            //                   //                     "AED  ",
            //                   //                     style: TextStyle(
            //                   //                         color: Colors.white,
            //                   //                         fontSize: 13,
            //                   //                         fontWeight:
            //                   //                             FontWeight.bold),
            //                   //                   ),
            //                   //                   Text(
            //                   //                     (viewModel.userService.user!
            //                   //                                 .totalGoldHoldings *
            //                   //                             currentGoldRate)
            //                   //                         .toStringAsFixed(2)
            //                   //                         .toString(),
            //                   //                     style: const TextStyle(
            //                   //                         color: Colors.white,
            //                   //                         fontSize: 35,
            //                   //                         fontWeight:
            //                   //                             FontWeight.bold),
            //                   //                   ),
            //                   //                   Text(
            //                   //                     " / ",
            //                   //                     style: TextStyle(
            //                   //                         color:
            //                   //                             totalMarginProfit >= 0
            //                   //                                 ? Colors.yellow
            //                   //                                 : Colors.red,
            //                   //                         fontSize: 25,
            //                   //                         fontWeight:
            //                   //                             FontWeight.bold),
            //                   //                   ),
            //                   //                   Text(
            //                   //                     totalMarginProfit
            //                   //                         .toStringAsFixed(2),
            //                   //                     style: TextStyle(
            //                   //                         color:
            //                   //                             totalMarginProfit >= 0
            //                   //                                 ? Colors.yellow
            //                   //                                 : Colors.red,
            //                   //                         fontSize: 20,
            //                   //                         fontWeight:
            //                   //                             FontWeight.bold),
            //                   //                   ),
            //                   //                 ],
            //                   //               ),
            //                   //             ),
            //                   //           ),
            //                   //           // Padding(
            //                   //           //   padding: EdgeInsets.only(right: 0),
            //                   //           //   child: ProgressBar(
            //                   //           //     value: 0.4,
            //                   //           //     backgroundColor: Colors.white,
            //                   //           //     //specify only one: color or gradient
            //                   //           //     color: Colors.grey,
            //                   //           //   ),
            //                   //           // gradient: LinearGradient(
            //                   //           //   begin: Alignment.topLeft,
            //                   //           //   end: Alignment.bottomRight,
            //                   //           //   colors: [
            //                   //           //     Colors.yellowAccent,
            //                   //           //     Colors.deepOrange
            //                   //           //   ],
            //                   //           // ),
            //                   //           // ),
            //                   //         ],
            //                   //       ),
            //                   //     ),
            //                   //   ),
            //                   // )),
            //                   Expanded(
            //                     child: Column(
            //                       mainAxisSize: MainAxisSize.min,
            //                       children: [
            //                         Container(
            //                             height: size.height * 0.08,
            //                             decoration: BoxDecoration(
            //                                 // color: kcButtonBackground,
            //                                 color: Colors.white,
            //                                 //  Colors.yellow.shade300
            //                                 //     .withOpacity(0.65),
            //                                 // border: Border.all(color: Colors.white),
            //                                 borderRadius:
            //                                     BorderRadius.circular(15),
            //                                 boxShadow: [
            //                                   BoxShadow(
            //                                     blurRadius: 3,
            //                                     spreadRadius: 0.5,
            //                                     color: Colors.black38
            //                                         .withOpacity(0.4),
            //                                   )
            //                                 ]),
            //                             child: ClipRRect(
            //                               borderRadius: BorderRadius.circular(15),
            //                               child:
            //                                   //  BackdropFilter(
            //                                   //   filter: ImageFilter.blur(
            //                                   //       sigmaX: 20, sigmaY: 20),
            //                                   //   child:
            //                                   Padding(
            //                                 padding: const EdgeInsets.symmetric(
            //                                     horizontal: 20),
            //                                 child: Column(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment.center,
            //                                   crossAxisAlignment:
            //                                       CrossAxisAlignment.center,
            //                                   children: [
            //                                     const Text(
            //                                       "Portfolio",
            //                                       style: TextStyle(
            //                                           color: Colors.yellow,
            //                                           fontSize: 14,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     ),
            //                                     verticalSpaceSmall,
            //                                     // Text("12.5 grams"),
            //                                     FittedBox(
            //                                       child: Row(
            //                                         mainAxisAlignment:
            //                                             MainAxisAlignment.center,
            //                                         children: [
            //                                           const Text(
            //                                             "AED ",
            //                                             style: TextStyle(
            //                                                 color: Colors.black,
            //                                                 fontSize: 14,
            //                                                 fontWeight:
            //                                                     FontWeight.bold),
            //                                           ),
            //                                           Text(
            //                                             " ${(viewModel.userService.user!.totalGoldHoldings * currentGoldRate).toStringAsFixed(2).toString()} / 3.2 grams",
            //                                             style: const TextStyle(
            //                                                 color: Colors.black,
            //                                                 fontSize: 14,
            //                                                 fontWeight:
            //                                                     FontWeight.bold),
            //                                           ),
            //                                         ],
            //                                       ),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                               // ),
            //                             )),
            //                         verticalSpaceSmall,
            //                         Container(
            //                             height: size.height * 0.08,
            //                             decoration: BoxDecoration(
            //                                 // color: kcButtonBackground,
            //                                 color: Colors.white,
            //                                 // border: Border.all(color: Colors.white),
            //                                 borderRadius:
            //                                     BorderRadius.circular(15),
            //                                 boxShadow: [
            //                                   BoxShadow(
            //                                     blurRadius: 3,
            //                                     spreadRadius: 0.5,
            //                                     color: Colors.black38
            //                                         .withOpacity(0.4),
            //                                   )
            //                                 ]),
            //                             child: ClipRRect(
            //                               borderRadius: BorderRadius.circular(15),
            //                               child: BackdropFilter(
            //                                 filter: ImageFilter.blur(
            //                                     sigmaX: 0, sigmaY: 0),
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.symmetric(
            //                                       horizontal: 20),
            //                                   child: Column(
            //                                     mainAxisAlignment:
            //                                         MainAxisAlignment.center,
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.center,
            //                                     children: [
            //                                       const Text(
            //                                         "Margin",
            //                                         style: TextStyle(
            //                                             color: Colors.black,
            //                                             fontSize: 14,
            //                                             fontWeight:
            //                                                 FontWeight.bold),
            //                                       ),
            //                                       verticalSpaceSmall,
            //                                       Row(
            //                                         mainAxisAlignment:
            //                                             MainAxisAlignment.center,
            //                                         children: [
            //                                           const Text(
            //                                             "AED ",
            //                                             style: TextStyle(
            //                                                 color: Colors.black,
            //                                                 fontSize: 14,
            //                                                 fontWeight:
            //                                                     FontWeight.bold),
            //                                           ),
            //                                           Text(
            //                                             (viewModel
            //                                                         .userService
            //                                                         .user!
            //                                                         .totalGoldHoldings *
            //                                                     currentGoldRate)
            //                                                 .toStringAsFixed(2)
            //                                                 .toString(),
            //                                             style: const TextStyle(
            //                                                 color: Colors.black,
            //                                                 fontSize: 14,
            //                                                 fontWeight:
            //                                                     FontWeight.bold),
            //                                           ),
            //                                         ],
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                               ),
            //                             ))
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     SliverList(
            //       delegate: SliverChildListDelegate([
            //         Container(
            //           decoration: const BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(50),
            //                   topRight: Radius.circular(50))),
            //           child:
            //               // transactionViewtypes())
            //               Padding(
            //             padding: const EdgeInsets.all(16.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 verticalSpaceMedium,
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     GestureDetector(
            //                       onTap: () {
            //                         viewModel.changeSelection(selection: 'Bank');
            //                       },
            //                       child: transactionTypes(context,
            //                           isSelected: viewModel.isSelected == 'Bank',
            //                           image: 'assets/images/account_balance.png',
            //                           text: 'Bank'),
            //                     ),
            //                     GestureDetector(
            //                       onTap: () {
            //                         viewModel.changeSelection(selection: 'Card');
            //                       },
            //                       child: transactionTypes(context,
            //                           isSelected: viewModel.isSelected == 'Card',
            //                           image: 'assets/images/credit_card.png',
            //                           text: 'Card'),
            //                     ),
            //                     GestureDetector(
            //                       onTap: () {
            //                         viewModel.changeSelection(
            //                             selection: 'Crypto');
            //                       },
            //                       child: transactionTypes(context,
            //                           isSelected:
            //                               viewModel.isSelected == 'Crypto',
            //                           image: 'assets/images/bitcoin.png',
            //                           text: 'Crypto'),
            //                     ),
            //                   ],
            //                 ),
            //                 verticalSpaceMedium,
            //                 const Text(
            //                   "Transactions",
            //                   style: TextStyle(
            //                       color: Color(0xff33404F),
            //                       fontSize: 24,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ]),
            //     ),
            //     SliverList(
            //       delegate: SliverChildListDelegate(
            //         addRepaintBoundaries: true,
            //         addAutomaticKeepAlives: true,
            //         [
            //           viewModel.isSelected == 'Card' &&
            //                   viewModel.cardTransactions.isEmpty
            //               ? Container(
            //                   color: Colors.white,
            //                   height: 200,
            //                   child: Center(
            //                     child: viewModel.isBusy
            //                         ? const CircularProgressIndicator()
            //                         : const Text('No Transactions For Card Yet'),
            //                   ),
            //                 )
            //               : viewModel.isSelected == 'Crypto' &&
            //                       viewModel.cryptoTransactions.isEmpty
            //                   ? Container(
            //                       color: Colors.white,
            //                       height: 200,
            //                       child: Center(
            //                         child: viewModel.isBusy
            //                             ? const CircularProgressIndicator()
            //                             : const Text(
            //                                 'No Transactions For Crypto Yet'),
            //                       ),
            //                     )
            //                   : viewModel.isSelected == 'Bank' &&
            //                           viewModel.bankTransactions.isEmpty
            //                       ? Container(
            //                           color: Colors.white,
            //                           height: 200,
            //                           child: Center(
            //                             child: viewModel.isBusy
            //                                 ? const CircularProgressIndicator()
            //                                 : const Text(
            //                                     'No Transactions For Bank Yet'),
            //                           ),
            //                         )
            //                       : viewModel.isBusy
            //                           ? Container(
            //                               color: Colors.white,
            //                               height: 200,
            //                               child: const Center(
            //                                 child: CircularProgressIndicator(),
            //                               ),
            //                             )
            //                           : Container(
            //                               padding: const EdgeInsets.symmetric(
            //                                   horizontal: 20),
            //                               color: Colors.white,
            //                               child: ListView.builder(
            //                                 padding: EdgeInsets.zero,
            //                                 primary: false,
            //                                 shrinkWrap: true,
            //                                 dragStartBehavior:
            //                                     DragStartBehavior.down,
            //                                 physics:
            //                                     const NeverScrollableScrollPhysics(),
            //                                 itemCount: viewModel.isSelected ==
            //                                         'Card'
            //                                     ? viewModel
            //                                         .cardTransactions.length
            //                                     : viewModel.isSelected == 'Crypto'
            //                                         ? viewModel
            //                                             .cryptoTransactions.length
            //                                         : viewModel
            //                                             .bankTransactions.length,
            //                                 itemBuilder: ((context, index) {
            //                                   return HomeTransactionRow(
            //                                     // profileLoss: viewModel.,
            //                                     transactionDetails: viewModel
            //                                                 .isSelected ==
            //                                             'Card'
            //                                         ? viewModel
            //                                             .cardTransactions[index]
            //                                         : viewModel.isSelected ==
            //                                                 'Crypto'
            //                                             ? viewModel
            //                                                     .cryptoTransactions[
            //                                                 index]
            //                                             : viewModel
            //                                                     .bankTransactions[
            //                                                 index],
            //                                     //  viewModel.cryptoTransactions[index],
            //                                     buttonText: viewModel
            //                                                 .isSelected ==
            //                                             'Card'
            //                                         ? viewModel
            //                                             .cardTransactions[index]
            //                                             .status
            //                                         : viewModel.isSelected ==
            //                                                 'Crypto'
            //                                             ? viewModel
            //                                                 .cryptoTransactions[
            //                                                     index]
            //                                                 .status
            //                                             : viewModel
            //                                                 .bankTransactions[
            //                                                     index]
            //                                                 .status,
            //                                     // viewModel.cryptoTransactions[index].status,
            //                                     btc: viewModel.isSelected ==
            //                                             'Card'
            //                                         ? viewModel
            //                                             .cardTransactions[index]
            //                                             .totalGoldBought
            //                                             .toString()
            //                                         : viewModel.isSelected ==
            //                                                 'Crypto'
            //                                             ? viewModel
            //                                                 .cryptoTransactions[
            //                                                     index]
            //                                                 .totalGoldBought
            //                                                 .toString()
            //                                             : viewModel
            //                                                 .bankTransactions[
            //                                                     index]
            //                                                 .totalGoldBought
            //                                                 .toString(),

            //                                     //  viewModel
            //                                     //     .cryptoTransactions[index].totalGoldBought
            //                                     //     .toString(),
            //                                     image: masterCard,
            //                                     imageBack: kcYellowBright,
            //                                     btcColor: kcYellowBright,
            //                                     onTap: () {},
            //                                   );
            //                                 }),
            //                               ),
            //                             ),
            //           Container(
            //             color: Colors.white,
            //             height: viewModel.isSelected == 'Card' &&
            //                     viewModel.cardTransactions.length >= 2
            //                 ? 200
            //                 : viewModel.isSelected == 'Crypto' &&
            //                         viewModel.cryptoTransactions.length >= 2
            //                     ? 200
            //                     : viewModel.isSelected == 'Bank' &&
            //                             viewModel.bankTransactions.length >= 2
            //                         ? 200
            //                         : 200,
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
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

  Widget topRow(HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 00, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 16, // Adjust the radius to your desired size
            backgroundImage: viewModel.userService.user!.profileImg.isNotEmpty
                ? NetworkImage(viewModel.userService.user!.profileImg)
                : const AssetImage(profile) as ImageProvider,
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
    );
  }

  // ^ Wallet Types  ? Margin
  Widget walletTypes(HomeViewModel viewModel, Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kcAppBackgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Wallet",
                    style: TextStyle(
                        color: kcProfitColor,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                  verticalSpaceSmall,
                  FittedBox(
                    child: Text(
                      "AED ${viewModel.balanceService.balanceData!.balance.toString()}",
                      style: const TextStyle(
                          color: kcProfitColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.15,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kcAppBackgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Margin",
                    style: TextStyle(
                        color: kcProfitColor,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                  verticalSpaceSmall,
                  FittedBox(
                    child: Text(
                      (viewModel.totalMarginProfit)
                          .toStringAsFixed(2)
                          .toString(),
                      // viewModel.userService.user!.totalGoldHoldings.toString(),
                      style: const TextStyle(
                          color: kcProfitColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        verticalSpaceSmall,
        Container(
          height: size.height * 0.15,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kcAppBackgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Portfolio",
                style: TextStyle(
                    color: kcProfitColor,
                    fontSize: 23,
                    fontWeight: FontWeight.normal),
              ),
              verticalSpaceSmall,
              FittedBox(
                child: Text(
                  "${viewModel.userService.user!.totalGoldHoldings.toStringAsFixed(3)}g/AED ${(viewModel.userService.user!.totalGoldHoldings * currentGoldRate).toStringAsFixed(2).toString()}",
                  // viewModel.userService.user!.totalGoldHoldings.toString(),
                  style: const TextStyle(
                      color: kcProfitColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // ^ Gold Container
  Widget goldenContainer(HomeViewModel viewModel, Size size) {
    return Container(
        height: size.height * 0.3,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: kcAppBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Lottie.asset('assets/lottie/live_rate.json',
                        height: 30,
                        options:
                            LottieOptions(enableApplyingOpacityToLayers: true)),
                    horizontalSpaceTiny,
                    const Text(
                      "Live Price",
                      style: TextStyle(
                          color: kcProfitColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                showLivePrice(viewModel),
                // verticalSpaceTiny,
                goldPurity(size: size),
                Container(
                  height: 1,
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  color: kcLightTextColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Your current gold balance is:",
                        style: TextStyle(fontSize: 12, color: kcProfitColor),
                      ),
                      Text(
                        "${viewModel.userService.user!.totalGoldHoldings.toStringAsFixed(4)}g",
                        style:
                            const TextStyle(fontSize: 12, color: kcProfitColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                right: -20,
                top: size.height * 0.06,
                child: Image.asset(
                  'assets/images/gold.png',
                  height: size.height * 0.14,
                ))
          ],
        ));
  }

  Widget goldPurity({required Size size}) {
    return Expanded(
      child: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            const Text(
              "this price includes 3% GST",
              style: TextStyle(color: kcProfitColor, fontSize: 12),
            ),
            verticalSpaceSmall,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                  color: kcProfitColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "24k - 99.9%",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showLivePrice(HomeViewModel viewModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.asset('assets/images/gold_ingots_gold_svgrepo_com1.png',
        //     height: 30),
        const Text(
          "AED ",
          style: TextStyle(
              fontStyle: FontStyle.normal,
              color: kcProfitColor,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        viewModel.isBusy
            ? const Text(
                ' ...  ',
                style: TextStyle(
                    color: kcProfitColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                "${currentGoldRate.toStringAsFixed(2)}/G",
                style: const TextStyle(
                    color: kcProfitColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
      ],
    );
  }

  transactionViewtypes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.blue),
            child: const Center(
                child: Text(
              'Bank',
              style: TextStyle(color: Colors.white),
            ))),
        Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
            child: const Center(
                child: Text(
              'Card',
              style: TextStyle(color: Colors.black),
            ))),
        Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
            child: const Center(
                child: Text(
              'Crypto',
              style: TextStyle(color: Colors.black),
            )))
      ]),
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
