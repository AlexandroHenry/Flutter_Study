import 'package:flutter/material.dart';

class ProductCardDemo extends StatelessWidget {
  const ProductCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Product Card Layout'),
      ),
      body: ListView(
        padding: EdgeInsets.all(isLandscape ? 8.0 : 16.0), // Smaller padding in landscape
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          // Orientation info - more compact in landscape
          Container(
            padding: EdgeInsets.all(isLandscape ? 8.0 : 12.0),
            margin: EdgeInsets.only(bottom: isLandscape ? 8.0 : 16.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  isLandscape ? Icons.stay_current_landscape : Icons.stay_current_portrait,
                  size: isLandscape ? 20 : 24,
                ),
                SizedBox(width: isLandscape ? 8.0 : 12.0),
                Text(
                  'Current Mode: ${isLandscape ? "Landscape" : "Portrait"}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isLandscape ? 14.0 : 16.0,
                  ),
                ),
              ],
            ),
          ),

          // Product cards with smaller margins in landscape
          const ResponsiveProductCard(
            title: 'Premium Bluetooth Headphones',
            imageUrl: 'https://www.costco.co.kr/medias/sys_master/images/h0e/h0e/273593857966110.jpg',
            price: 299.99,
          ),

          SizedBox(height: isLandscape ? 8.0 : 16.0),

          const ResponsiveProductCard(
            title: 'Smart Watch Series X',
            imageUrl: 'https://www.lifewire.com/thmb/7pWNOOgumLAsL_4xVqDTVHjwFD0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Apple-Watch-Ultra-2-23e8ec3e4ee04c6e98c9d654a35f59ec.jpg',
            price: 349.99,
          ),

          SizedBox(height: isLandscape ? 8.0 : 16.0),

          const ResponsiveProductCard(
            title: 'Ultra-Fast Wireless Charger',
            imageUrl: 'https://i.gadgets360cdn.com/large/apple_magsafe_battery_pack_iphone_12_pro_max_image_1626241582183.jpg',
            price: 59.99,
          ),
        ],
      ),
    );
  }
}

class ResponsiveProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;

  const ResponsiveProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final width = mediaQuery.size.width;
    final safeAreaBottom = mediaQuery.padding.bottom;

    // Adapt card size based on screen size and orientation
    final cardWidth = isLandscape
        ? (width < 600 ? width * 0.8 : width * 0.4) // Slightly narrower in landscape
        : (width < 600 ? width * 0.9 : width * 0.4); // Regular width in portrait

    // Different layouts for portrait and landscape
    if (isLandscape) {
      return _buildLandscapeCard(context, cardWidth, safeAreaBottom);
    } else {
      return _buildPortraitCard(context, cardWidth);
    }
  }

  Widget _buildPortraitCard(BuildContext context, double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Content section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          ),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      icon: const Icon(Icons.favorite_border, size: 18),
                      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeCard(BuildContext context, double width, double safeAreaBottom) {
    // Calculate a more appropriate height for landscape mode
    final screenHeight = MediaQuery.of(context).size.height;
    // Increase the height proportions while still considering screen size
    final cardHeight = screenHeight < 400
        ? screenHeight * 0.35 // Increased from 0.15 to 0.22 for small screens
        : screenHeight * 0.25; // Increased from 0.18 to 0.25 for normal screens

    return Container(
      width: width,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image section
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              width: width * 0.35, // Increased from 0.3 to 0.35
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Content section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10), // Increased from 8 to 10
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16, // Increased from 14 to 16
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Increased from 1 to 2 lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6), // Increased from 4 to 6
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14, // Increased from 12 to 14
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(height: 8), // Increased from 6 to 8
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 6, horizontal: 6), // Increased padding
                            ),
                            minimumSize: WidgetStateProperty.all(const Size(0, 32)), // Increased from 28 to 32
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(fontSize: 12), // Increased from 10 to 12
                          ),
                        ),
                      ),
                      const SizedBox(width: 4), // Increased from 2 to 4
                      IconButton(
                        icon: const Icon(Icons.favorite_border, size: 18), // Increased from 16 to 18
                        constraints: const BoxConstraints(minWidth: 32, minHeight: 32), // Increased from 24x24 to 32x32
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
