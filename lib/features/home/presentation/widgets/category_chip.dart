import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.borderLight,
              backgroundImage: AssetImage(image),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.greyDark),
          ),
        ],
      ),
    );
  }
}
