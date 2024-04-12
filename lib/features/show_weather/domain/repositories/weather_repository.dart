

import 'package:geolocator/geolocator.dart';
import 'package:minimal_weather/features/show_weather/data/models/weather_model.dart';

abstract interface class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
  Future<String> getPlacemarkFromCoordinates(Position position);
}