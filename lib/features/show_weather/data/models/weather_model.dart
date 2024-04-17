
import 'package:minimal_weather/features/show_weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({required super.iconUrl, required super.temperature, required super.city});


  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      city: map['city'] as String? ?? '',
      iconUrl: map['weather'][0] ['icon'] as String,
      temperature: (map['main']['temp'] as double).toInt(),
    );
  }

  WeatherModel copyWith({
    String? iconUrl,
    int? temperature,
    String? city,
  }) {
    return WeatherModel(
      iconUrl: iconUrl ?? this.iconUrl,
      temperature: temperature ?? this.temperature,
      city: city ?? this.city,
    );
  }

}