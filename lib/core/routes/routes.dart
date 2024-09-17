import 'package:feeding_application/register/views/employer_register_view.dart';
import 'package:feeding_application/register/views/register_initial_view.dart';
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
  ],
);
