import 'dart:convert';
import 'dart:developer';
import 'package:attandenceadmin/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:attandenceadmin/views/home_screen.dart';
import 'package:attandenceadmin/views/login_screen.dart';
import 'package:attandenceadmin/views/splash_screen.dart';
import 'package:attandenceadmin/views/role/role_add_screen.dart';
import 'package:attandenceadmin/views/user/user_view_screen.dart';
import 'package:attandenceadmin/config/Router/routing_service.dart';
import 'package:attandenceadmin/config/Router/page_router_name.dart';

class PageRouter {
  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();
  GoRouter goRouter = GoRouter(
    navigatorKey: RoutingService.navigatorKey,
    initialLocation: Routes.splashScreen.path,
    debugLogDiagnostics: true,
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const Scaffold(body: Center(child: Text("Page Not Found"))),
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: Routes.loginScreen.path,
        name: Routes.loginScreen.name,
        builder: (BuildContext context, GoRouterState state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.homeScreen.path,
        name: Routes.homeScreen.name,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      ),
      GoRoute(
        path: Routes.userScreen.path,
        name: Routes.userScreen.name,
        builder: (BuildContext context, GoRouterState state) => UserScreen(),
      ),
      GoRoute(
        path: Routes.groupChatScreen.path,
        name: Routes.groupChatScreen.name,
        builder: (BuildContext context, GoRouterState state) => GroupChatScreen(
          roomId: int.tryParse(
                  jsonDecode(state.pathParameters['room_id']!).toString()) ??
              0,
        ),
      ),
    ],
  );
}
