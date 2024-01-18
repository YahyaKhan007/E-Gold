import 'package:e_gold/app/app.router.dart';
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
      body: Column(
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
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: const Color(0xffF5B119),
                      fontWeight: FontWeight.w900),
                  text: 'imaginative\n',
                ),
                TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.w900),
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
                    Text('Loading ...', style: TextStyle(fontSize: 16)),
                    horizontalSpaceSmall,
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                        strokeWidth: 6,
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Get Started')),
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
                                  .copyWith(color: const Color(0xffF5B119)),
                              text: 'Login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = viewModel
                                    .navigationService.navigateToLoginView),
                        ],
                      ),
                    ),
                  ],
                )
        ],
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
