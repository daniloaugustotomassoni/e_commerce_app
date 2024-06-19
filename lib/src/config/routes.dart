import 'package:e_commerce_app/src/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen())
]);
