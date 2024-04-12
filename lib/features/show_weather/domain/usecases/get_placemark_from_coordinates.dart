


import 'package:geolocator/geolocator.dart';
import 'package:minimal_weather/features/show_weather/data/repositories/weather_repository_impl.dart';
import 'package:minimal_weather/features/show_weather/domain/repositories/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'get_placemark_from_coordinates.g.dart';

@riverpod
GetPlacemarkFromCoordinates getPlacemarkFromCoordinates (GetPlacemarkFromCoordinatesRef ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return GetPlacemarkFromCoordinates(weatherRepository: weatherRepository);
}

class GetPlacemarkFromCoordinates {
  final WeatherRepository weatherRepository;

  GetPlacemarkFromCoordinates({required this.weatherRepository});

  Future<String> call(Position position) async {
    return await weatherRepository.getPlacemarkFromCoordinates(position);
  }


}