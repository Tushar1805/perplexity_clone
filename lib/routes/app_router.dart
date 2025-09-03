import 'package:flutter/material.dart';
import 'package:perplexity_clone/presentation/dashboard/view/chat_page.dart';
import '../presentation/auth/view/splash_screen.dart';
import '../presentation/dashboard/view/home.dart';
import 'app_routes.dart';
import 'error_screen.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<T> slideTransitionPage<T>({
  required Widget child,
  required LocalKey key,
}) {
  return CustomTransitionPage<T>(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeInOut)).animate(animation);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

final GoRouter router = GoRouter(
  initialLocation: splashScreen,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      name: splashScreen,
      path: splashScreen,
      pageBuilder: (final context, final state) {
        return slideTransitionPage(
          key: state.pageKey,
          child: SplashScreen(),
        );
      },
    ),

    GoRoute(
      name: homeScreen,
      path: homeScreen,
      pageBuilder: (final context, final state) {
        return slideTransitionPage(
          key: state.pageKey,
          child: HomeScreen(),
        );
      },
    ),
    GoRoute(
      name: chatPage,
      path: chatPage,
      pageBuilder: (final context, final state) {
        final params = state.extra as Map<String, dynamic>?;
        return slideTransitionPage(
          key: state.pageKey,
          child: ChatPage(
            question: params?['question'] as String?,
          ),
        );
      },
    ),

    // GoRoute(
    //   name: setLanguageScreen,
    //   path: setLanguageScreen,
    //   pageBuilder: (final context, final state) {
    //     final params = state.extra as Map<String, dynamic>?;
    //     return slideTransitionPage(
    //       key: state.pageKey,
    //       child: SelectLangScreen(
    //         onPop: params?['onPop'] as bool?,
    //       ),
    //     );
    //   },
    // ),
  ],
);
