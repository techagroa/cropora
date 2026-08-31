import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../widgets/bottom_navigation.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'All',
    'Produce',
    'Seeds',
    'Fertilizer',
    'Machinery',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryTextColor),
          onPressed: () {},
        ),
        title: const Text(
          'Agro Market',
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 10, bottom: 10),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18, color: Colors.white),
              label: const Text(
                'List',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryAppColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search and Filter Row
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search products, equipment...',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.grey, size: 20),
                  ),
                ],
              ),
            ),

            // Horizontal Category Chips
            SizedBox(
              height: 40,
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

            // Product Cards List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildMarketItemCard(
                    imagePath: AppImages.paddySeeds,
                    tags: [
                      _buildTag(
                        'Seeds',
                        const Color(0xFFE8F5E9),
                        const Color(0xFF2E7D32),
                      ),
                    ],
                    title: 'Premium Paddy Seeds (Bg 352)',
                    price: 'LKR 4,500 / 10kg',
                    location: 'Kurunegala · Agro Lanka Farm',
                  ),
                  const SizedBox(height: 12),
                  _buildMarketItemCard(
                    imagePath: AppImages.tractor,
                    tags: [
                      _buildTag(
                        'Machinery',
                        const Color(0xFFE8F5E9),
                        const Color(0xFF2E7D32),
                      ),
                      _buildTag(
                        'Rental',
                        const Color(0xFFFFF3E0),
                        const Color(0xFFE65100),
                      ),
                    ],
                    title: 'Kubota Tractor — For Sale/Rent',
                    price: 'LKR 2,850,000 / Rent LKR 8,500/day',
                    location: 'Kurunegala · Agro Machinery Services',
                  ),
                  const SizedBox(height: 12),
                  _buildMarketItemCard(
                    imagePath: AppImages.compost,
                    tags: [
                      _buildTag(
                        'Fertilizer',
                        const Color(0xFFE8F5E9),
                        const Color(0xFF2E7D32),
                      ),
                    ],
                    title: 'Organic Compost Fertilizer',
                    price: 'LKR 2,800 / 50kg bag',
                    location: 'Anuradhapura · Green Earth Agro',
                  ),
                  const SizedBox(height: 12),
                  _buildMarketItemCard(
                    imagePath: AppImages.tomatoes,
                    tags: [
                      _buildTag(
                        'Produce',
                        const Color(0xFFE8F5E9),
                        const Color(0xFF2E7D32),
                      ),
                    ],
                    title: 'Fresh Tomatoes — Wholesale',
                    price: 'LKR 120 / kg (bulk)',
                    location: 'Nuwara Eliya · Hill Country Farms',
                  ),
                  const SizedBox(height: 12),
                  _buildMarketItemCard(
                    imagePath: AppImages.waterPump,
                    tags: [
                      _buildTag(
                        'Equipment',
                        const Color(0xFFE8F5E9),
                        const Color(0xFF2E7D32),
                      ),
                      _buildTag(
                        'Rental',
                        const Color(0xFFFFF3E0),
                        const Color(0xFFE65100),
                      ),
                    ],
                    title: 'Honda Water Pump — Rental',
                    price: 'LKR 1,200 / day',
                    location: 'Polonnaruwa · Farm Tools Rental',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }

  Widget _buildTag(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildMarketItemCard({
    required String imagePath,
    required List<Widget> tags,
    required String title,
    required String price,
    required String location,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Container(
              width: 110,
              height: 110,
              color: Colors.grey.shade300,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, color: Colors.grey, size: 40),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(spacing: 6, children: tags),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryAppColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
