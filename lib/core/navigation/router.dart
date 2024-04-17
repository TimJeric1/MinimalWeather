

import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:minimal_weather/core/permissions/location_permission_page.dart';
import 'package:minimal_weather/features/show_weather/presentation/pages/weather_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {

  return GoRouter(
    redirect: (context, state) async {
      final locationPermission = await Geolocator.checkPermission();
      if( locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse) {
        return WEATHER_PAGE_PATH;
      }
      return LOCATION_PERMISSION_PAGE_PATH;
    } ,
    routes: [
      GoRoute(
        path: WEATHER_PAGE_PATH,
        builder: (context, state) => const WeatherPage(),
      ),
      GoRoute(
        path: LOCATION_PERMISSION_PAGE_PATH,
        builder: (context, state) => const LocationPermissionPage(),
      ),

    ],
  );
}

const WEATHER_PAGE_PATH = "/weather";
const LOCATION_PERMISSION_PAGE_PATH = "/location_permission";
