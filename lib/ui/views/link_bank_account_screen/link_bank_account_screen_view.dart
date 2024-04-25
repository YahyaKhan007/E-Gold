import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'link_bank_account_screen_viewmodel.dart';

class LinkBankAccountScreenView
    extends StackedView<LinkBankAccountScreenViewModel> {
  const LinkBankAccountScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LinkBankAccountScreenViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Link Bank Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
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
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              decoration: const BoxDecoration(
                  color: kcAppBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Form(
                key: viewModel.formKey,
                child: Container(
                  padding: EdgeInsets.all(size.height * 0.005),
                  child: viewModel.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            verticalSpaceMedium,
                            CustomTextField(
                              title: 'Bank Name',
                              controller: viewModel.bankName,
                              validator: viewModel.customValidator,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              title: 'Account Number',
                              controller: viewModel.accountNumber,
                              keyboardType: TextInputType.number,
                              validator: viewModel.customValidator,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              title: 'Account Swift Code',
                              controller: viewModel.accountSwiftCode,
                              keyboardType: TextInputType.number,
                              validator: viewModel.customValidator,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => viewModel.linkAccount(context),
                                    child: Container(
                                      width: 150,
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12),
                                      decoration: ShapeDecoration(
                                        color: kcProfitColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x3FF5B119),
                                            blurRadius: 8,
                                            offset: Offset(2, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Link Account',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceMedium,
                                  GestureDetector(
                                    onTap: viewModel.addBalance,
                                    child: Container(
                                      width: 150,
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12),
                                      decoration: ShapeDecoration(
                                        color: kcProfitColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x3FF5B119),
                                            blurRadius: 8,
                                            offset: Offset(2, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Add Balance',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  LinkBankAccountScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LinkBankAccountScreenViewModel();

  @override
  void onViewModelReady(LinkBankAccountScreenViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
