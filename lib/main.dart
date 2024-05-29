import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/routes/routes.dart';
import 'config/themes/app_themes.dart';
import 'core/constants/text_constants.dart';
import 'core/services/db.dart';
import 'core/services/dependecies_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  DBService.initizateDb();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: TextConstants.appTitle,
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      darkTheme: dartTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}