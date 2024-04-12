import 'package:geolocator/geolocator.dart';
import 'package:minimal_weather/features/show_weather/domain/entities/weather_entity.dart';
import 'package:minimal_weather/features/show_weather/domain/usecases/get_placemark_from_coordinates.dart';
import 'package:minimal_weather/features/show_weather/domain/usecases/get_weather.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_provider.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  late GetWeather _getWeather;
  late GetPlacemarkFromCoordinates _getPlacemark;

  @override
  Future<WeatherEntity> build() async{
    _getWeather = ref.read(getWeatherProvider);
    _getPlacemark = ref.read(getPlacemarkFromCoordinatesProvider);
    final String placemark = await _getCurrentPlacemark();
    return _getWeather.call(placemark);
  }

  Future<String> _getCurrentPlacemark() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    final position = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high, forceAndroidLocationManager: true);

    final String placemark = await _getPlacemark.call(position);

    return placemark;
  }
}
