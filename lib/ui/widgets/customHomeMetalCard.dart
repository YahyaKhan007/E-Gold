import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:flutter/material.dart';

class HomeMetalContainer extends StatelessWidget {
  final String title;
  final String priceGm;
  final String number;
  final bool isWalletCard;
  final String increase;
  final Color containerColor;
  final Color textColor;
  final Color circleColor;
  final VoidCallback onTap;
  final String balance1;
  final String margin1;
  const HomeMetalContainer({
    super.key,
    required this.title,
    required this.priceGm,
    required this.isWalletCard,
    required this.number,
    required this.increase,
    required this.containerColor,
    required this.textColor,
    required this.circleColor,
    required this.onTap,
    required this.balance1,
    required this.margin1,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return isWalletCard
        ? Column(
            children: [
              Container(
                width: width * .44,
                height: height * 0.16,
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFCE8BA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Wallet',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/image 45.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '\$$balance1 + \$$margin1(Margin)',
                      style: const TextStyle(
                        color: Color(0xFFF5B118),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              Container(
                width: width * .44,
                height: height * 0.16,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  color: Color(0xFFF9D075),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Portfolio',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/image 44.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$250',
                            style: TextStyle(
                              color: Color(0xFF147204),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '(5gm)',
                            style: TextStyle(
                              color: Color(0xFF147204),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Color(0xFF147204),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '+18.33% today',
                            style: TextStyle(
                              color: Color(0xFF147204),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
