// GoRouter configuration
import 'package:clean_architecture_flutter/core/utils/constants/app_route_constants.dart';
import 'package:go_router/go_router.dart';

import '../../features/countries/presentation/pages/country_detail.dart';
import '../../features/countries/presentation/pages/home.dart';
import '../../features/countries/presentation/pages/search_country.dart';

class AppRoutes {
  static final routes = GoRouter(
  initialLocation: AppRouteConstants.initialRoutePath,
  routes: [
    GoRoute(
      name: AppRouteConstants.initialRouteName, // Optional, add name to your routes. Allows you navigate by name instead of path
      path: AppRouteConstants.initialRoutePath,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      name: 'searchCountry',
      path: '/searchCountry',
      builder: (context, state) => const SearchCountry(),
    ),
    GoRoute(
      name: 'countryDetail',
      path: '/countryDetail',
      builder: (context, state) => const CountryDetail(),
    ),
  ],
);
}