import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sih1309/client/screens/news_api.dart';
import 'package:sih1309/client/screens/news_screen.dart';
import 'package:sih1309/client/screens/wool_quality.dart';

import '../app_state.dart';
import '../client/home/home_screen.dart';
import '../client/screens/error_screen.dart';
import '../client/screens/inventory/inventory_management.dart';
import '../client/screens/marketplace/marketplace_screen.dart';
import '../client/screens/notifications_screen.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp.router(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: Provider.of<AppState>(context).isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light,
        color: Color.fromARGB(255, 255, 253, 253),
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        // routerDelegate: appRouter().router.routerDelegate,
        // routeInformationParser: appRouter().router.routeInformationParser,
        // routeInformationProvider: appRouter().router.routeInformationProvider,
        debugShowCheckedModeBanner: false);
  }

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: <GoRoute>[
      GoRoute(
          routes: <GoRoute>[
            GoRoute(
              path: 'homepage',
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeScreen(),
            ),
            GoRoute(
              path: 'news',
              builder: (BuildContext context, GoRouterState state) =>
                  const NewsScreen(),
            ),
            GoRoute(
              path: 'notifications',
              builder: (BuildContext context, GoRouterState state) =>
                  const NotificationScreen(),
            ),
            GoRoute(
              path: 'inventory',
              builder: (BuildContext context, GoRouterState state) =>
                  const InventoryMgmnt(),
            ),
            GoRoute(
              path: 'woolquality',
              builder: (BuildContext context, GoRouterState state) =>
                  const WoolQuality(),
            ),
            GoRoute(
              path: 'marketplace',
              builder: (BuildContext context, GoRouterState state) =>
                  const MarketPlace(),
            ),
          ],
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          })
    ],
  );
}
