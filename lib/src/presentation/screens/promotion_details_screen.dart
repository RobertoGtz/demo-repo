import 'package:flutter/material.dart';

class PromotionDetailsScreen extends StatelessWidget {
  final String promotionTitle;
  final String promotionDescription;

  const PromotionDetailsScreen({
    Key? key,
    required this.promotionTitle,
    required this.promotionDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(promotionTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              promotionTitle,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16.0),
            Text(
              promotionDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}