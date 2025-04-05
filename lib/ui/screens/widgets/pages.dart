import 'package:flutter/material.dart';

/////// page kaan waxxa lagu muujinayaa onboarding page icons ka and title
class Pages extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const Pages({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _createPage(
          image: image,
          title: title,
          description: description,
        ),
      ),
    );
  }

  Widget _createPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 350, child: Image.asset(image)),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green, // Use your primary color here
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
