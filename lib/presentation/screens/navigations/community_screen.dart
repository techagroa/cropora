import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'All',
    'Paddy',
    'Vegetables',
    'Machinery',
    'Markets',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F4),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Title & Subtitle
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Farmer Community',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Learn, share and discuss with fellow farmers',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.green.shade100,
                        width: 1,
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search discussions...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(minWidth: 32),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Category Chips
                SizedBox(
                  height: 38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final isSelected = _selectedCategoryIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(
                            _categories[index],
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade700,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 13,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: AppColors.primaryAppColor,
                          backgroundColor: const Color(0xFFEAEAEA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          showCheckmark: false,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),

                // Status Pill
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.wifi, size: 14, color: Color(0xFF2E7D32)),
                        SizedBox(width: 6),
                        Text(
                          'Online — community is synced',
                          style: TextStyle(
                            color: Color(0xFF2E7D32),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Discussion List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      _buildCommunityPostCard(
                        avatarLetter: 'N',
                        authorName: 'Nimal Perera',
                        tagLabel: 'Paddy',
                        timeAgo: '2h ago',
                        title: 'Has anyone tried AWD irrigation method for Yala season?',
                        bodySnippet: 'I\'ve been reading about Alternate Wetting and Drying for paddy. Has anyone in Kurunegala...',
                        replyCount: '3 replies',
                      ),
                      const SizedBox(height: 12),
                      _buildCommunityPostCard(
                        avatarLetter: 'S',
                        authorName: 'Saman Fernando',
                        tagLabel: 'Vegetables',
                        timeAgo: '5h ago',
                        title: 'Looking for advice on improving tomato yield this season',
                        bodySnippet: 'My tomato plants are looking healthy but the yield is not what I expected. Using...',
                        replyCount: '2 replies',
                      ),
                      const SizedBox(height: 12),
                      _buildCommunityPostCard(
                        avatarLetter: 'R',
                        authorName: 'Ranjith Kumara',
                        tagLabel: 'Machinery',
                        timeAgo: '1d ago',
                        title: 'Which tractor is best for small paddy fields under 2 acres?',
                        bodySnippet: 'I\'m considering buying or renting a small tractor for my 1.5 acre paddy field. Kubota or...',
                        replyCount: '4 replies',
                      ),
                      const SizedBox(height: 12),
                      _buildCommunityPostCard(
                        avatarLetter: 'M',
                        authorName: 'Manel Jayawardena',
                        tagLabel: 'Markets',
                        timeAgo: '2d ago',
                        title: 'Best time to sell paddy this season — market prices?',
                        bodySnippet: "Paddy prices have been fluctuating a lot. Pettah traders offering LKR 85/kg but I've heard...",
                        replyCount: '6 replies',
                      ),
                      const SizedBox(height: 15), // Extra space for FAB
                    ],
                  ),
                ),
              ],
            ),

            // Floating Action Button (Fixed)
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.primaryAppColor,
                shape: const CircleBorder(),
                child: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // 'Community' tab active
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Market',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityPostCard({
    required String avatarLetter,
    required String authorName,
    required String tagLabel,
    required String timeAgo,
    required String title,
    required String bodySnippet,
    required String replyCount,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author Header
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryAppColor,
                child: Text(
                  avatarLetter,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                authorName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  tagLabel,
                  style: const TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                timeAgo,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Post Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 6),

          // Post Snippet
          Text(
            bodySnippet,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),

          // Replies Footer
          Row(
            children: [
              const Icon(
                Icons.chat_bubble_outline,
                size: 14,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                replyCount,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
