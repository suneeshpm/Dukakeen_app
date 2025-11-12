import 'package:dukakeen_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/search_field.dart';
import '../widgets/product_widget.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  List categories = [
    {'name': 'Men', 'logo': 'assets/images/men.png'},
    {'name': 'Women', 'logo': 'assets/images/women.png'},
    {'name': 'Kids', 'logo': 'assets/images/kids.png'},
    {'name': 'Accessories', 'logo': 'assets/images/accessories.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        title: Row(
          children: [
            Icon(Icons.category, color: AppColors.primaryBlue),
            SizedBox(width: 10),
            Text('Categories', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SearchField(),
              const SizedBox(height: 20),
              ListView.builder(
                itemBuilder: (context, index) {
                  return SneakerWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
