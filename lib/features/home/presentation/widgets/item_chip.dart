import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ItemsChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final LinearGradient? gradient;
  final VoidCallback? onTap;

  const ItemsChip({
    super.key,
    required this.icon,
    required this.label,
    this.color,
    this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null ? color ?? AppColors.primaryBlue : null,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
