import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'SettingsPage.dart';

class MyPopupMenuButtonEx extends StatelessWidget {
  const MyPopupMenuButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      // onSelected: (value) {
      //   ScaffoldMessenger.of(
      //     context,
      //   ).showSnackBar(SnackBar(content: Text('You select:: $value')));
      // },
      onSelected: (value) {
        if (value == 'profile') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        } else if (value == 'settings') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        } else if (value == 'logout') {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Logging out..')));
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'profile', child: Text('Profile')),
        const PopupMenuItem(value: 'settings', child: Text('Settings')),
        const PopupMenuItem(value: 'logout', child: Text('Logout')),
        // const PopupMenuItem(
        //   value: 'profile',
        //   child: Row(
        //     children: [Icon(Icons.person), SizedBox(width: 8), Text('profile')],
        //   ),
        // ),
        // const PopupMenuItem(
        //   value: 'settings',
        //   child: Row(
        //     children: [
        //       Icon(Icons.settings),
        //       SizedBox(width: 8),
        //       Text('settings'),
        //     ],
        //   ),
        // ),
        // const PopupMenuItem(
        //   value: 'logout',
        //   child: Row(
        //     children: [Icon(Icons.logout), SizedBox(width: 8), Text('Logout')],
        //   ),
        // ),
      ],
    );
  }
}
