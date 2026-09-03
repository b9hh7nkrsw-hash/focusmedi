import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/home/home_page.dart';
import '../features/permission_center/permission_center.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionCenterPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.go('/permissions'));

    return const Scaffold(
      body: Center(child: Text('Study Lock\n\n🎯🔒\nLoading...')),
    );
  }
}
