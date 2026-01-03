import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';
import 'package:thinkforge/home/wallet/components/total_transaction_card.dart';
import 'package:thinkforge/common_ui_components/transfer_bottom_sheet.dart';
import 'package:thinkforge/home/wallet/components/mt5accountcard.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _balanceCard(),
                Mt5accountcard(),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F1D1E),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: TotalTransactionsOverviewCard(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _balanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(balanceLabel, style: TextStyle(color: grey)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 2),

                child: Image(
                  image: AssetImage(dollerIcon),
                  height: 20,
                ),
              ),
              Text(
                '5,231.89',
                style: TextStyle(
                  color: white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const Text(
            '$unassignedAmountLabel '':''\$345.09',
            style: TextStyle(color: grey),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _actionButton('Deposit', depositIcon),
              const SizedBox(width: 12),
              _actionButton('Withdraw', withDrawIcon),
              const SizedBox(width: 12),
              _actionButton('Transfer', transferIcon),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String label, String iconPath) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (label == 'Transfer') {
            showWalletDepositSheet(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: label == 'Deposit'
                ? white
                : const Color(0xFF212322), // dark background
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFF404040), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(iconPath),
                color: label != 'Deposit' ? white : black,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: label != 'Deposit' ? white : black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showWalletDepositSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const TransferBottomSheet(),
    );
  }
}
