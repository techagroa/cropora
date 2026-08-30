import 'package:cropora/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const CroporaApp());
}

class CroporaApp extends StatelessWidget {
  const CroporaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cropora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryAppColor,
        scaffoldBackgroundColor: const Color(0xFFF4F7F4),
        useMaterial3: true,
      ),
      // initialRoute: AppRoutes.languageSelect,
      initialRoute: AppRoutes.languageSelect,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
