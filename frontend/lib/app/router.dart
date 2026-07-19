import 'package:go_router/go_router.dart';
import '../features/splash/splash_screen.dart';
import '../features/onboarding/welcome_screen.dart';
import '../features/workspace/workspace_select_screen.dart';
import '../features/onboarding/personal_setup_screen.dart';
import '../features/onboarding/preparing_screen.dart';
import '../features/dashboard/dashboard_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/workspace-select',
      builder: (context, state) => const WorkspaceSelectScreen(),
    ),
    GoRoute(
      path: '/personal-setup',
      builder: (context, state) => const PersonalSetupScreen(),
    ),
    GoRoute(
      path: '/preparing',
      builder: (context, state) => const PreparingScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
