import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Welcome to Dukakeen!",
      "subtitle":
          "Discover a world of endless shopping possibilities. Your next favorite item is just a tap away.",
      "icon": 'assets/icons/shoping.svg',
    },
    {
      "title": "Fast & Secure",
      "subtitle":
          "Experience lightning-fast delivery with trusted payment methods.",
      "icon": 'assets/icons/shoping.svg',
    },
    {
      "title": "Shop Smart",
      "subtitle": "Get exclusive offers and deals personalized just for you.",
      "icon": 'assets/icons/shoping.svg',
    },
  ];

  @override
  void initState() {
    super.initState();

    // Auto slide every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < onboardingData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

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
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return _buildPage(
                    title: onboardingData[index]['title']!,
                    subtitle: onboardingData[index]['subtitle']!,
                    icon: onboardingData[index]['icon'],
                    textColor: textColor,
                    secondaryTextColor: secondaryTextColor,
                    brightness: brightness,
                  );
                },
              ),
            ),
            _buildDots(brightness),
            const SizedBox(height: 30),
            _buildNextButton(brightness),
            const SizedBox(height: 16),
            // _buildSkipButton(brightness),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String subtitle,
    required String icon,
    required Color textColor,
    required Color secondaryTextColor,
    required Brightness brightness,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 Themed logo circle
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white.withOpacity(
              brightness == Brightness.dark ? 0.2 : 0.15,
            ),
            child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                icon,
                color: AppColors.primaryBlue,
                width: 60,
                height: 60,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // 🔹 Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: secondaryTextColor.withOpacity(0.85),
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDots(Brightness brightness) {
    final activeColor = brightness == Brightness.dark
        ? Colors.black87
        : Colors.white;
    final inactiveColor = brightness == Brightness.dark
        ? Colors.black26
        : Colors.white54;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 10 : 8,
          height: _currentPage == index ? 10 : 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? activeColor : inactiveColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _nextPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDark ? AppColors.primaryBlue : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "Next",
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.primaryBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton(Brightness brightness) {
    final textColor = brightness == Brightness.dark
        ? Colors.white70
        : Colors.black54;

    return GestureDetector(
      onTap: () => context.go('/home'),
      child: Text(
        "Skip",
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
