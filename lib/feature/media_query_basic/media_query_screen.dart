import 'package:flutter/material.dart';
import 'package:flutter_study/data/model/destination.dart';
import 'package:flutter_study/data/utils/color_utils.dart';
import 'package:flutter_study/feature/media_query_basic/aspect_ratio_screen.dart';
import 'package:flutter_study/feature/media_query_basic/padding_visualizer_screen.dart';
import 'package:flutter_study/feature/media_query_basic/product_card_screen.dart';
import 'package:flutter_study/feature/media_query_basic/responsive_container_screen.dart';
import 'package:flutter_study/feature/media_query_basic/responsive_grid_screen.dart';
import 'package:flutter_study/feature/media_query_basic/screen_size_display_screen.dart';
import 'package:flutter_study/feature/media_query_basic/text_scale_factor_screen.dart';
import 'package:get/get.dart';

class MediaQueryScreen extends StatelessWidget {
  const MediaQueryScreen({super.key});

  // Define destinations for media query screens
  List<Destination> get destinations => [
        const Destination(
          title: 'Screen Size Display',
          screen: ScreenSizeDisplay(),
        ),
        const Destination(
          title: 'Responsive Container',
          screen: ResponsiveContainerScreen(),
        ),
        const Destination(
          title: 'Responsive Grid',
          screen: ResponsiveGridScreen(),
        ),
        const Destination(
          title: 'Aspect Ratio',
          screen: AspectRatioScreen(),
        ),
        const Destination(
          title: 'Padding Visualizer',
          screen: PaddingVisualizer(),
        ),
        const Destination(
          title: 'Text Scale Factor',
          screen: TextScaleFactorScreen(),
        ),
        const Destination(
          title: 'Product Card',
          screen: ProductCardDemo(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Query Basic'),
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
                    screen = const ScreenSizeDisplay();
                    break;
                  case 1:
                    screen = const ResponsiveContainerScreen();
                    break;
                  case 2:
                    screen = const ResponsiveGridScreen();
                    break;
                  case 3:
                    screen = const AspectRatioScreen();
                    break;
                  case 4:
                    screen = const PaddingVisualizer();
                    break;
                  case 5:
                    screen = const TextScaleFactorScreen();
                    break;
                  case 6:
                    screen = const ProductCardDemo();
                    break;
                  default:
                    screen = const ScreenSizeDisplay();
                }
                Get.to(screen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                destination.title,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
