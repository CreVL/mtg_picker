import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_picker/data/get_it_initializer.dart';
import 'package:mtg_picker/data/hive_boxes/hive_boxes.dart';
import 'package:mtg_picker/ui/pages/card_page/card_page.dart';
import 'package:mtg_picker/ui/providers/root_providers.dart';
import 'package:mtg_picker/ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  GetItInitializer.setupAll();
  await HiveBoxes.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RootProviders(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: router,
            theme: themeData,
          );
        },
      ),
    );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Scaffold(
        resizeToAvoidBottomInset: false,
        body: CardPage(),
      ),
    ),
  ],
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
