import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/routes/page_routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_state.dart';

Future<void> main() async {
  setPathUrlStrategy();
  return runApp(
      ChangeNotifierProvider(create: (_) => AppState(), child: App()));
}
