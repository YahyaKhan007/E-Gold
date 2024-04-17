import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/widgets/AcoountCard.dart';
import 'package:e_gold/ui/widgets/customAccountOageRow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'account_screen_viewmodel.dart';

class AccountScreenView extends StackedView<AccountScreenViewModel> {
  const AccountScreenView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    AccountScreenViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.settings,
          size: 24,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight(context) * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back_home.png'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height * 0.13,
            child: Container(
              height: size.height * 0.8,
              width: size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AccountCard(),
                    verticalSpaceMedium,
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      // decoration: ShapeDecoration(
                      //   color: kcLightButtonBackground.withOpacity(0.2),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   shadows: const [
                      //     BoxShadow(
                      //       color: Color(0x264B4B4B),
                      //       blurRadius: 16.34,
                      //       offset: Offset(0, 2.04),
                      //       spreadRadius: 0,
                      //     ),
                      //   ],
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AccountPageRow(
                            text: 'Account Settings',
                            icon: Icons.settings,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'Edit Profile',
                            icon: Icons.arrow_forward_ios,
                            onPressed: viewModel.onTapEditProfile,
                          ),
                          AccountPageRow(
                            text: 'Change Password',
                            icon: Icons.arrow_forward_ios,
                            onPressed: viewModel.onTapChangePassword,
                          ),
                          AccountPageRow(
                            text: 'Add a Payment Method',
                            icon: Icons.add,
                            onPressed: () async {
                              if (await viewModel.kycService.isKycApproved()) {
                                viewModel.addPaymentMethod();
                              } else {
                                viewModel.snackbarService.showSnackbar(
                                  message:
                                      'Please Go to KYC Section and enter KYC details and wait for approval ',
                                  title: 'KYC Not Found',
                                  duration: const Duration(seconds: 2),
                                );
                              }
                            },
                          ),
                          AccountPageRow(
                            text: 'KYC',
                            icon: Icons.arrow_forward_ios,
                            onPressed: viewModel.kyc,
                          ),
                          AccountPageRow(
                            text: 'Fund History',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () async {
                              // if  (await viewModel.fundHistory)} else {
                              //     viewModel.snackbarService.showSnackbar(
                              //       message:
                              //           'Please Go to KYC Section and enter KYC details and wait for approval ',
                              //       title: 'KYC Not Found',
                              //       duration: const Duration(seconds: 2),
                              // );
                            },
                          ),
                          AccountPageRow(
                            text: 'More',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'About Us',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'Privacy Policy',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'Terms and Conditions',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'Logout',
                            icon: Icons.logout_rounded,
                            onPressed: viewModel.logout,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     child: Visibility(
          //   visible: viewModel.isNavigating,
          //   child: Material(
          //     type: MaterialType.transparency,
          //     child: Center(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Container(
          //               padding: const EdgeInsets.all(50),
          //               decoration: BoxDecoration(
          //                   borderRadius:
          //                       const BorderRadius.all(Radius.circular(15)),
          //                   color: Colors.transparent.withOpacity(0.05)),
          //               child: const CircularProgressIndicator())
          //         ],
          //       ),
          //     ),
          //   ),
          // ))
        ],
      ),
    );
  }

  @override
  AccountScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AccountScreenViewModel();
}
