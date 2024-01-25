import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../common/ui_helpers.dart';
import 'createanaccount_viewmodel.dart';

class CreateanaccountView extends StackedView<CreateanaccountViewModel> {
  const CreateanaccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateanaccountViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                  child: Text(
                'Create an account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
              verticalSpaceTiny,
              const Text(
                'Create an account you can explore\nall the existing jobs',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              verticalSpaceLarge,
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(48),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => viewModel.handleButtonPress(index),
                        icon: SvgPicture.asset(
                          viewModel.buttonData[index]['icon'],
                          height: 28.0,
                          width: 28.0,
                        ),
                        label: Text(viewModel.buttonData[index]['text']),
                      ),
                    ),
                  )),
              verticalSpaceLarge,
              Column(
                children: [
                  ElevatedButton(
                    onPressed: viewModel.onPressedSignup,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(48),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Sign up'),
                  ),
                  verticalSpaceSmall,
                  ElevatedButton(
                    onPressed: viewModel.onPressedLogin,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(48),
                      shape: const StadiumBorder(
                          side: BorderSide(
                        width: 2.0,
                        color: Colors.orange,
                      )),
                      backgroundColor: kcBackgroundColor,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Login'),
                  )
                ],
              )
            ],
          )),
    );
  }

  @override
  CreateanaccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateanaccountViewModel();
}
