import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> propertyImages = [
    'assets/room1.jpg',
    'assets/room2.jpg',
    'assets/room3.jpg',
    'assets/room4.jpg',
    'assets/room5.jpg',
    'assets/room6.jpg',
  ];

  String propertyName = 'The Ratan Tata Hotel';
  String propertyDescription =
      'Experience breathtaking views and luxury amenities.';

  List<String> propertyFeatures = [
    'Free Wifi',
    '24/7 Room Service',
    'Parking',
    'Refund',
    'Swimming Pool',
    'Gym',
  ];

  String propertyRules =
      'Specific rules for the property:\n- No smoking allowed in rooms.\n- Pets not allowed.';

  double propertyRating = 4.3;

  List<String> propertyReviews = [
    'The hotel rooms are amazing and very clean.',
    'The room service is excellent and prompt.',
    'The food quality is exceptional.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildCarousel(),
            const SizedBox(height: 16),
            // Center the property details
            Center(child: buildPropertyDetails()),
            const SizedBox(height: 16),
            buildPropertyFeatures(),
            const SizedBox(height: 16),
            buildPropertyRules(),
            const SizedBox(height: 16),
            buildRatingAndReviews(),
            const SizedBox(height: 16),
            buildPropertyLocationMap(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildCarousel() {
    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: propertyImages.isEmpty
          ? const SpinKitCircle(color: Colors.grey, size: 50)
          : PageView.builder(
        itemCount: propertyImages.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(propertyImages[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  Widget buildPropertyDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            propertyName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            propertyDescription,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildPropertyFeatures() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Features and services:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: propertyFeatures
                .map(
                  (feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      feature,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildPropertyRules() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rules:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            propertyRules,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget buildRatingAndReviews() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rating:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 8),
              Text(
                propertyRating.toStringAsFixed(1),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Reviews:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: propertyReviews
                .map(
                  (review) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- "$review"',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildPropertyLocationMap() {
    return Container(
      height: 200,
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(31.104605, 77.173424), // initial center coordinates (Shimla)
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'], // OSM subdomains
          ),
        ],
      ),
    );
  }
}