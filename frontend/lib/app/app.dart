import 'package:flutter/material.dart';
import 'router.dart';
import 'theme.dart';

class AiBosApp extends StatelessWidget {
  const AiBosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AI BOS',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Defaulting to light theme as per design specifications
    );
  }
}
