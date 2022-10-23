import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_provider/theme_store.dart';
import 'package:provider/provider.dart';

showOptionDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => Observer(builder: (_) {
            final themeStore = context.read<ThemeStore>();
            return SimpleDialog(
              title: Text('Select theme'),
              children: <Widget>[
                ListTile(
                  title: const Text('Light Theme'),
                  leading: Radio(
                    value: ThemeType.light,
                    groupValue: themeStore.currentThemeType,
                    onChanged: (ThemeType? value) {
                      themeStore.changeCurrentTheme(value!);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dark Theme'),
                  leading: Radio(
                    value: ThemeType.dark,
                    groupValue: themeStore.currentThemeType,
                    onChanged: (ThemeType? value) async {
                      themeStore.changeCurrentTheme(value!);
                    },
                  ),
                ),
              ],
            );
          }));
}
