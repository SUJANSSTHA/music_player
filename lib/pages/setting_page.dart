// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
                // backgroundColor: Theme.of(context).colorScheme.surface,

          title: Text("S E T T I N G S",),
        ),
        body: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! Dark Mode
              const Text("Dark Mode"),
              //! Switch
              CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value)=> Provider.of<ThemeProvider>(context, listen: false).toggleTheme())
            ],
          ),
        ));
  }
}