import 'package:feeding_application/home/views/bin_level_view.dart';
import 'package:feeding_application/home/views/home_view.dart';
import 'package:feeding_application/home/views/job_view.dart';
import 'package:feeding_application/home/views/more_view.dart';
import 'package:feeding_application/home/views/request_view.dart';
import 'package:feeding_application/login/views/login_view.dart';
import 'package:feeding_application/register/views/employer_register_view.dart';
import 'package:feeding_application/register/views/register_initial_view.dart';
import 'package:feeding_application/register/views/restaurant_register_view.dart';
import 'package:feeding_application/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return const RegisterView();
      },
    ),
    GoRoute(
      path: '/register-employer',
      builder: (context, state) {
        return const EmployerRegisterView();
      },
    ),
    GoRoute(
      path: '/register-restaurant',
      builder: (context, state) {
        return const RestaurantRegisterView();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginView();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return HomeView(child: child);
      },
      routes: [
        GoRoute(
          path: '/jobs',
          builder: (context, state) => const JobView(),
        ),
        GoRoute(
          path: '/bins',
          builder: (context, state) => const BinLevelView(),
        ),
        GoRoute(
          path: '/create-request',
          builder: (context, state) => const RequestView(),
        ),
        GoRoute(
          path: '/more',
          builder: (context, state) => const MoreView(),
        ),
      ],
    ),
  ],
);
