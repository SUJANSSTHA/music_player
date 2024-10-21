// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:music_player/pages/setting_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //! Logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40.0,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          //! Home title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: Text("H O M E"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);  // Drawer बन्द गर्न
              },
            ),
          ),
          //! Setting title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text("S E T T I N G"),
              leading: Icon(Icons.settings),
              onTap: () {
                // Setting navigation or logic
                //pop drawer
                Navigator.pop(context);
                //! Navigate to settings page
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SettingPage())
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
