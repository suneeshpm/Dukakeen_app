import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class BrandCard extends StatelessWidget {
  final String name;
  final String logo;
  final VoidCallback? onTap;

  const BrandCard({
    super.key,
    required this.name,
    required this.logo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Image.asset(logo, height: 28),
            ),
            const SizedBox(height: 6),
            // Text(
            //   name,
            //   style: const TextStyle(
            //     fontSize: 12,

            //     fontWeight: FontWeight.w500,
            //     color: AppColors.greyDark,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
