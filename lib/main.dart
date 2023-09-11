import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reluxe_website/provider/navbar_provider.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NavBarProvider>(
          create: (context) => NavBarProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = createRouter();

    return MaterialApp.router(
      title: 'Reluxe: Property Rental',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.transparent),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}
