import 'package:flutter/material.dart';

class AspectRatioScreen extends StatelessWidget {
  const AspectRatioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final aspectRatio = size.width / size.height;

    // Determine UI type based on aspect ratio
    final String layoutType;
    final Color containerColor;

    if (aspectRatio < 0.5) {
      layoutType = 'Very Narrow Screen (< 0.5)';
      containerColor = Colors.red;
    } else if (aspectRatio < 0.7) {
      layoutType = 'Narrow Screen (0.5 - 0.7)';
      containerColor = Colors.orange;
    } else if (aspectRatio < 1.0) {
      layoutType = 'Normal Portrait (0.7 - 1.0)';
      containerColor = Colors.green;
    } else if (aspectRatio < 1.7) {
      layoutType = 'Landscape (1.0 - 1.7)';
      containerColor = Colors.blue;
    } else {
      layoutType = 'Wide Screen (> 1.7)';
      containerColor = Colors.purple;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Changes Based on Aspect Ratio'),
      ),
      body: Column(
        children: [
          // Information section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Text(
                  'Aspect Ratio: ${aspectRatio.toStringAsFixed(3)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Screen Size: ${size.width.toStringAsFixed(1)} × ${size.height.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Layout Type: $layoutType',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: containerColor,
                  ),
                ),
              ],
            ),
          ),

          // Responsive content based on aspect ratio
          Expanded(
            child: Center(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: containerColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getIconForAspectRatio(aspectRatio),
                      size: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      layoutType,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ratio: ${aspectRatio.toStringAsFixed(3)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForAspectRatio(double ratio) {
    if (ratio < 0.5) return Icons.smartphone;
    if (ratio < 0.7) return Icons.phone_android;
    if (ratio < 1.0) return Icons.stay_current_portrait;
    if (ratio < 1.7) return Icons.stay_current_landscape;
    return Icons.tv;
  }
}
