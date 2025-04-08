import 'package:flutter/material.dart';

class PaddingVisualizer extends StatelessWidget {
  const PaddingVisualizer({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final EdgeInsets padding = mediaQuery.padding;

    return Scaffold(
      body: Stack(
        children: [
          // Safe area content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Available Area',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Top Padding: ${padding.top.toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Bottom Padding: ${padding.bottom.toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Left Padding: ${padding.left.toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Right Padding: ${padding.right.toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),

          // Top padding visualization
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: padding.top,
              color: Colors.red.withOpacity(0.5),
              child: Center(
                child: Text(
                  'Top Padding ${padding.top.toStringAsFixed(1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Bottom padding visualization
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: padding.bottom,
              color: Colors.red.withOpacity(0.5),
              child: Center(
                child: Text(
                  'Bottom Padding ${padding.bottom.toStringAsFixed(1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Left padding visualization
          Positioned(
            top: padding.top,
            bottom: padding.bottom,
            left: 0,
            child: Container(
              width: padding.left,
              color: Colors.red.withOpacity(0.5),
            ),
          ),

          // Right padding visualization
          Positioned(
            top: padding.top,
            bottom: padding.bottom,
            right: 0,
            child: Container(
              width: padding.right,
              color: Colors.red.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
