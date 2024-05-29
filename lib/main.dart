import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routes/routes.dart';
import 'core/themes/app_themes.dart';
import 'core/utils/constants/text_constants.dart';
import 'core/db/db.dart';
import 'core/utils/dependecies_container.dart';

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