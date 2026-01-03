import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/common_ui_components/searchbar.dart';
import 'package:thinkforge/common_ui_components/custom_appbar.dart';
import 'package:thinkforge/common_ui_components/custom_bottom_nav.dart';
import 'package:thinkforge/constants/constants.dart';
import 'package:thinkforge/home/dashboard/components/investment_tile.dart';
import 'package:thinkforge/home/home_page.dart';

class InvestmentDashboardPage extends StatefulWidget {
  const InvestmentDashboardPage({super.key});

  @override
  State<InvestmentDashboardPage> createState() =>
      _InvestmentDashboardPageState();
}

int _currentIndex = 0;
int expandedIndex = -1;

class _InvestmentDashboardPageState extends State<InvestmentDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor:  scaffoldBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _accountSelector(),
              const SizedBox(height: 20),
              _pnlSummary(),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 16, left: 6, right: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1D1F),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    /// SEARCH BAR
                    Searchbar(),
                    const SizedBox(height: 16),

                    /// TABLE HEADER
                    _tableHeader(),
                    const SizedBox(height: 8),
                    InvestmentTile(
                      index: 0,
                      symbol: 'USDXAUS',
                      side: 'BUY',
                      units: '100',
                      price: '100.00',
                      pnl: '+\$22.00',
                      pnlColor: appgreencolor,
                    ),
                    InvestmentTile(
                      index: 1,
                      symbol: 'USDXEUR',
                      side: 'SELL',
                      units: '150',
                      price: '150.00',
                      pnl: '-\$12.00',
                      pnlColor: Colors.redAccent,
                    ),
                    InvestmentTile(
                      index: 2,
                      symbol: 'USDXJPY',
                      side: 'BUY',
                      units: '200',
                      price: '200.00',
                      pnl: '+\$45.00',
                      pnlColor: appgreencolor,
                    ),
                    InvestmentTile(
                      index: 3,
                      symbol: 'USDXAUS',
                      side: 'BUY',
                      units: '100',
                      price: '100.00',
                      pnl: '+\$22.00',
                      pnlColor:appgreencolor,
                    ),
                    InvestmentTile(
                      index: 4,
                      symbol: 'USDXEUR',
                      side: 'SELL',
                      units: '150',
                      price: '150.00',
                      pnl: '-\$12.00',
                      pnlColor: Colors.redAccent,
                    ),
                    InvestmentTile(
                      index: 4,
                      symbol: 'USDXJPY',
                      side: 'BUY',
                      units: '200',
                      price: '200.00',
                      pnl: '+\$45.00',
                      pnlColor:appgreencolor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: context.bottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => const HomePage()),
          );
        },
      ),
    );
  }

  /// ACCOUNT DROPDOWN
  Widget _accountSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('MT5192', style: TextStyle(color: white)),
          SizedBox(width: 6),
          Icon(Icons.keyboard_arrow_down, color: white),
        ],
      ),
    );
  }

  /// PNL SUMMARY
  Widget _pnlSummary() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: scaffoldBgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          _pnlColumn(
            title: 'Floating pnl',
            value: ' +200.00',
            valueColor: const Color(0xFF1DFFAA),
            extra1: 'Margin :',
            position: 'right',
            extra1Value: ' 20.00',
            extra2: 'Open positions :',
            extra2Value: '10',
          ),
          Container(
            height: 120,
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white12,
          ),
          _pnlColumn(
            position: 'left',
            title: 'Net realized pnl',
            value: ' -200.00',
            valueColor: Colors.redAccent,
            extra1: 'Free margin',
            extra1Value: ' 20.00',
          ),
        ],
      ),
    );
  }

  Widget _pnlColumn({
    required String title,
    required String value,
    required Color valueColor,
    required String position,
    String? extra1,
    String? extra1Value,
    String? extra2,
    String? extra2Value,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: position != 'left'
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(title, style: const TextStyle(color: grey, fontSize: 15)),
          Row(
            mainAxisAlignment: position != 'left'
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Image(image: AssetImage(dollerIcon), height: 20),
              Text(
                value,
                style: TextStyle(
                  color: valueColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          if (extra1 != null) ...[
            const SizedBox(height: 12),
            Text(extra1, style: const TextStyle(color: grey)),
            Row(
              mainAxisAlignment: position != 'left'
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Image(image: AssetImage(dollerIcon), height: 20),
                Text(
                  extra1Value!,
                  style: const TextStyle(color: white, fontSize: 18),
                ),
              ],
            ),
          ],
          if (extra2 != null) ...[
            const SizedBox(height: 12),
            Text(extra2, style: const TextStyle(color: grey)),
            Text(
              extra2Value!,
              style: const TextStyle(color: white, fontSize: 18),
            ),
          ],
          if (extra2 == null) ...[const SizedBox(height: 50)],
        ],
      ),
    );
  }

  Widget _tableHeader() {
    return Row(
      children: const [
        SizedBox(width: 10),
        Expanded(
          //flex: 1,
          child: Text(
            'Symbol',
            style: TextStyle(color: white, fontSize: 13),
          ),
        ),
        SizedBox(width: 35),
        Text('Units', style: TextStyle(color: white)),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Text('Current Price', style: TextStyle(color: white)),
        ),
        Expanded(
          flex: 2,
          child: Text('Floating P/L', style: TextStyle(color: white)),
        ),
      ],
    );
  }
}
