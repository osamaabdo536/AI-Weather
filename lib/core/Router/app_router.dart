import 'package:go_router/go_router.dart';
import 'package:weather/feature/auth/register/presentation/views/register_view.dart';

abstract class AppRouter{
  static const kHomeView = '/homeView';
  static const kHomeDetailsView = '/homeDetailsView';
  static const kSearchView = '/searchView';

  static final GoRouter router = GoRouter(
    routes:[
      GoRoute(
          path: '/',
          builder: (context, state) =>  const RegisterView()
      ),
    ],
  );
}