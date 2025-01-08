import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';

import '../../../../models/hadith_data.dart';

class HadithItemCard extends StatelessWidget {
  final HadithData hadithData;

  HadithItemCard({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithItemBackgroundImg),
          fit: BoxFit.cover, // Ensure the background image covers the container
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Add padding for better spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30), // Add spacing at the top
            Text(
              hadithData.hadithTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Janna',
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust text color if needed
              ),
            ),
            const SizedBox(height: 20), // Add spacing between title and content
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  hadithData.hadithContent,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20, // Adjust font size for content
                    fontFamily: 'Janna',
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Adjust text color if needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
