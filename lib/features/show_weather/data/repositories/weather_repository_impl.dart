

import 'package:geolocator/geolocator.dart';
import 'package:minimal_weather/features/show_weather/data/datasources/weather_remote_data_source.dart';
import 'package:minimal_weather/features/show_weather/data/models/weather_model.dart';
import 'package:minimal_weather/features/show_weather/domain/repositories/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'weather_repository_impl.g.dart';

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  final remoteDateSource = ref.read(weatherRemoteDataSourceProvider);
  return WeatherRepositoryImpl(remoteDateSource);
}

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);




  @override
  Future<WeatherModel> getWeather(String city) async {
    return await remoteDataSource.getWeatherAtPosition(city);
  }

  @override
  Future<String> getPlacemarkFromCoordinates(Position position) async {
    return await remoteDataSource.getPlacemarkAtPosition(position);
  }

}