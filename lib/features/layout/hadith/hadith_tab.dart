import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/features/layout/hadith/widgets/hadith_item_card.dart';

import '../../../core/constants/app_assets.dart';
import '../../../models/hadith_data.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithData> hadithList = [];
  final List<String> hadithFileNames =
      List.generate(50, (index) => 'h${index + 1}.txt');

  @override
  void initState() {
    super.initState();
    loadAllHadithData(); // Load data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithBG),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.introScreenLogo,
              height: size.height * 0.23,
            ),
            Expanded(
              child: CarouselSlider(
                items: hadithList.map((e) {
                  return HadithItemCard(hadithData: e);
                }).toList(),
                options: CarouselOptions(
                  aspectRatio: 0.7,
                  viewportFraction: 0.68,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void loadAllHadithData() async {
    for (String fileName in hadithFileNames) {
      String content =
          await rootBundle.loadString('assets/files/Hadeeth/$fileName');
      List<String> singleHadith = content.split('\n');
      String hadithTitle =
          singleHadith[0].substring(0, singleHadith[0].length - 1);
      String hadithContent =
          singleHadith[1].substring(0, singleHadith[1].length - 1);

      // Extract the ID from the filename (e.g., "h1.txt" -> "1")
      String hadithId = fileName.replaceAll('h', '').replaceAll('.txt', '');

      var hadithData = HadithData(
        hadithId: hadithId,
        hadithTitle: hadithTitle,
        hadithContent: hadithContent,
      );

      hadithList.add(hadithData);
    }
    setState(() {}); // Update the UI after loading data
  }
}