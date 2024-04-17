class WeatherEntity {
  final String city;
  final String iconUrl;
  final int temperature;
  final int code;
  final String description;

  WeatherEntity(
      {required this.city,
      required this.iconUrl,
      required this.temperature,
      required this.code,
      required this.description});

  WeatherEntity copyWith({
    String? iconUrl,
    int? temperature,
    String? city,
    int? weatherCode,
    String? description,
  }) {
    return WeatherEntity(
      iconUrl: iconUrl ?? this.iconUrl,
      temperature: temperature ?? this.temperature,
      city: city ?? this.city,
      code: weatherCode ?? this.code,
      description: description ?? this.description,
    );
  }
}
