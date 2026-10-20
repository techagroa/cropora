import 'package:flutter/material.dart';

import '../core/constant/app_colors.dart';
import '../core/routes/app_routes.dart';

/// Data model representing a single bottom navigation tab item.
class BottomNavItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final String routeName;

  const BottomNavItem({
    required this.icon,
    this.activeIcon,
    required this.label,
    required this.routeName,
  });
}

/// A reusable Bottom Navigation Bar component following Flutter best practices.
///
/// Handles consistent styling, route navigation, and tab selection across the app.
class CustomBottomNavigationBar extends StatelessWidget {
  /// The index of the currently active tab (0: Home, 1: Explore, 2: Market, 3: Community, 4: Profile).
  final int currentIndex;

  /// Optional custom tap callback. If null, default navigation using [AppRoutes] is performed.
  final ValueChanged<int>? onTap;

  /// List of navigation bar items (Single Source of Truth).
  static const List<BottomNavItem> navItems = [
    BottomNavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
      routeName: AppRoutes.home,
    ),
    BottomNavItem(
      icon: Icons.search,
      activeIcon: Icons.search_sharp,
      label: 'Explore',
      routeName: AppRoutes.explore,
    ),
    BottomNavItem(
      icon: Icons.shopping_bag_outlined,
      activeIcon: Icons.shopping_bag,
      label: 'Market',
      routeName: AppRoutes.market,
    ),
    BottomNavItem(
      icon: Icons.people_outlined,
      activeIcon: Icons.people,
      label: 'Community',
      routeName: AppRoutes.community,
    ),
    BottomNavItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profile',
      routeName: AppRoutes.profile,
    ),
  ];

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  void _handleTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    if (onTap != null) {
      onTap!(index);
    } else {
      final targetRoute = navItems[index].routeName;
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _handleTap(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryAppColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 11),
      items: navItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          activeIcon: item.activeIcon != null ? Icon(item.activeIcon) : null,
          label: item.label,
        );
      }).toList(),
    );
  }
}
