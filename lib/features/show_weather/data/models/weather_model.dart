import 'package:minimal_weather/features/show_weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel(
      {required super.iconUrl,
      required super.temperature,
      required super.city,
      required super.code, required super.description});

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      city: map['city'] as String? ?? '',
      iconUrl: map['weather'][0]['icon'] as String,
      temperature: (map['main']['temp'] as double).toInt(),
      code: map['weather'][0]['id'] as int,
      description: map['weather'][0]['description'] as String,
    );
  }

  WeatherModel copyWith({
    String? iconUrl,
    int? temperature,
    String? city,
    int? weatherCode,
    String? description,
  }) {
    return WeatherModel(
      iconUrl: iconUrl ?? this.iconUrl,
      temperature: temperature ?? this.temperature,
      city: city ?? this.city,
      code: weatherCode ?? this.code,
      description: description ?? this.description,
    );
  }
}
