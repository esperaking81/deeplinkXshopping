import 'package:deeplink_cookbook/features/orders/presentation/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/cart/presentation/cart_screen.dart';
import '../../features/welcome/presentation/welcome_screen.dart';
import '../../features/startup/presentation/startup_screen.dart';
import '../../features/store/presentation/product_details_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../features/store/presentation/store_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const StartupScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (_, __) => const SearchScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (_, __) => const CartScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (_, __) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/store',
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => ProductDetailScreen(
            id: state.params['id'],
          ),
        )
      ],
      builder: (_, __) => const StoreScreen(),
    ),
    ShellRoute(
      builder: (context, state, Widget child) => Scaffold(body: child),
      routes: [
        GoRoute(path: '/order', builder: (_, __) => OrderScreen()),
      ],
    ),
  ],
);
