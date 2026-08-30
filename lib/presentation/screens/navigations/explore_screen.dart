import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Title
              const Text(
                'Explore',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'All services for Sri Lankan farmers',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Knowledge & Advisory Section
              _buildSectionTitle('Knowledge & Advisory'),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.menu_book_outlined,
                iconColor: const Color(0xFF7B1FA2),
                iconBgColor: const Color(0xFFF3E5F5),
                title: 'Knowledge Hub',
                subtitle: 'Articles and guides for farmers',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.cloud_outlined,
                iconColor: const Color(0xFF1976D2),
                iconBgColor: const Color(0xFFE3F2FD),
                title: 'Weather & Advisory',
                subtitle: 'Current weather and seasonal tips',
                onTap: () {},
              ),
              const SizedBox(height: 20),

              // Government & Finance Section
              _buildSectionTitle('Government & Finance'),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.assignment_outlined,
                iconColor: const Color(0xFF2E7D32),
                iconBgColor: const Color(0xFFE8F5E9),
                title: 'Government Schemes',
                subtitle: 'Subsidies and support programs',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.trending_up,
                iconColor: const Color(0xFF1976D2),
                iconBgColor: const Color(0xFFE3F2FD),
                title: 'Loans',
                subtitle: 'Agricultural loan information',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.security_outlined,
                iconColor: const Color(0xFFE65100),
                iconBgColor: const Color(0xFFFBE9E7),
                title: 'Insurance',
                subtitle: 'Crop insurance programs',
                onTap: () {},
              ),
              const SizedBox(height: 20),

              // Services Section
              _buildSectionTitle('Services'),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.agriculture_outlined,
                iconColor: const Color(0xFF5D4037),
                iconBgColor: const Color(0xFFEFEBE9),
                title: 'Equipment',
                subtitle: 'Tractors, pumps and tools',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.error_outline,
                iconColor: const Color(0xFFC62828),
                iconBgColor: const Color(0xFFFFEBEE),
                title: 'Report an Issue',
                subtitle: 'Submit agricultural complaints',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildExploreCard(
                icon: Icons.people_outlined,
                iconColor: const Color(0xFF2E7D32),
                iconBgColor: const Color(0xFFE8F5E9),
                title: 'Community',
                subtitle: 'Discuss with fellow farmers',
                onTap: () {},
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // 'Explore' tab active
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryAppColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryTextColor,
      ),
    );
  }

  Widget _buildExploreCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
