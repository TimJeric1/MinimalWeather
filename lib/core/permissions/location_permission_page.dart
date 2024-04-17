import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionPage extends StatelessWidget {
  const LocationPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<LocationPermission>(
          future: Geolocator.requestPermission(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data == LocationPermission.always || snapshot.data == LocationPermission.whileInUse) {
                return const Text(
                  'Permission is granted, you will be navigated away shortly.',
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.data == LocationPermission.deniedForever) {
                return const Text(
                  'Location permission permanently denied.\n Please enable it from system settings to show accurate weather data.',
                  textAlign: TextAlign.center,
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Location permission needed to show accurate weather data.',
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Geolocator.requestPermission();
                      },
                      child: const Text('Grant Location Permission'),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
