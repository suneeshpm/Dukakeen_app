import 'package:dukakeen_app/features/auth/presentation/pages/forgot_password.dart';
import 'package:dukakeen_app/features/auth/presentation/pages/login.dart';
import 'package:dukakeen_app/features/auth/presentation/pages/signup.dart';
import 'package:dukakeen_app/features/home/presentation/pages/bottom_nav.dart';
import 'package:dukakeen_app/features/onboarding/presentation/pages/onboarding.dart';
import 'package:dukakeen_app/features/splash/presentation/pages/splash.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),
    GoRoute(
      path: '/forgot_password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const BottomNavigationHome(),
    ),
  ],
);
