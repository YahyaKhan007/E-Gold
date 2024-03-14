import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return isWalletCard
        ? Container(
            width: width * .44,
            height: height * 0.16,
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shadows: const [
                BoxShadow(
                  color: Colors.white24,
                  blurRadius: 10,
                  offset: Offset(2, 0),
                  spreadRadius: 0,
                )
              ],
              color: Colors.lightBlue.shade100,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Wallet',
                    style: TextStyle(
                      color: kcTextColor,
                      fontSize: 18 * textScaleFactor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16 * textScaleFactor),
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
                  SizedBox(height: height * 0.016),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$$balance1 + \$$margin1',
                          style: const TextStyle(
                            color: kcTextColor,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '(Margin)',
                          style: TextStyle(
                            color: kcTextColor,
                            fontSize: 8 * textScaleFactor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: width * .44,
            height: height * 0.16,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Colors.white24,
                  blurRadius: 5,
                  offset: Offset(1, -2),
                  spreadRadius: 0,
                )
              ],
              color: Color(0xFFB3E5FC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Portfolio',
                      style: TextStyle(
                        color: kcTextColor,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.016),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/image 44.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.016),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$250',
                            style: TextStyle(
                              color: kcTextColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '(5gm)',
                            style: TextStyle(
                              color: kcTextColor,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: kcTextColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '+18.33% today',
                            style: TextStyle(
                              color: kcTextColor,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
