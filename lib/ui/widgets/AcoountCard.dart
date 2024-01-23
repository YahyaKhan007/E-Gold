import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/AccountCardRow.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(card),
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
              const Text(
                'ADRBank',
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                profile,
                height: 48,
                width: 48,
              ),
              Image.asset(
                cardLogo,
                height: 24,
                width: 24,
              ),
            ],
          ),
          const Text(
            'E-Gold-1312-3126-2411-2312',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AccountCardRow(
                text1: 'Card Holder Name',
                text2: 'Yennefer Doe',
              ),
              const AccountCardRow(
                text1: 'Expired Date',
                text2: '10/28',
              ),
              Image.asset(masterCard),
            ],
          ),
        ],
      ),
    );
  }
}
