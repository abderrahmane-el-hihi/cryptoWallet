import 'package:lucide_icons/lucide_icons.dart';
import 'package:reBlock/Components/CustomButton.dart';
import 'package:reBlock/Components/MainButton.dart';
import 'package:reBlock/Services/Service.dart';
import 'package:reBlock/pages/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> settingsList = [
    'Account & Security',
    'Transactions',
    'Linked Cards',
    'Default Currency',
    'Notifications',
    'App Language',
    'Support',
    'Privacy Policy'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Icon(
              Icons.account_circle_rounded,
              color: Colors.grey.shade300,
              size: 128,
            ),
            Text(
              "Name lst name",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ID: efu23eu3eu83',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    LucideIcons.copy,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .555,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(),
                      ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              settingsList[index],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Icon(CupertinoIcons.arrow_right),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: settingsList.length),
            ),
            // MainButton(
            //     onPressed: () async {
            //       Service().signOut();
            //       Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const LoginPage()));
            //     },
            //     hasIcon: true,
            //     icondata: Icons.logout_rounded,
            //     title: 'Sign Out'),
          ],
        ),
      )),
    );
  }
}
