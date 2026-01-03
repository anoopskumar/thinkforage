import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';

class WalletDepositSheet extends StatelessWidget {
  const WalletDepositSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF1D1D1F),
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// DRAG HANDLE
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: grey.shade700,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          /// CHECK ICON
          Image(image: AssetImage('assets/icons/depositcomplete.png')),

          /// TITLE
          const Text(
            'Wallet Deposit',
            style: TextStyle(
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              borderRadius: BorderRadius.circular(12),
            ),
            child: _infoRow('To', 'Wallet (HDFC - 5375 **** **** 8544)'),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _infoRow('From', 'Axis Bank - 5375 **** **** 2368'),
                _infoRow('Txn Id', 'Muhammed Anfal 919-847362'),
                _infoRow('Note', 'Investment funding'),
                _infoRow('Status', 'Completed'),
                _infoRow('Time and Date', '29-4-24, 6:45 PM'),
              ],
            ),
          ),

          SizedBox(height: 6),

          /// TOTAL
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(color: grey, fontSize: 12),
                ),
                SizedBox(height: 6),
                Text(
                  '\$199.00',
                  style: TextStyle(
                    color: white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 46,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      foregroundColor: black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// CONTINUE BUTTON
        ],
      ),
    );
  }

  /// INFO ROW
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(color: grey, fontSize: 12),
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
