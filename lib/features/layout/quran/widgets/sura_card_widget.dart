import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/models/quran_data.dart';

class SuraCardWidget extends StatelessWidget {
  final QuranData quranData;

  const SuraCardWidget({super.key, required this.quranData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.suraNumberIcn),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                quranData.suraId,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quranData.suraNameEn,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                quranData.suraVerses,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            quranData.suraNameAr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
