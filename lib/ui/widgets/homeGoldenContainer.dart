import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/balance.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customHomeMetalCard.dart';
import 'package:e_gold/ui/widgets/homeScreenSellSection.dart';
import 'package:flutter/material.dart';

class HomeGoldenContainer extends StatelessWidget {
  final userService = locator<UserProfileService>();
  final balanceService = locator<BalanceService>();
  final VoidCallback onPressedNotification;
  final VoidCallback gold;
  final VoidCallback silver;
  String goldPrice;

  HomeGoldenContainer({
    super.key,
    required this.goldPrice,
    required this.onPressedNotification,
    required this.gold,
    required this.silver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kcYellowBright,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
          bottomRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: const Center(
                child: Text(
                  'E-Gold',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0.03,
                  ),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 10, // Adjust the radius to your desired size
                  backgroundImage:
                      userService.user?.profileImg.isNotEmpty == true
                          ? NetworkImage(userService.user!.profileImg)
                          : const AssetImage(profile) as ImageProvider,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: onPressedNotification,
                  icon: const Icon(
                    Icons.notifications,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                'Current Gold Rate:  $goldPrice AED',
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeMetalContainer(
                    isWalletCard: true,
                    title: 'Wallet',
                    priceGm: '6003.38/gm',
                    number: '128.76',
                    increase: '+18.33 (18%)',
                    containerColor: kcGolden,
                    textColor: kcGoldenText,
                    circleColor: kcGoldenText,
                    onTap: gold,
                    balance1: balanceService.balanceData!.balance.toString(),
                    margin1: balanceService.balanceData!.margin.toString(),
                  ),
                  HomeMetalContainer(
                    isWalletCard: false,
                    title: 'Portfolio',
                    priceGm: '78.225/gm',
                    number: '139.24',
                    increase: '-18.33 (8%)',
                    containerColor: kcSilver,
                    textColor: kcGreen,
                    circleColor: kcSilverLight,
                    onTap: silver,
                    balance1: '',
                    margin1: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
