import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/theme/app_colors.dart';

class SbhaTab extends StatefulWidget {
  const SbhaTab({super.key});

  @override
  _SbhaTabState createState() => _SbhaTabState();
}

class _SbhaTabState extends State<SbhaTab> {
  double _rotationAngle = 0.0; // زاوية الدوران
  int _counter = 0; // عداد التسبيح

  void _rotateImage() {
    setState(() {
      _rotationAngle += 30.0; // زيادة الزاوية بمقدار 30 درجة عند كل ضغط
      _counter++; // زيادة العداد بمقدار 1 عند كل ضغط
    });
  }

  void _resetCounter() {
    setState(() {
      _rotationAngle = 0.0; // إعادة الزاوية إلى الصفر
      _counter = 0; // إعادة العداد إلى الصفر
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.sabhaBackgroundImg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppAssets.introScreenLogo,
                width: size.width * 0.68,
                height: 151,
              ),
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Janna',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: _rotateImage, // عند الضغط، ندور الصورة ونزيد العداد
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: _rotationAngle * (3.141592653589793 / 180),
                      child: Image.asset(
                        AppAssets.sabhaImg,
                        width: size.width * 0.9,
                        height: size.height * 0.45,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'سبحان الله',
                          style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'Janna',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20), // مسافة بين النص والعداد
                        Text(
                          '$_counter',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontFamily: 'Janna',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // زر إعادة التعيين
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: _resetCounter,
                  // عند الضغط، نعيد تعيين العداد والزاوية
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // لون الخلفية
                    padding: const EdgeInsets.symmetric(vertical: 15), // الحشو
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // حواف دائرية
                    ),
                  ),
                  child: const Text(
                    'تصفير السبحة',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Janna',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}