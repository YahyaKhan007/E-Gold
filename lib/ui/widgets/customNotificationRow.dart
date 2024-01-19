import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationsRow extends StatelessWidget {
  final String image;
  const NotificationsRow({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const ShapeDecoration(
                color: Color(0xFFF5B118),
                shape: OvalBorder(),
              ),
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New Update Available',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: const Text(
                    'Update the spilitwise and enjoy new features for a better spilt bill experience',
                    style: TextStyle(
                      color: kcLightText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              '36m',
              style: TextStyle(
                color: kcLightText,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ],
    );
  }
}
