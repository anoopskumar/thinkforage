import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/common_ui_components/wallet_deposit_sheet.dart';

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String iconPath;
  final String title;
  final String date;
  final String status;
  final String amount;
  final Color amountColor;

  const TransactionTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconPath,
    required this.title,
    required this.date,
    required this.status,
    required this.amount,
    required this.amountColor,
    Color statusColor = appgreencolor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showWalletDepositSheet(context),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF171717),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            /// ICON
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                iconPath,
                color: white,
              ),
            ),
            const SizedBox(width: 12),

            /// TITLE + DATE
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      color: grey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            /// STATUS
            Text(
              status,
              style: TextStyle(
                color: status == 'Rejected'
                    ? Colors.red
                    : white,
                fontSize: 11,
              ),
            ),
            const SizedBox(width: 20),

            /// AMOUNT
            Text(
              amount,
              style: TextStyle(
                color: amountColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWalletDepositSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const WalletDepositSheet(),
    );
  }
}
