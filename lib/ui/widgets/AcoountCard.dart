import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/widgets/AccountCardRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/account_screen/account_screen_viewmodel.dart';

class AccountCard extends StatelessWidget {
  final AccountScreenViewModel model;
  const AccountCard({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.25,
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(card4),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(1, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'E-Gold24k',
                style: TextStyle(
                  color: const Color(0xFF1F1F1F),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CircleAvatar(
                radius: 16.r,
                backgroundImage: NetworkImage(
                  model.authService.userProfileService.user!.profileImg
                          .isNotEmpty
                      ? model.authService.userProfileService.user!.profileImg
                      : profile1,
                ),
              ),
              Image.asset(
                cardLogo1,
                height: 24,
                width: 24,
              ),
            ],
          ),
          Text(
            'E-Gold-${model.authService.userProfileService.user!.cardNumber.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)}-").substring(0, 19)}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AccountCardRow(
                text1: 'Card Holder Name',
                text2: model.authService.userProfileService.user!.name,
              ),
              const AccountCardRow(
                text1: 'Expired Date',
                text2: '10/28',
              ),
              Image.asset('assets/images/masterCard.png'),
            ],
          ),
        ],
      ),
    );
  }
}
