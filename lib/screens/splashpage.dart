import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:weather_app/screens/searchpage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 244, 246, 244),
            Color.fromARGB(255, 60, 59, 59),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: SizedBox(
        height: Get.height * 0.5,
        child: SplashScreenView(
          navigateRoute: const SearchPage(),
          duration: 3000,
          imageSize: 200,
          imageSrc: "assets/icon.png",
          text: "CLIMA",
          textType: TextType.TyperAnimatedText,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
            fontSize: 40.0,
          ),
          backgroundColor: Colors.white70,
          speed: 200,
        ),
      ),
    );
  }
}
