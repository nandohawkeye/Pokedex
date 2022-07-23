import 'package:flutter/material.dart';
import 'package:pokedex/src/core/routes/routes.dart';
import 'injection.dart';
import 'package:asuka/asuka.dart' as asuka;

void main() {
  configInjection();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex',
      builder: asuka.builder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
