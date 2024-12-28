import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/models/quran_data.dart';

class RecentCardWidget extends StatelessWidget {
  final QuranData quranData;

  const RecentCardWidget({super.key, required this.quranData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      // height: 150,
      // width: 285,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                quranData.suraNameEn,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                quranData.suraNameAr,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${quranData.suraVerses} Verses",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Image.asset(AppAssets.recentImage)
        ],
      ),
    );
  }
}
