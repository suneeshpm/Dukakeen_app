import 'package:dukakeen_app/features/home/presentation/widgets/category_chip.dart';
import 'package:dukakeen_app/features/home/presentation/widgets/item_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/search_field.dart';
import '../widgets/brand_card.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> categoryChips = [
    {
      'icon': Icons.local_offer_outlined,
      'label': 'Deals',
      'gradient': AppColors.dealsGradient,
    },
    {
      'icon': Icons.flash_on_outlined,
      'label': 'Flash Sale',
      'gradient': AppColors.flashSaleGradient,
    },
    {
      'icon': Icons.confirmation_number_outlined,
      'label': 'Coupons',
      'gradient': AppColors.couponsGradient,
    },
    {
      'icon': Icons.star_border_outlined,
      'label': 'Brands',
      'gradient': AppColors.brandsGradient,
    },
  ];

  List categories = [
    {'name': 'Men', 'logo': 'assets/images/men.png'},
    {'name': 'Women', 'logo': 'assets/images/women.png'},
    {'name': 'Kids', 'logo': 'assets/images/kids.png'},
    {'name': 'Accessories', 'logo': 'assets/images/accessories.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColor = brightness == Brightness.dark
        ? AppColors.backgroundDark
        : AppColors.backgroundLight;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/shoping.svg',
              width: 24,
              height: 24,
              color: AppColors.primaryBlue,
            ),
            SizedBox(width: 8),
            Text(
              'ShopNow',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            color: AppColors.greyDark,
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                color: AppColors.greyDark,
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: const BoxDecoration(
                    color: AppColors.errorRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchField(),
            const SizedBox(height: 20),

            // ===== Banner Section =====
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 1.0,
              decoration: BoxDecoration(
                gradient: AppColors.saleGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Summer Sale',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Up to 70% off on selected items.\nDon’t miss out!',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Shop Now",
                        style: TextStyle(color: AppColors.primaryDark),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categoryChips.map((chip) {
                return ItemsChip(
                  icon: chip['icon'],
                  label: chip['label'],
                  gradient: chip['gradient'],
                  onTap: () {},
                );
              }).toList(),
            ),

            const SizedBox(height: 24),
            const SectionHeader(title: 'Categories'),
            const SizedBox(height: 12),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.125,
              child: NotificationListener(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryChip(
                      label: categories[index]['name'],
                      image: categories[index]['logo'],
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),
            const SectionHeader(title: 'Flash Sale'),
            const SizedBox(height: 12),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                primary: false,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: 'Running Shoes',
                    image: 'assets/images/shoes.jpg',
                    price: 49.99,
                    oldPrice: 89.99,
                    progress: 0.85,
                    tag: '50% OFF',
                    tagColor: AppColors.saleRed,
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: AppColors.dealGradient,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Deals',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Discover new savings and amazing offers every single day.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryBlue,
                    ),
                    child: const Text('Explore Now'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const SectionHeader(title: 'New Arrivals'),
            const SizedBox(height: 12),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                primary: false,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: 'Running Shoes',
                    image: 'assets/images/shoes.jpg',
                    price: 49.99,
                    oldPrice: 89.99,
                    progress: 0.85,
                    tag: '50% OFF',
                    tagColor: AppColors.saleRed,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'New Arrivals'),
            const SizedBox(height: 12),

            GridView.builder(
              padding: const EdgeInsets.all(8),
              physics:
                  const NeverScrollableScrollPhysics(), // use scroll from parent
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items per row
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                return BrandCard(
                  name: "Adidas",
                  logo: 'assets/images/adidas.png',
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
