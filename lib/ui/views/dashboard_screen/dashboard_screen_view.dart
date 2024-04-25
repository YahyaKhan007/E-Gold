import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
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
      backgroundColor: kcAppBackgroundColor,
      body:
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         Color(0xFF9FD8F5), // Light blue
          //         Color(0xFFD6F1FF), // Lighter blue
          //       ],
          //     ),
          //   ),
          //   child:
          PageView(
        controller: viewModel.pageController,
        onPageChanged: viewModel.pageChange,
        physics: const NeverScrollableScrollPhysics(),
        // allowImplicitScrolling: false,
        children: viewModel.pages,
      ),
      // ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SizedBox(
        height: 85,
        child: BottomNavigationBar(
          backgroundColor: kcAppBackgroundColor,
          selectedLabelStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.red),
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: Colors.red, // Change selected color to red
          // unselectedItemColor: Colors.black, // Change unselected color to black
          elevation: 0,
          // backgroundColor: Colors.black,
          currentIndex: viewModel.currentPageIndex,
          onTap: (newIndex) {
            viewModel.pageController.animateToPage(newIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
            viewModel.pageController.jumpToPage(newIndex);
          },
          selectedItemColor: kcProfitColor,
          unselectedItemColor: Colors.white,
          // unselectedLabelStyle: const TextStyle(color: Colors.yellow, fontSize: 12),

          items: [
            navbarItem(
                image: Timages.home,
                show: viewModel.currentPageIndex == 0 ? true : false,
                label: 'Dashboard',
                isLast: false),
            navbarItem(
                label: 'history',
                image: Timages.history,
                show: viewModel.currentPageIndex == 1 ? true : false,
                isLast: false),
            navbarItem(
                label: 'BUY',
                image: Timages.buy,
                show: viewModel.currentPageIndex == 2 ? true : false,
                isLast: false),
            navbarItem(
                label: 'SIP',
                image: Timages.sip,
                show: viewModel.currentPageIndex == 3 ? true : false,
                isLast: false),
            navbarItem(
                label: 'Profile',
                // image: Timages.profile,
                image: viewModel.homeModel.userService.user?.profileImg != ''
                    ? viewModel.homeModel.userService.user!.profileImg
                    : Timages.profile,
                isProfileShow:
                    viewModel.homeModel.userService.user?.profileImg != ''
                        ? true
                        : false,
                show: viewModel.currentPageIndex == 4 ? true : false,
                isLast: true),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem navbarItem(
      {required String image,
      required bool show,
      required bool isLast,
      bool? isProfileShow,
      required String label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: isProfileShow == true
            ? CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  image,
                  // height: 25,
                  // color: isLast ? null : Colors.white,
                  // fit: BoxFit.cover,
                ),
              )
            : Image.asset(
                image,
                height: 25,

                color: isLast ? null : Colors.white,
                // height: 30,
              ),
      ),
      label: label,
      activeIcon: Visibility(
        visible: show,
        child: isProfileShow == true && isLast == true
            ? Stack(
                children: [
                  // Circle with reduced opacity
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            image,
                          ),
                          // height: 25,
                          // color: isLast ? null : Colors.white,
                          // fit: BoxFit.cover,
                        ),

                        shape: BoxShape.circle,
                        color: kcProfitColor
                            .withOpacity(0.99), // Adjust the opacity as needed
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: isProfileShow == true
                          ? Image.network(
                              image,
                              height: 25,
                            )
                          : Image.asset(
                              image,
                              height: 25,
                            ), // Replace with your active icon
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  // Circle with reduced opacity
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            image,
                          ),
                          // height: 25,
                          // color: isLast ? null : Colors.white,
                          // fit: BoxFit.cover,
                        ),

                        shape: BoxShape.circle,
                        color: kcProfitColor
                            .withOpacity(0.99), // Adjust the opacity as needed
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: isProfileShow == true
                          ? Image.network(
                              image,
                              height: 25,
                            )
                          : Image.asset(
                              image,
                              height: 25,
                            ), // Replace with your active icon
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  DashboardScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardScreenViewModel();
}

// class NavIconsButtons extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String image;
//   final Color? color;
//   String? text;
//   NavIconsButtons({
//     super.key,
//     required this.onPressed,
//     required this.image,
//     required this.color,
//     this.text = '',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       child: InkWell(
//         onTap: onPressed,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 40,
//               color: color ?? Colors.transparent,
//               child: color == null
//                   ? Image.asset(
//                       image,
//                       height: 40,
//                     )
//                   : const SizedBox(height: 40, width: 40),

//               // IconButton(
//               //   onPressed: onPressed,
//               //   icon: Image.asset(
//               //     image,
//               //     height: 40,
//               //   ),
//               // ),
//             ),
//             Center(
//               child: Text(
//                 text!,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 13,
//                     fontWeight:
//                         color != null ? FontWeight.bold : FontWeight.normal),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
