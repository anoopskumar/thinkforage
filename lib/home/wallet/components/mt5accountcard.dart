import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';

class Mt5accountcard extends StatelessWidget {
  const Mt5accountcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1D1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          _sectionTitle(mt5Title),
          const SizedBox(height: 12),
          _mt5Accounts(),

          const SizedBox(height: 12),
          _sectionTitle(accountTitle),
          const SizedBox(height: 12),
          _bankAccounts(),

          const SizedBox(height: 12),
          _sectionTitle(cryptoTitle),
          const SizedBox(height: 12),
          _cryptoAccounts(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  /// SECTION HEADER
  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 20),
        const Icon(Icons.more_horiz, color: white),
      ],
    );
  }

  /// MT5 ACCOUNTS
  Widget _mt5Accounts() {
    return Row(
      children: [
        _mt5Card(
          label: 'Demo',
          accountId: 'MT5192',
          balance: '+\$5,325.57',
          isLive: false,
        ),
        const SizedBox(width: 8),
        _mt5Card(
          label: 'Live',
          accountId: 'MT5192',
          balance: '+\$5,325.57',
          isLive: true,
        ),
      ],
    );
  }

  Widget _mt5Card({
    required String label,
    required String accountId,
    required String balance,
    required bool isLive,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1D1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(color: white, fontSize: 12),
                ),
                if (isLive) ...[
                  const SizedBox(width: 6),
                  const CircleAvatar(radius: 3, backgroundColor: Colors.green),
                ],
              ],
            ),
            const SizedBox(height: 2),
            Text(
              accountId,
              style: const TextStyle(color: Color(0xFF9B7CFF), fontSize: 12),
            ),
            const SizedBox(height: 2),
            Text(
              balance,
              style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// BANK ACCOUNTS
  Widget _bankAccounts() {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _bankCard(
            bankName: 'Axis Bank',
            number: '5375 **** **** 2368',
            country: 'India',
            color: const Color(0xFF19C37D),
            status: 'Pending',
          ),
          const SizedBox(width: 8),
          _bankCard(
            bankName: 'ICICI',
            number: '5375 **** **** 2368',
            country: 'India',
            color: const Color(0xFF3B82F6),
          ),
          const SizedBox(width: 8),
          _bankCard(
            bankName: 'Deutsche',
            number: '5375 **** **** 2368',
            country: 'Germany',
            color: const Color(0xFF3B82F6),
          ),
        ],
      ),
    );
  }

  Widget _bankCard({
    required String bankName,
    required String number,
    required String country,
    required Color color,
    String? status,
  }) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bankName,
                style: const TextStyle(color: white, fontSize: 13),
              ),
              Transform.rotate(
                angle: 90 * 3.1415926535 / 180, // 90 degrees
                child: const Icon(
                  Icons.more_horiz,
                  color: white,
                  size: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            number,
            style: const TextStyle(color: Colors.white70, fontSize: 11),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                country,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
              if (status != null)
                Text(
                  status,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// CRYPTO ACCOUNTS
  Widget _cryptoAccounts() {
    return Row(
      children: [
        _cryptoCard(network: 'TRC20', address: 'TQ9aC9...Lx3p9z'),
        const SizedBox(width: 12),
        _cryptoCard(network: 'TRC20', address: '0x4e9c...d28a67'),
      ],
    );
  }

  Widget _cryptoCard({required String network, required String address}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          top: 24,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1D1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              network,
              style: const TextStyle(color: Color(0xFF9B7CFF), fontSize: 12),
            ),
            const SizedBox(height: 2),
            Text(
              address,
              style: const TextStyle(color: white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
