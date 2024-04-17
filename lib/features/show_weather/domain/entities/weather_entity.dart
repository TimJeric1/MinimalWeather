

class WeatherEntity {
  final String city;
  final String iconUrl;
  final int temperature;

  WeatherEntity({required this.city,required this.iconUrl, required this.temperature});

  WeatherEntity copyWith({
    String? iconUrl,
    int? temperature,
    String? city,
  }) {
    return WeatherEntity(
      iconUrl: iconUrl ?? this.iconUrl,
      temperature: temperature ?? this.temperature,
      city: city ?? this.city,
    );
  }
}