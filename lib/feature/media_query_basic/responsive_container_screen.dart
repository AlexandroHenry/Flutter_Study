import 'package:flutter/material.dart';

class ResponsiveContainerScreen extends StatelessWidget {
  const ResponsiveContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceType = size.width < 600 ? 'Phone' : 'Tablet';

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Demo ($deviceType)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Device info
            Text(
              'Screen: ${size.width.toStringAsFixed(1)} × ${size.height.toStringAsFixed(1)} ($deviceType)',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Responsive container (80% width, 30% height)
            Container(
              width: size.width * 0.8,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '80% x 30%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Width: ${(size.width * 0.8).toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Height: ${(size.height * 0.3).toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Responsive container (50% width, 20% height)
            Container(
              width: size.width * 0.5,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '50% x 20%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Width: ${(size.width * 0.5).toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Height: ${(size.height * 0.2).toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
