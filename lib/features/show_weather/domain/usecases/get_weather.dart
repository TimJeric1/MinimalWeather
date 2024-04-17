


import 'package:geolocator/geolocator.dart';
import 'package:minimal_weather/features/show_weather/data/repositories/weather_repository_impl.dart';
import 'package:minimal_weather/features/show_weather/domain/entities/weather_entity.dart';
import 'package:minimal_weather/features/show_weather/domain/repositories/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'get_weather.g.dart';

@riverpod
GetWeather getWeather(GetWeatherRef ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return GetWeather(weatherRepository: weatherRepository);
}

class GetWeather {
  final WeatherRepository weatherRepository;

  GetWeather({required this.weatherRepository});

  Future<WeatherEntity> call(Position position) async {
    return await weatherRepository.getWeatherFromCoordinates(position);
  }


}