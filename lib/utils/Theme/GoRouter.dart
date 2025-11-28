import 'package:go_router/go_router.dart';
import 'package:revive_app/Screens/AuthScreens/loginscreen.dart';
import 'package:revive_app/Screens/SplashScreen/splashscreen.dart';
import 'package:revive_app/utils/Theme/routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/splashscreen",
    routes: [
      GoRoute(
        path: AppRoutes.Onboarding_Path,
        name: AppRoutes.Onboarding_Name,
        builder: (context, state) {
          return OnboardingScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.Login_Path,
        name: AppRoutes.Login_Name,
        builder: (context, state) {
          return Loginscreen();
        },
      ),
    ],
  );
}
