import 'package:flutter/material.dart';

class TextScaleFactorScreen extends StatefulWidget {
  const TextScaleFactorScreen({super.key});

  @override
  _TextScaleFactorScreenState createState() => _TextScaleFactorScreenState();
}

class _TextScaleFactorScreenState extends State<TextScaleFactorScreen> {
  double _customTextScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    final systemTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Size Adjustment Demo'),
      ),
      body: MediaQuery(
        // Apply custom text scale factor for simulation
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(_customTextScaleFactor),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text scale factor info
              Text(
                'System Text Scale Factor: ${systemTextScaleFactor.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Simulation Text Scale Factor: ${_customTextScaleFactor.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              // Slider to change text scale factor
              const SizedBox(height: 16),
              const Text('Adjust Text Size:'),
              Slider(
                value: _customTextScaleFactor,
                min: 0.5,
                max: 2.0,
                divisions: 15,
                label: _customTextScaleFactor.toStringAsFixed(2),
                onChanged: (value) {
                  setState(() {
                    _customTextScaleFactor = value;
                  });
                },
              ),

              const Divider(height: 32),

              // UI Examples with different text sizes
              Text(
                'Title Text',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Subtitle Text',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'This is regular body text. When the text size changes, this text will also be adjusted.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 24),

              // UI Element examples
              const Text('UI Element Examples:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Card with text example
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card Title',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This is the card content text. The size of this content will change according to the text size setting.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Button examples
              ElevatedButton(
                onPressed: () {},
                child: const Text('Standard Button'),
              ),

              const SizedBox(height: 8),

              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),

              const SizedBox(height: 16),

              // Form field example
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Input Field Label',
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              // Show padding adaptation example
              Container(
                padding: EdgeInsets.all(16 * _customTextScaleFactor),
                color: Colors.blue.withOpacity(0.2),
                child: const Text(
                  'Padding Adjustment Example: Padding is also adjusted to match text size.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
