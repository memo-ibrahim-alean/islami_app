import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/features/layout/layout_page.dart';

import 'intro_page_five.dart';
import 'intro_page_four.dart';
import 'intro_page_one.dart';
import 'intro_page_three.dart';
import 'intro_page_two.dart';

class PageViewExample extends StatefulWidget {
  static String routeName = "PageView";

  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: <Widget>[
            IntroPageOne(),
            IntroPageTwo(),
            IntroPageThree(),
            IntroPageFour(),
            IntroPageFive(),
          ],
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          totalPages: 5,
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToLayoutPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LayoutPage(),
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.totalPages,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: Text(
              'Back',
              style: TextStyle(
                fontSize: 23.0,
                color: AppColors.primaryColor, // Set the primary color here
              ),
            ),
          ),
          CustomPageIndicator(
            currentPageIndex: currentPageIndex,
            totalPages: totalPages,
            color: AppColors.introScreenColor,
            selectedColor: AppColors.primaryColor,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == totalPages - 1) {
                _navigateToLayoutPage(context);
              } else {
                onUpdateCurrentPageIndex(currentPageIndex + 1);
              }
            },
            icon: Text(
              'Next',
              style: TextStyle(
                fontSize: 23.0,
                color: AppColors.primaryColor, // Set the primary color here
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToLayoutPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LayoutPage(),
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      ),
    );
  }
}

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.currentPageIndex,
    required this.totalPages,
    required this.color,
    required this.selectedColor,
  });

  final int currentPageIndex;
  final int totalPages;
  final Color color;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalPages, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 12.0,
            width: index == currentPageIndex ? 24.0 : 14.0,
            decoration: BoxDecoration(
              color: index == currentPageIndex ? selectedColor : color,
              borderRadius: BorderRadius.circular(6.0),
            ),
          );
        }),
      ),
    );
  }
}
