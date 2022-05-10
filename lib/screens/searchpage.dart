import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/screens/homepage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF484B5B),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 60, 76),
        centerTitle: true,
        title: 'Search'.text.color(Colors.white).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 35,
          left: 30,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              autofocus: true,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Enter a valid City Name',
                hintStyle: TextStyle(color: Colors.cyan.withOpacity(0.7)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.65,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (cityController.text.isNotEmpty) {
                    Get.to(
                      () => const HomePage(),
                      arguments: cityController.text,
                    );
                  }
                },
                child: 'Show Weather'
                    .text
                    .minFontSize(18)
                    .letterSpacing(1.5)
                    .bold
                    .color(Colors.white)
                    .make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
