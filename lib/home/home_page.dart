import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/common_ui_components/custom_appbar.dart';
import 'package:thinkforge/common_ui_components/custom_bottom_nav.dart';
import 'package:thinkforge/home/IB/ib_page.dart';
import 'package:thinkforge/home/dashboard/dashboard_page.dart';
import 'package:thinkforge/home/support/support_page.dart';
import 'package:thinkforge/home/wallet/wallet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: customAppBar(),
        body: _buildBody(),
        bottomNavigationBar: context.bottomNav(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
        ),
      ),
    );
  }
//core pages
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const TradingDashboardPage();
      case 1:
        return const WalletPage();
      case 2:
        return const SupportPage();
      case 3:
      default:
        return const IbPage();
    }
  }
}
