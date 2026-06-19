import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/widgets/promotional_banner_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: const [
          PromotionalBannerCarousel(),
          Expanded(
            child: Center(
              child: Text('Welcome to the demo app'),
            ),
          ),
        ],
      ),
    );
  }
}