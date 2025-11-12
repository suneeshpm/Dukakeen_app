import 'dart:developer';

import 'package:dukakeen_app/core/constants/app_colors.dart';
import 'package:dukakeen_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:dukakeen_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dukakeen_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final gradient = AppColors.getButtonGradient(brightness);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),

                // 🛍️ Logo circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryBlue.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: SvgPicture.asset(
                    'assets/icons/shoping.svg',
                    width: 48,
                    height: 48,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 36),

                // 👋 Welcome text
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryBlue,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 36),

                // ✉️ Email field
                CustomTextField(
                  controller: emailController,
                  hint: "Email or Username",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.email,
                ),
                const SizedBox(height: 18),

                // 🔒 Password field
                CustomTextField(
                  controller: passwordController,
                  hint: "Password",
                  icon: Icons.lock_outline,
                  obscure: _obscurePassword,
                  validator: Validator.password,
                  suffix: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.push('/forgot_password');
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // 🚀 Login button
                AuthButton(
                  gradient: gradient,
                  buttonName: "Login",
                  onPressed: () {
                    context.go('/home');
                    if (_formKey.currentState!.validate()) {
                      // ✅ All fields valid
                      debugPrint('✅ Login Successful');
                    }
                  },
                ),

                const SizedBox(height: 150),

                // // Divider with “or sign in with”
                // Row(
                //   children: [
                //     const Expanded(
                //       child: Divider(thickness: 1.2, color: Color(0xFFE0E0E0)),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 12),
                //       child: Text(
                //         "or sign in with",
                //         style: TextStyle(
                //           fontSize: 14,
                //           color: Colors.grey.shade600,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ),
                //     const Expanded(
                //       child: Divider(thickness: 1.2, color: Color(0xFFE0E0E0)),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 26),

                // // 🌐 Social buttons
                // Row(
                //   children: [
                //     SocialButton(
                //       asset: Icons.g_mobiledata,
                //       label: "Google",
                //       background: Colors.white,
                //       borderColor: const Color(0xFFE0E0E0),
                //       textColor: Colors.black87,
                //     ),
                //     const SizedBox(width: 14),
                //     SocialButton(
                //       asset: Icons.facebook,
                //       label: "Facebook",
                //       background: const Color(0xFF1877F2),
                //       borderColor: const Color(0xFF1877F2),
                //       textColor: Colors.white,
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 70),

                // 🧾 Signup text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account? ",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () => context.push('/signup'),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w700,
                        ),
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
