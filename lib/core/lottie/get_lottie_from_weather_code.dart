
String getLottieFromWeatherCode(int code) {
  final int hour = DateTime.now().hour;

  // Check if it's nighttime (between 6 PM and 6 AM)
  final bool isNightTime = hour < 6 || hour >= 18;

  switch (code ~/ 100) {
    case 2: // Thunderstorm
      return isNightTime ? 'night.json' : 'thunder.json';
    case 3: // Drizzle
      return isNightTime ? 'night.json' : 'partly_shower.json';
    case 5: // Rain
      return isNightTime ? 'rainy_night.json' : 'rainy.json';
    case 6: // Snow
      return isNightTime ? 'snow_night.json' : 'snow.json';
    case 7: // Atmosphere
      switch (code) {
        case 701: // Mist
        case 721: // Haze
        case 741: // Fog
          return 'mist.json';
        default:
          return 'cloudy.json';
      }
    case 8: // Clear or Clouds
      switch (code) {
        case 800: // Clear
          return isNightTime ? 'night.json' : 'sunny.json';
        case 801: // Few clouds
        case 802: // Scattered clouds
          return isNightTime ? 'partly_cloudy.json' : 'cloudy.json';
        case 803: // Broken clouds
        case 804: // Overcast clouds
          return 'cloudy.json';
        default:
          return 'cloudy.json';
      }
    default:
      return 'cloudy.json';
  }
}
