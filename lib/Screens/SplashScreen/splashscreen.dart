import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:revive_app/utils/Theme/Colors.dart';
import 'package:revive_app/utils/Theme/routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/splash.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Text Section
              Column(
                children: const [
                  Text(
                    'Share Warmth, Spread Smiles, Make Impact',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Your old clothes can bring new joy to someone in need. Donate with one tap and make someone’s day brighter.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.Tertiarycolor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.Primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    context.go(AppRoutes.Login_Path);
                  },
                  child: const Text(
                    "Let's Get Started",
                    style: TextStyle(fontSize: 16, color: AppColors.BgColor),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Sign In Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      context.go(AppRoutes.Login_Path);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColors.Primarycolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
