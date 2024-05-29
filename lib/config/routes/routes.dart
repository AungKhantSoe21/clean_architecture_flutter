// GoRouter configuration
import 'package:go_router/go_router.dart';

import '../../features/countries/presentation/pages/country_detail.dart';
import '../../features/countries/presentation/pages/home.dart';
import '../../features/countries/presentation/pages/search_country.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
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