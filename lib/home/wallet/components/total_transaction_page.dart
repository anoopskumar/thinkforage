import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/common_ui_components/searchbar.dart';
import 'package:thinkforge/common_ui_components/custom_appbar.dart';
import 'package:thinkforge/common_ui_components/custom_bottom_nav.dart';
import 'package:thinkforge/constants/constants.dart';
import 'package:thinkforge/home/home_page.dart';
import 'package:thinkforge/home/wallet/components/transaction_tile.dart';

class TotalTransactionPage extends StatefulWidget {
  const TotalTransactionPage({super.key});

  @override
  State<TotalTransactionPage> createState() => _TotalTransactionPageState();
}

class _TotalTransactionPageState extends State<TotalTransactionPage> {
  final int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: customAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            padding: EdgeInsets.only(top: 16, left: 12, right: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1D1D1F),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                 Searchbar(),
                  const SizedBox(height: 16),
                  transactionDateHeader('November 30'),
                  const SizedBox(height: 16),
                  TransactionTile(
                    icon: Icons.account_balance_wallet,
                    iconBg: appgreencolor,
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
                  ),
                   transactionDateHeader('November 30'),
                     const SizedBox(height: 16),
                   TransactionTile(
                    icon: Icons.account_balance_wallet,
                    iconBg:appgreencolor,
                    title: 'Wallet deposit',
                    date: '23rd may 2025',
                    status: 'Rejected',
                    amount: '+\$21,282',
                    amountColor: grey,
                    statusColor: Colors.redAccent,
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
                    iconBg:appgreencolor,
                    title: 'Wallet deposit',
                    date: '23rd may 2025',
                    status: 'Rejected',
                    amount: '+\$21,282',
                    amountColor: grey,
                    statusColor: Colors.redAccent,
                    iconPath: walletIcons,
                  ),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: context.bottomNav(
          currentIndex: _currentIndex,
          onTap: (index) {
          
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const HomePage(),
                ),
              );
          }
        ),
      ),
    );
  }
  Widget transactionDateHeader(String date) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        style: const TextStyle(
          color: white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        children: [
           TextSpan(text: date),
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: Transform.translate(
              offset: const Offset(0, -6), // moves "th" up
              child: const Text(
                'th',
                style: TextStyle(
                  fontSize: 10, // smaller
                  color: white,
                ),
              ),
            ),
          ),
          const TextSpan(text: ', 2025'),
        ],
      ),
    ),
  );
}

}
