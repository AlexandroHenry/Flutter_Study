import 'package:flutter/material.dart';
import 'package:flutter_study/data/model/destination.dart';
import 'package:flutter_study/data/utils/color_utils.dart';
import 'package:flutter_study/feature/media_query_basic/media_query_screen.dart';
import 'package:flutter_study/feature/syncfusion_chart/syncfusion_chart_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Define destinations (screens to navigate to)
  List<Destination> get destinations => [
        const Destination(
          title: 'Syncfusion Chart',
          screen: SyncfusionChartScreen(),
        ),
        const Destination(
          title: 'Media Query Basic',
          screen: MediaQueryScreen(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          final color = ColorUtils.getColorByIndex(index);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Widget screen;
                switch (index) {
                  case 0:
                    screen = const SyncfusionChartScreen();
                    break;
                  case 1:
                    screen = const MediaQueryScreen();
                    break;
                  default:
                    screen = const SyncfusionChartScreen();
                }
                Get.to(screen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                destination.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
