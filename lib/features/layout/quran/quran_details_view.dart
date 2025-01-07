import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';

import '../../../models/quran_data.dart';

class QuranDetailsView extends StatefulWidget {
  static String routeName = "QuranDetailsView";

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as QuranData;

    if (versesList.isEmpty) {
      loadData(args.suraId);
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranDetailsImg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
          title: Text(
            args.suraNameEn,
            style: TextStyle(
              fontFamily: "Janna",
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 40,
              ),
              child: Text(
                args.suraNameAr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => Text(
                  '[${index + 1}] ${versesList[index]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Janna",
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontSize: 20,
                  ),
                ),
                itemCount: versesList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> loadData(String suraID) async {
    String content = await rootBundle.loadString('assets/files/${suraID}.txt');
    setState(() {
      versesList = content.split('\n');
    });
    return content;
  }
}
