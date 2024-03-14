import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customNotificationRow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'notification_screen_viewmodel.dart';

class NotificationScreenView extends StackedView<NotificationScreenViewModel> {
  const NotificationScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white
              // gradient: LinearGradient(
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   colors: [
              //     Color(0xFFB3E5FC), // Light blue
              //     Color(0xFFE1F5FE), // Lighter blue
              //   ],
              // ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Divider(
              //   height: 1,
              //   color: kcLightButtonBackground,
              // ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NotificationsRow(
                      image: mobile,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NotificationsRow(
                      image: shield,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NotificationsRow(
                      image: mobile,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NotificationsRow(
                      image: shield,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NotificationsRow(
                      image: mobile,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NotificationsRow(
                      image: shield,
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
  NotificationScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationScreenViewModel();
}
