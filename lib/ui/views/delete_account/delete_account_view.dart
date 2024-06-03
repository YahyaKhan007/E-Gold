import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'delete_account_viewmodel.dart';

class DeleteAccountView extends StackedView<DeleteAccountViewModel> {
  const DeleteAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteAccountViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Delete Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: viewModel.onBack,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height,
        child: Stack(
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
              child: SizedBox(
                height: size.height * 0.9,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 00),
                        decoration: const BoxDecoration(
                            // color: Colors.white,
                            color: kcAppBackgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Once your account is deleted, all your data will be permanently removed and cannot be recovered",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            verticalSpaceLarge,
                            if (viewModel.isEmailPasswordUser)
                              Column(
                                children: [
                                  TextFormField(
                                    controller: viewModel.passwordController,
                                    decoration: const InputDecoration(
                                        hintText: "Enter current Password"),
                                  ),
                                  verticalSpaceLarge,
                                ],
                              ),
                            verticalSpaceLarge,
                            viewModel.isBusy
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kcProfitColor,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: viewModel.deleteAccount,
                                    child: const Text("Delete Account")),
                          ],
                        ),
                        // height: screenHeight(context) * 0.8,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  DeleteAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DeleteAccountViewModel();
}
