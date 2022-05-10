import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/wdatamodel.dart';
import 'package:weather_app/screens/homepage.dart';

// ignore: must_be_immutable
class MainWidget extends StatelessWidget {
  MainWidget({Key? key, required this.snapshot}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  AsyncSnapshot<WeatherDataModel?> snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetPlatform.isAndroid ? Get.height * 0.35 : Get.height * 0.3,
      margin: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 10 : 0),
      //color: Colors.amber,
      child: Row(
        children: [
          SizedBox(
            height: Get.height * 0.35,
            width: Get.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Builder(builder: ((context) {
                  if (snapshot.data!.weather[0].main == 'Haze' ||
                      snapshot.data!.weather[0].main == 'Mist') {
                    return Image.asset('assets/night_cloudy.png');
                  } else if (snapshot.data!.weather[0].main == 'Clouds') {
                    return Image.asset('assets/cloudy.png');
                  } else if (snapshot.data!.weather[0].main == 'Clear') {
                    return Image.asset('assets/mixed.png');
                  } else {
                    return Image.asset('assets/sunny.png');
                  }
                })),
                SizedBox(
                  height: Get.height * 0.03,
                  child: AutoSizeText(
                    snapshot.data!.main.tempMax.toString() +
                        degree +
                        ' / ' +
                        snapshot.data!.main.tempMin.toString() +
                        degree,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      //fontWeight: FontWeight.w300,
                    ),
                    minFontSize: 14,
                    stepGranularity: 2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: Get.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AutoSizeText(
                        'Feels Like: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //fontWeight: FontWeight.w500,
                        ),
                        minFontSize: 14,
                        stepGranularity: 2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AutoSizeText(
                        snapshot.data!.main.feelsLike.toString() +
                            degree +
                            ' C',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        minFontSize: 14,
                        stepGranularity: 2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.35,
            width: Get.width * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.55,
                  child: AutoSizeText(
                    snapshot.data!.main.temp.toStringAsFixed(1) + degree + 'C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.w700,
                    ),
                    minFontSize: 50,
                    stepGranularity: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.4,
                  child: AutoSizeText(
                    snapshot.data!.weather[0].main.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                    ),
                    minFontSize: 32,
                    stepGranularity: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  width: Get.width * 0.4,
                  child: AutoSizeText(
                    'Wind: ' +
                        snapshot.data!.wind.speed.toString() +
                        '  meter' +
                        ' / ' +
                        's',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      //fontWeight: FontWeight.w500,
                    ),
                    minFontSize: 14,
                    stepGranularity: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: Get.width * 0.4,
                  child: AutoSizeText(
                    'Pressure: ' +
                        snapshot.data!.main.pressure.toString() +
                        '  hPa',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      //fontWeight: FontWeight.w500,
                    ),
                    minFontSize: 14,
                    stepGranularity: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
