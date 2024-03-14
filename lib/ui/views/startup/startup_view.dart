import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFB3E5FC), // Light blue
              Color(0xFFE1F5FE), // Lighter blue
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/gold_svgrepo_com1.png',
                        filterQuality: FilterQuality.high,
                        color: kcLightButtonBackground,
                        width: 248,
                        height: 248,
                        scale: 0.9,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: 'Welcome to the\nworld’s most\n',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w900, color: kcTextColor),
                  children: [
                    TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: kcLightButtonBackground,
                              fontWeight: FontWeight.w900),
                      text: 'imaginative\n',
                    ),
                    TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontWeight: FontWeight.w900, color: kcTextColor),
                      text: 'marketplace',
                    ),
                  ],
                ),
              ),
              verticalSpaceMassive,
              viewModel.isLogin
                  ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Loading ...',
                            style: TextStyle(fontSize: 16, color: kcTextColor)),
                        horizontalSpaceSmall,
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: kcButtonBackground,
                            strokeWidth: 6,
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: viewModel.getStarted,
                              child: const Text('Get Started')),
                          verticalSpaceSmall,
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                                TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: const Color(0xffF5B119)),
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = viewModel.navigationService
                                          .navigateToLoginView),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
