import 'package:go_router/go_router.dart';

import '../../features/welcome/presentation/welcome_screen.dart';
import '../../features/store/presentation/product_details_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../features/store/presentation/store_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const WelcomeScreen(),
      routes: [
        GoRoute(
          path: 'search',
          builder: (_, __) => const SearchScreen(),
        ),
        GoRoute(
          path: 'store',
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) => ProductDetailScreen(
                id: state.params['id'],
              ),
            ),
          ],
          builder: (_, __) => const StoreScreen(),
        ),
      ],
    ),
  ],
);
