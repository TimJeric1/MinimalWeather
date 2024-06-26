import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weather/core/lottie/get_lottie_from_weather_code.dart';
import 'package:minimal_weather/features/show_weather/presentation/providers/weather_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherNotifierProvider);

    return Scaffold(
        body: weather.when(
            data: (weatherData) => Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_pin),
                          const SizedBox(height: 8),
                          Text(weatherData.city,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                      Lottie.asset(
                          'assets/${getLottieFromWeatherCode(weatherData.code)}'),
                      Column(
                        children: [
                          Text(weatherData.description,
                              style: Theme.of(context).textTheme.labelSmall),
                          Text('${weatherData.temperature.toString()}°C',
                              style: Theme.of(context).textTheme.displayLarge),
                        ],
                      )
                    ],
                  ),
                ),
            error: (error, _) => Center(
                    child: Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                )),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
