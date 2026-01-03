import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';
import 'package:thinkforge/home/wallet/components/total_transaction_page.dart';
import 'package:thinkforge/home/wallet/components/transaction_tile.dart';

class TotalTransactionsOverviewCard extends StatelessWidget {
  const TotalTransactionsOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        const Text(totalTransationTitleLabel,
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),

        TransactionTile(
          icon: Icons.account_balance_wallet,
          iconBg:appgreencolor,
          title: 'Wallet deposit',
          date: '23rd may 2025',
          status: 'Approved',
          amount: '+\$21,282',
          amountColor: const Color(0xFF1DFFAA),
          iconPath: walletIcons,
        ),

        TransactionTile(
          icon: Icons.account_balance_wallet_outlined,
          iconBg: Colors.redAccent,
          title: 'Wallet Withdraw',
          date: '23rd may 2025',
          status: 'Approved',
          amount: '-\$21,282',
          amountColor: grey,
          iconPath: walletIcons,
        ),

        TransactionTile(
          icon: Icons.group,
          iconBg: const Color(0xFF9B7CFF),
          title: 'Referral',
          date: '23rd may 2025',
          status: 'Approved',
          amount: '+\$21,282',
          amountColor: const Color(0xFF1DFFAA),
          iconPath: refferalIcon,
        ),

        TransactionTile(
          icon: Icons.card_giftcard,
          iconBg: const Color(0xFFFBBF24),
          title: 'Bonus',
          date: '23rd may 2025',
          status: 'Approved',
          amount: '+\$21,282',
          amountColor: const Color(0xFF1DFFAA),
          iconPath: bonusTransactionIcon,
        ),

        TransactionTile(
          icon: Icons.account_balance_wallet,
          iconBg: appgreencolor,
          title: 'Wallet deposit',
          date: '23rd may 2025',
          status: 'Rejected',
          amount: '+\$21,282',
          amountColor: grey,
          statusColor: Colors.redAccent,
          iconPath: walletIcons,
          //ctx: context,
        ),

        const SizedBox(height: 14),

        /// VIEW ALL BUTTON
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const TotalTransactionPage(),
              ),
            );
          },
          child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'View All',
              style: TextStyle(
                color: black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
