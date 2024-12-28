import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
