import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/features/onbording/pages/page_view.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "splash";
  static final Duration _duration = Duration(
    milliseconds: 1750,
  );

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          // LayoutPage.routeName,
          PageViewExample.routeName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.splashBG,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FadeInDown(
                duration: SplashPage._duration,
                child: Image.asset(
                  AppAssets.splashGlow,
                  height: size.height * 0.30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: SplashPage._duration,
                child: Image.asset(
                  AppAssets.splashLogo,
                  width: size.width * 0.50,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FadeInUp(
                duration: SplashPage._duration,
                child: Image.asset(
                  AppAssets.splashBrand,
                  height: size.height * 0.25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FadeInUp(
                duration: SplashPage._duration,
                child: Image.asset(
                  AppAssets.supervisedText,
                  height: size.height * 0.14,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.28),
              child: Align(
                alignment: Alignment.center,
                child: ZoomIn(
                  duration: SplashPage._duration,
                  child: Image.asset(
                    AppAssets.islamLogo,
                    width: size.width * 0.40,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeInLeft(
                  duration: SplashPage._duration,
                  child: Image.asset(
                    AppAssets.splashLeftShape,
                    width: size.width * 0.25,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
              child: Align(
                alignment: Alignment.centerRight,
                child: FadeInRight(
                  duration: SplashPage._duration,
                  child: Image.asset(
                    AppAssets.splashRightShape,
                    width: size.width * 0.25,
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
