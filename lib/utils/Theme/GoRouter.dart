import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:revive_app/Blocs/AuthBlocs/signupbloc.dart';
import 'package:revive_app/Screens/AuthScreens/loginscreen.dart';
import 'package:revive_app/Screens/AuthScreens/signupscreen.dart';
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

      GoRoute(
        path: AppRoutes.Signup_Path,
        name: AppRoutes.Signup_Name,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignupBloc(),
            child: SignupScreen(),
          );
        },
      ),
    ],
  );
}
