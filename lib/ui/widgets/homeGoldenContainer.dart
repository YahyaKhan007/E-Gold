import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customHomeMetalCard.dart';
import 'package:flutter/material.dart';

class HomeGoldenContainer extends StatelessWidget {
  final VoidCallback onPressedNotification;
  final VoidCallback gold;
  final VoidCallback silver;
  const HomeGoldenContainer({
    super.key,
    required this.onPressedNotification,
    required this.gold,
    required this.silver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kcYellowBright),
      height: MediaQuery.of(context).size.height * .35,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              leading: Image.asset(
                profile,
                height: 40,
                width: 40,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
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
            const Text(
              'Your Portfolio Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$4,590.00',
                  style: TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '+25.33 (10%)',
                  style: TextStyle(
                    color: kcGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeMetalContainer(
                    title: 'Gold',
                    priceGm: '6003.38/gm',
                    number: '128.76',
                    increase: '+18.33 (18%)',
                    containerColor: kcGolden,
                    textColor: kcGoldenText,
                    circleColor: kcGoldenText,
                    onTap: gold,
                  ),
                  HomeMetalContainer(
                    title: 'Silver',
                    priceGm: '78.225/gm',
                    number: '139.24',
                    increase: '-18.33 (8%)',
                    containerColor: kcSilver,
                    textColor: kcGreen,
                    circleColor: kcSilverLight,
                    onTap: silver,
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
