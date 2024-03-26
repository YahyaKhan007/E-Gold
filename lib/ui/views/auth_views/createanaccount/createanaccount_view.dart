import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Create an account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
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
            top: size.height * 0.18,
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpaceTiny,
                    const Text(
                      'Create an account you can explore\nall the existing jobs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
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
                                  backgroundColor:
                                      kcLightButtonBackground.withOpacity(0.9)),
                              onPressed: () =>
                                  viewModel.handleButtonPress(index),
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
                              color: Colors.white,
                            )),
                            backgroundColor: kcButtonBackground,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Login'),
                        ),
                        verticalSpaceSmall,
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CreateanaccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateanaccountViewModel();
}
