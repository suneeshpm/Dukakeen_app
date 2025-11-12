import 'dart:developer';

import 'package:dukakeen_app/core/constants/app_colors.dart';
import 'package:dukakeen_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:dukakeen_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                const SizedBox(height: 150),

                // 🛍️ Logo circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryBlue.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    size: 64,
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

                const SizedBox(height: 40),

                // 🚀 Login button
                AuthButton(
                  gradient: gradient,
                  buttonName: "Reset Password",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ✅ All fields valid
                      log('✅ Login Successful');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
