import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Link Bank Account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: viewModel.formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () => viewModel.linkAccount(context),
                            child: Container(
                              width: 150,
                              height: 48,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              decoration: ShapeDecoration(
                                color: kcYellowBright,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
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
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: viewModel.addBalance,
                            child: Container(
                              width: 150,
                              height: 48,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              decoration: ShapeDecoration(
                                color: kcYellowBright,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
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
                        ),
                      ],
                    ),
                  ],
                ),
        ),
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
