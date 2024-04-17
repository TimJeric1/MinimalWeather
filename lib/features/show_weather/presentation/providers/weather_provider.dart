import 'package:geolocator/geolocator.dart';
import 'package:minimal_weather/features/show_weather/domain/entities/weather_entity.dart';
import 'package:minimal_weather/features/show_weather/domain/usecases/get_weather.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_provider.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  late GetWeather _getWeather;

  @override
  Future<WeatherEntity> build() async {
    _getWeather = ref.read(getWeatherProvider);
    final Position position = await _getCurrentCoordinates();
    return await _getWeather.call(position);
  }

  Future<Position> _getCurrentCoordinates() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true);

    return position;
  }
}
