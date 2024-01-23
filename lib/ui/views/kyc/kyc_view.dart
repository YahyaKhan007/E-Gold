import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/views/kycbankaccount/kycbankaccount_view.dart';
import 'package:e_gold/ui/views/kycpassport/kycpassport_view.dart';
import 'package:e_gold/ui/views/kycprofile/kycprofile_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import '../kycidcardback/kycidcardback_view.dart';
import '../kycidcardfront/kycidcardfront_view.dart';
import 'kyc_viewmodel.dart';

class KycView extends StackedView<KycViewModel> {
  const KycView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycViewModel viewModel,
    Widget? child,
  ) {
    Widget stepIconBuilder(int stepNumber) {
      if (viewModel.currentPage >= stepNumber) {
        return const CircleAvatar(
          maxRadius: 28,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 20,
          ),
        );
      } else {
        return CircleAvatar(
          maxRadius: 28,
          backgroundColor: Colors.black,
          child: Text(
            '${stepNumber + 1}',
            style: const TextStyle(color: Colors.white),
          ),
        );
      }
    }

    List<Step> pages = [
      Step(
        isActive: viewModel.currentPage == 0,
        state:
            viewModel.currentPage > 0 ? StepState.complete : StepState.indexed,
        content: KycidcardfrontView(
          idFrontUploaded: viewModel.idFrontUpload,
          onClickUpload: () {
            viewModel.onCNICFrontUpload(context);
          },
          onClickNext: viewModel.onPressedButton,
          cnicController: viewModel.cnicController,
          formKey: viewModel.formKey1,
        ),
        title: const Text(''),
      ),
      Step(
        isActive: viewModel.currentPage == 1,
        state:
            viewModel.currentPage > 1 ? StepState.complete : StepState.indexed,
        content: KycidcardbackView(
          idBackUploaded: viewModel.idBackUpload,
          onChangedCheckbox: (value) {
            viewModel.onChangedCheckbox(value);
          },
          onClickNext: viewModel.onPressedButton,
          onCnicBack: () {
            viewModel.onCnicBackUpload(context);
          },
          concent: viewModel.concentAgreement,
        ),
        title: const Text(''),
      ),
      Step(
        isActive: viewModel.currentPage == 2,
        state:
            viewModel.currentPage > 2 ? StepState.complete : StepState.indexed,
        content: KycpassportView(
          formkey: viewModel.formKey3,
          onClickNext: viewModel.onPressedButton,
          passportNoController: viewModel.passportNoController,
        ),
        title: const Text(''),
      ),
      Step(
        isActive: viewModel.currentPage == 3,
        state:
            viewModel.currentPage > 3 ? StepState.complete : StepState.indexed,
        content: KycbankaccountView(
          onClickNext: viewModel.onPressedButton,
          formkey: viewModel.formKey4,
          accountNoController: viewModel.accountNoController,
          confirmNoController: viewModel.confirmAccountController,
          bankNameController: viewModel.bankNameController,
          ifscCodeController: viewModel.ifscCodeController,
        ),
        title: const Text(''),
      ),
      Step(
        isActive: viewModel.currentPage == 4,
        state:
            viewModel.currentPage > 4 ? StepState.complete : StepState.indexed,
        content: KycprofileView(
          onTapDOB: () {
            viewModel.onTapDob(context);
          },
          profileImgupLoaded: viewModel.idProfileImgUpload,
          formkey: viewModel.formKey5,
          sumbitKyc: viewModel.submitKyc,
          uploadProfile: () {
            viewModel.uploadProfileImg(context);
          },
          dobController: viewModel.dobController,
        ),
        title: const Text(''),
      ),
    ];

    return Scaffold(
      appBar: kAppBar(
        context: context,
        title: const Text('KYC'),
        onButtonPressed: () {},
        backgroundColor: kcBackgroundColor,
      ),
      body: Stepper(
        connectorThickness: 4,
        stepIconBuilder: (stepIndex, stepState) {
          stepState.index;
          return stepIconBuilder(stepIndex);
        },
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return SizedBox.fromSize();
        },
        elevation: 0,
        type: StepperType.horizontal,
        controller: viewModel.pageController,
        currentStep: viewModel.currentPage,
        steps: pages,
        onStepTapped: viewModel.onPageChanged,
      ),
    );
  }

  @override
  KycViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycViewModel();

  @override
  void onViewModelReady(KycViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
