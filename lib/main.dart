import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_provider/options_dialog.dart';
import 'package:mobx_provider/theme_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<ThemeStore>(
      create: (_) => ThemeStore(),
    )
  ], child: MobxThemeApp()));
}

class MobxThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Mobx Theme',
        theme: context.watch<ThemeStore>().currentThemeData,
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobx Theme'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_medium),
            onPressed: () => showOptionDialog(context),
          )
        ],
      ),
      body: Center(child: Card(
        child: Observer(builder: (context) {
          return ListTile(
            title: Text(
              'The current theme is : ${context.watch<ThemeStore>().themeString}',
              textAlign: TextAlign.center,
            ),
          );
        }),
      )),
    );
  }
}
