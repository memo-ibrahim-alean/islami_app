import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';

import '../widget/custom_nav_bar_item.dart';

class LayoutPage extends StatefulWidget {
  static String routeName = "/layout";

  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        fixedColor: AppColors.white,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              iconPath: AppAssets.quranIcn,
              selectedIndex: selectedIndex,
              navBarItem: 0,
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon:
            CustomNavBarItem(
              iconPath: AppAssets.hadithIcn,
              selectedIndex: selectedIndex,
              navBarItem: 1,
            ),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              iconPath: AppAssets.sbhaIcn,
              selectedIndex: selectedIndex,
              navBarItem: 2,
            ),
            label: "Sbha",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              iconPath: AppAssets.radioIcn,
              selectedIndex: selectedIndex,
              navBarItem: 3,
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              iconPath: AppAssets.timesIcn,
              selectedIndex: selectedIndex,
              navBarItem: 4,
            ),
            label: "Times",
          ),
        ],
      ),
    );
  }
}
