// ignore_for_file: use_full_hex_values_for_flutter_colors, dead_code

import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTransactionRow extends StatelessWidget {
  final String buttonText;
  final String btc;
  final String image;
  final Color imageBack;
  final Color btcColor;
  String? type;
  String? amount;
  String? walletType;
  final TransactionDetails transactionDetails;
  final VoidCallback onTap;
  HomeTransactionRow({
    super.key,
    required this.transactionDetails,
    required this.buttonText,
    required this.btc,
    required this.image,
    required this.imageBack,
    required this.btcColor,
    required this.onTap,
    this.type = '',
    this.amount = '',
    this.walletType = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 21,
            backgroundColor: Colors.green,
            child: Center(
              child: Image.asset(
                'assets/images/up_arrow.png',
                height: 12,
              ),
            ),
          ),
          title: type == 'TopUp'
              ? Text(
                  walletType!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text(
                  'Gold',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          subtitle: const Text(
            "Five Lods",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Column(
            children: [
              type == 'TopUp'
                  ? Text(
                      '\$$amount',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      '$btc ${transactionDetails.withdrawMethod} ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              Text(
                _formattedDate(transactionDetails.transactionDate),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey),
              )
            ],
          ),
        ),
      ),

      //  Container(
      //   margin: const EdgeInsets.symmetric(horizontal: 10),
      //   height: 100,
      //   // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      //   decoration: ShapeDecoration(
      //     color: const Color(0xffD4EEFD),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //     shadows: const [
      //       BoxShadow(
      //         color: Color(0x3F000000),
      //         blurRadius: 8,
      //         offset: Offset(1, 1),
      //         spreadRadius: 0,
      //       )
      //     ],
      //   ),
      //   child: ListTile(
      //     contentPadding:
      //         const EdgeInsets.only(right: 10, left: 15, top: 10, bottom: 10),
      //     leading: Container(
      //       width: 48,
      //       height: 48,
      //       decoration: const ShapeDecoration(
      //         color: kcLightButtonBackground,
      //         shape: OvalBorder(),
      //       ),
      //       child: Center(
      //         child: Image.asset(image),
      //       ),
      //     ),
      //     title: type == 'TopUp'
      //         ? Text(
      //             walletType!,
      //             style: const TextStyle(
      //               color: Colors.black,
      //               fontSize: 18,
      //               fontWeight: FontWeight.w500,
      //             ),
      //           )
      //         : const Text(
      //             'Gold',
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 18,
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //     subtitle: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.min,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           _formattedDate(transactionDetails.transactionDate),
      //           style: const TextStyle(
      //             color: Color(0xFF626262),
      //             fontSize: 14,
      //             fontWeight: FontWeight.w400,
      //           ),
      //         ),
      //         Text(
      //           type!,
      //           style: const TextStyle(
      //             color: Color(0xFF626262),
      //             fontSize: 10,
      //             fontWeight: FontWeight.w400,
      //           ),
      //         ),
      //       ],
      //     ),
      //     trailing: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         type == 'TopUp'
      //             ? Text(
      //                 '\$$amount',
      //                 style: const TextStyle(
      //                   color: kcTextColor,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w500,
      //                 ),
      //               )
      //             : Text(
      //                 '$btc ${transactionDetails.withdrawMethod} ',
      //                 style: const TextStyle(
      //                   color: kcTextColor,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w500,
      //                 ),
      //               ),
      //         Container(
      //           width: 77,
      //           height: 19,
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      //           decoration: BoxDecoration(
      //             color: buttonText == 'Pending' ? kcLightGrey : kcSuccessGreen,
      //             borderRadius: BorderRadius.circular(4),
      //             boxShadow: const [
      //               BoxShadow(
      //                 color: Color(0x3F000000),
      //                 blurRadius: 4,
      //                 offset: Offset(1, 1),
      //                 spreadRadius: 0,
      //               )
      //             ],
      //           ),
      //           child: Center(
      //             child: Text(
      //               buttonText,
      //               style: const TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),

      //   // Row(
      //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   //   children: [
      //   //     Row(
      //   //       children: [

      //   //         const SizedBox(
      //   //           width: 10,
      //   //         ),
      //   //         Column(
      //   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   //           crossAxisAlignment: CrossAxisAlignment.start,
      //   //           children: [
      //   //             type == 'TopUp'
      //   //                 ? Text(
      //   //                     walletType!,
      //   //                     style: const TextStyle(
      //   //                       color: Colors.black,
      //   //                       fontSize: 18,
      //   //                       fontWeight: FontWeight.w500,
      //   //                     ),
      //   //                   )
      //   //                 : const Text(
      //   //                     'Gold',
      //   //                     style: TextStyle(
      //   //                       color: Colors.black,
      //   //                       fontSize: 18,
      //   //                       fontWeight: FontWeight.w500,
      //   //                     ),
      //   //                   ),

      //   //           ],
      //   //         ),
      //   //       ],
      //   //     ),

      //   //   ],
      //   // ),
      // ),
    );
  }

  String _formattedDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    // return DateFormat('MMMM d, y H:mm').format(dateTime);
    return DateFormat('MMMM d').format(dateTime);
  }
}
