import 'package:reBlock/pages/ConvertPage.dart';
import 'package:reBlock/pages/NotificationPage.dart';
import 'package:reBlock/pages/SettingsPage.dart';
import 'package:reBlock/pages/WalletPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  GNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabActiveBorder: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary, width: 0.5),
      backgroundColor: Colors.grey.shade100,
      hoverColor: Colors.grey[100]!,
      activeColor: Theme.of(context).colorScheme.inversePrimary,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 12,
      ),
      tabBackgroundColor: Colors.transparent,
      color: const Color.fromARGB(255, 143, 143, 143),
      gap: 8,
      iconSize: 24,
      tabMargin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      onTabChange: (value) => onTabChange!(value),
      tabs: [
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: Icons.wallet,
          text: 'Wallet',
        ),
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: CupertinoIcons.arrow_right_arrow_left,
          text: 'Convert',
        ),
        GButton(
          borderRadius: BorderRadius.circular(15),
          icon: LucideIcons.settings,
          text: 'Settings',
        ),
      ],
    );
  }
}

class SwitchPages extends StatefulWidget {
  final pagenum;
  const SwitchPages({super.key, this.pagenum});

  @override
  State<SwitchPages> createState() => _SwitchPAgesState();
}

class _SwitchPAgesState extends State<SwitchPages> {
  int _selectedIndex = 0;

  void Change(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const WalletPage(),
    const ConvertPage(),
    const SettingsPage(),
  ];

  List<String> titlePages = ['Wallet', 'Convert', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LucideIcons.scanLine)),
        centerTitle: true,
        title: Text(
          titlePages[_selectedIndex],
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()));
              },
              icon: Icon(LucideIcons.bell))
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: GNavBar(onTabChange: (index) => Change(index)),
      body: pages[_selectedIndex],
    );
  }
}
