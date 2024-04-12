

import 'package:go_router/go_router.dart';
import 'package:minimal_weather/features/show_weather/presentation/pages/weather_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {

  return GoRouter(
    initialLocation: WEATHER_PAGE_PATH,
    routes: [
      GoRoute(
        path: WEATHER_PAGE_PATH,
        builder: (context, state) => const WeatherPage(),
      ),

    ],
  );
}

const WEATHER_PAGE_PATH = "/weather";
