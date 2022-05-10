import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/widgets/listwidget.dart';

// ignore: must_be_immutable
class ListBuildCities extends StatelessWidget {
  ListBuildCities({Key? key}) : super(key: key);
  List<String> cities = [
    'Islamabad',
    'London',
    'New York',
    'Moscow',
    'Beijing',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: GetPlatform.isAndroid ? Get.height * 0.35 : Get.height * 0.30,
      //color: Colors.redAccent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ListWidget(city: cities[index]);
        },
        itemCount: 5,
      ),
    );
  }
}
