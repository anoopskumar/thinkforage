import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';
import 'package:thinkforge/home/dashboard/components/marquee_widget.dart';
import 'package:thinkforge/home/dashboard/components/overall_pl_card.dart';
import 'package:thinkforge/home/dashboard/components/transaction_overviewcard.dart';

class TradingDashboardPage extends StatefulWidget {
  const TradingDashboardPage({super.key});

  @override
  State<TradingDashboardPage> createState() => _TradingDashboardPageState();
}

class _TradingDashboardPageState extends State<TradingDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _marqeeAnimation(), //Text animation section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _balanceCard(), //balance section
                  _promoCard(), //banner image
                  const SizedBox(height: 16),
                  TransactionsOverviewCard(), //transaction overview
                  OverallPLCard(), //P/L section
                  _bannerImages(urlPath: forexContainer),
                  _bannerImages(urlPath: economiImage),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _bannerImages({required String urlPath}) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Image(image: AssetImage(urlPath)),
    );
  }

  Widget _marqeeAnimation() {
    return SizedBox(
      height: 40,
      child: ClipRect(
        child: Container(
          color: appgreencolor,
          child: Center(
            child: const MarqueeText(
              text:marqueeText,
            ),
          ),
        ),
      ),
    );
  }

  Widget _balanceCard() {
    return Container(
      padding: const EdgeInsets.all(12),
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

          const SizedBox(height: 16),
          Row(
            children: [
              _actionButton(
                'Deposit',
              depositIcon,
              ),
              const SizedBox(width: 12),
              _actionButton(
                'Withdraw',
                withDrawIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String label, String iconPath) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: label != 'Withdraw'
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
              color: label == 'Withdraw' ? white : black,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: label == 'Withdraw' ? white : black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _promoCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Image(image: AssetImage(bannerImage)),
    );
  }
}
