import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:minimal_weather/features/show_weather/data/models/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'weather_remote_data_source.g.dart';
@riverpod
Dio dio (DioRef ref) {
  return Dio();
}

@riverpod
WeatherRemoteDataSource weatherRemoteDataSource(WeatherRemoteDataSourceRef ref) {
  final dio = ref.watch(dioProvider);
  return WeatherRemoteDataSourceImpl(dio: dio);
}

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherAtPosition(Position position);
  Future<String> getPlacemarkAtPosition(Position position);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl({required this.dio});

  @override
  Future<WeatherModel> getWeatherAtPosition(Position position) async {
    final Response response;
    response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'lat': position.latitude,
        'lon': position.longitude,
        'appid': '120b714f26a0ef6926aa48a5621da952',
        'units': 'metric'
      },
    );

      return WeatherModel.fromMap(response.data);

  }

  @override
  Future<String> getPlacemarkAtPosition(Position position) async {
    final response = await dio.get(
      'http://api.openweathermap.org/geo/1.0/reverse',
      queryParameters: {
        'lat': position.latitude,
        'lon': position.longitude,
        'appid': '120b714f26a0ef6926aa48a5621da952',
      },
    );

    return response.data[0]['name'];

  }
}