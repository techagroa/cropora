import 'package:flutter/material.dart';

import '../../presentation/screens/language_select_screen.dart';

import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/register_screen.dart';

import '../../presentation/screens/navigations/community_screen.dart';
import '../../presentation/screens/navigations/explore_screen.dart';
import '../../presentation/screens/navigations/home_screen.dart';
import '../../presentation/screens/navigations/market_screen.dart';
import '../../presentation/screens/navigations/profile_screen.dart';

class AppRoutes {
  static const String languageSelect = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String market = '/market';
  static const String community = '/community';
  static const String profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case languageSelect:
        return MaterialPageRoute(builder: (_) => const LanguageSelectScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case explore:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case market:
        return MaterialPageRoute(builder: (_) => const MarketScreen());
      case community:
        return MaterialPageRoute(builder: (_) => const CommunityScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404 Not Found : ${settings.name}')),
          ),
        );
    }
  }
}
