import 'package:dukakeen_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  void _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));

    final isFirstTime = true; // Replace with shared_preferences logic
    final isLoggedIn = false; // Replace with secure storage logic

    if (isFirstTime) {
      context.go('/onboarding');
    } else if (!isLoggedIn) {
      context.go('/login');
    } else {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    // Pick gradient and text colors based on theme
    final gradient = AppColors.getSplashGradient(brightness);
    final textColor = brightness == Brightness.dark
        ? AppColors.textDark
        : AppColors.textLight;
    final secondaryTextColor = brightness == Brightness.dark
        ? AppColors.secondaryTextDark
        : AppColors.secondaryTextLight;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ===== Logo Circle =====
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          'assets/icons/shoping.svg',
                          color: AppColors.primaryBlue,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // ===== App Title =====
                    Text(
                      "Dukakeen",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // ===== Subtitle =====
                    Text(
                      "Your One-Stop Shop",
                      style: TextStyle(
                        color: secondaryTextColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                // ===== Loader and Label =====
                Column(
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Loading your awesome deals...",
                      style: TextStyle(
                        color: secondaryTextColor.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
