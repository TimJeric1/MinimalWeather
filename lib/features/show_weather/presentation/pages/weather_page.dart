import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:minimal_weather/features/show_weather/presentation/providers/weather_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherNotifierProvider);

    return Scaffold(
        body: weather.when(data: (weatherData) =>
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(height: 8),
                      Text('Lopar', style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium),
                    ],
                  ),
                  Image.network('https://openweathermap.org/img/wn/${weatherData.iconUrl}@4x.png'),
                  Text('${weatherData.temperature.toString()}°C', style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge)

                ],
              ),
            ),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => Center(child: CircularProgressIndicator()))
    );
  }
}
