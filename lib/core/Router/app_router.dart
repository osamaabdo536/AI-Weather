import 'package:go_router/go_router.dart';
import 'package:weather/feature/auth/login/presentation/views/login_view.dart';
import 'package:weather/feature/auth/register/presentation/views/register_view.dart';

abstract class AppRouter{
  static const loginView = '/loginView';
  static const registerView = '/registerView';

  static final GoRouter router = GoRouter(
    routes:[
      GoRoute(
          path: '/',
          builder: (context, state) =>  const LoginView()
      ),
      GoRoute(
          path: loginView,
          builder: (context, state) =>  const LoginView()
      ),
      GoRoute(
          path: registerView,
          builder: (context, state) =>  const RegisterView()
      ),
    ],
  );
}