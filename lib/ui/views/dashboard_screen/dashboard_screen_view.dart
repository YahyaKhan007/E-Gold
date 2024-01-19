import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customBottomNavIcons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_screen_viewmodel.dart';

class DashboardScreenView extends StackedView<DashboardScreenViewModel> {
  const DashboardScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: IndexedStack(
        index: viewModel.currentPageIndex,
        children: viewModel.pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        child: BottomAppBar(
          height: 90,
          color: Colors.black,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavIcon(
                text: 'Dashboard',
                image: dashboard,
                onPressed: () {
                  viewModel.pageChange(0);
                },
              ),
              BottomNavIcon(
                text: 'History',
                image: history,
                onPressed: () {
                  viewModel.pageChange(1);
                },
              ),
              const SizedBox(width: 48.0), // This is the elevated center item
              BottomNavIcon(
                text: 'Sip',
                image: sip,
                onPressed: () {
                  viewModel.pageChange(3);
                },
              ),
              BottomNavIcon(
                text: 'Account',
                image: account,
                onPressed: () {
                  viewModel.pageChange(4);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 45,
            right: MediaQuery.of(context).size.width / 2 - 28.0,
            child: Column(
              children: [
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.black,
                  onPressed: () {
                    viewModel.pageChange(2);
                  },
                  child: Image.asset(
                    buy,
                  ),
                ),
                // Text(
                //   'Buy', // Your text here
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  DashboardScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardScreenViewModel();
}
