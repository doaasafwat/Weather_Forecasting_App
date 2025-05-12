import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2533),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'About Weatherly',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Weatherly is a simple and reliable weather app that gives you accurate forecasts and real-time updates. With a clean design and easy navigation, it\'s your perfect daily weather companion.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Key Features',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const FeatureItem(title: 'Live weather updates'),
              const FeatureItem(title: 'Multi-city tracking'),
              const FeatureItem(title: 'Location-based forecasts'),
              const FeatureItem(title: 'Dark mode support'),
              const SizedBox(height: 30),
              const Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF5C4DB1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'To help you stay prepared with accurate and easy-to-access weather info—anytime, anywhere.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
              ),
              const Spacer(),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Have feedback? Email us at',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.envelope,
                          color: Color(0xFF7B61FF),
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'support@weatherlyapp.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  const FeatureItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: Color(0xFF7B61FF),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
