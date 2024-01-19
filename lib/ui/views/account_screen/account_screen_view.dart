import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.settings,
            size: 24,
          ),
          centerTitle: true,
          title: const Text(
            'Account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const AccountCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: ShapeDecoration(
                        color: kcLightYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x264B4B4B),
                            blurRadius: 16.34,
                            offset: Offset(0, 2.04),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
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
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'Change Password',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'Add a Payment Method',
                            icon: Icons.add,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'KYC',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {},
                          ),
                          AccountPageRow(
                            text: 'Fund History',
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {},
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
                        ],
                      ),
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
  AccountScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AccountScreenViewModel();
}
