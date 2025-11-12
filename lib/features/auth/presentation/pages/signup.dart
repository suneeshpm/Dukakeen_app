import 'package:dukakeen_app/core/constants/app_colors.dart';
import 'package:dukakeen_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    // ===== Theme-based colors =====
    final backgroundColor = brightness == Brightness.dark
        ? AppColors.backgroundDark
        : AppColors.backgroundLight;

    final textColor = brightness == Brightness.dark
        ? AppColors.textDark
        : const Color(0xFF1A1A1A);

    final secondaryTextColor = brightness == Brightness.dark
        ? AppColors.secondaryTextDark
        : const Color(0xFF6B7280);

    final iconColor = brightness == Brightness.dark
        ? AppColors.textDark
        : AppColors.primaryBlue;

    final gradient = AppColors.getButtonGradient(brightness);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // ===== App Icon =====
                CircleAvatar(
                  radius: 45,
                  backgroundColor: iconColor.withOpacity(0.1),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 50,
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 32),

                // ===== Title =====
                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 36),

                // ===== Input Fields =====
                CustomTextField(
                  controller: _nameController,
                  icon: Icons.person_outline,
                  hint: 'Full Name',
                  validator: (v) =>
                      Validator.required(v, fieldName: 'Full Name'),
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  controller: _emailController,
                  icon: Icons.email_outlined,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.email,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  controller: _passwordController,
                  icon: Icons.lock_outline,
                  hint: 'Password',
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
                const SizedBox(height: 16),

                CustomTextField(
                  controller: _confirmController,
                  icon: Icons.lock_outline,
                  hint: 'Confirm Password',
                  obscure: _obscureConfirmPassword,
                  suffix: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      );
                    },
                  ),
                  validator: (v) =>
                      Validator.confirmPassword(v, _passwordController.text),
                ),
                const SizedBox(height: 32),

                // ===== Sign Up Button =====
                AuthButton(
                  gradient: gradient,
                  buttonName: "Sign Up",
                  onPressed: () {
                    context.go('/home');
                    if (_formKey.currentState!.validate()) {
                      debugPrint('✅ Sign Up Successful');
                    }
                  },
                ),
                const SizedBox(height: 80),

                // ===== Divider =====
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

                // // ===== Social Buttons =====
                // Row(
                //   children: [
                //     Expanded(
                //       child: SocialButton(
                //         asset: Icons.g_mobiledata,
                //         label: "Google",
                //         background: Colors.white,
                //         borderColor: const Color(0xFFE0E0E0),
                //         textColor: Colors.black87,
                //       ),
                //     ),
                //     const SizedBox(width: 14),
                //     Expanded(
                //       child: SocialButton(
                //         asset: Icons.facebook,
                //         label: "Facebook",
                //         background: const Color(0xFF1877F2),
                //         borderColor: const Color(0xFF1877F2),
                //         textColor: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 32),

                // ===== Already have an account =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to login
                      },
                      child: Text(
                        'Sign in',
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
