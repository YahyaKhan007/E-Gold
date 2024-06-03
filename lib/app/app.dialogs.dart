// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/add_amount_for_balance/add_amount_for_balance_dialog.dart';
import '../ui/dialogs/buy_dialog/buy_dialog_dialog.dart';
import '../ui/dialogs/confirm_dialog/confirm_dialog_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';

enum DialogType {
  infoAlert,
  buyDialog,
  addAmountForBalance,
  confirmDialog,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.buyDialog: (context, request, completer) =>
        BuyDialogDialog(request: request, completer: completer),
    DialogType.addAmountForBalance: (context, request, completer) =>
        AddAmountForBalanceDialog(request: request, completer: completer),
    DialogType.confirmDialog: (context, request, completer) =>
        ConfirmDialogDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
