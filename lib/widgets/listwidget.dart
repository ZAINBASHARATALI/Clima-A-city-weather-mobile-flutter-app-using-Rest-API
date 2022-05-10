import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/models/wdatamodel.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/services/services.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key, required this.city}) : super(key: key);
  final String city;
  @override
  Widget build(BuildContext context) {
    final services = WeatherServices();
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 11, 58),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        width: Get.width * 0.45,
        child: FutureBuilder(
          future: services.fetchDatafromApi(city),
          builder: (context, AsyncSnapshot<WeatherDataModel?> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.04,
                        child: AutoSizeText(
                          snapshot.data!.name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                          minFontSize: 24,
                          stepGranularity: 1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            height: Get.height * 0.03,
                            child: AutoSizeText(
                              snapshot.data!.sys.country.toString(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                              minFontSize: 22,
                              stepGranularity: 1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              'https://openweathermap.org/img/wn/${snapshot.data!.weather[0].icon}@2x.png',
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                //height: Get.height * 0.0,
                                width: Get.width * 0.3,
                                child: AutoSizeText(
                                  snapshot.data!.weather[0].main,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  minFontSize: 18,
                                  stepGranularity: 1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 1),
                                //height: Get.height * 0.0,
                                //width: Get.width * 0.25,
                                child: AutoSizeText(
                                  snapshot.data!.main.tempMin
                                          .toStringAsFixed(2) +
                                      degree +
                                      ' / ' +
                                      snapshot.data!.main.tempMax
                                          .toStringAsFixed(2) +
                                      degree,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  minFontSize: 14,
                                  stepGranularity: 1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 1),
                                //height: Get.height * 0.0,
                                //width: Get.width * 0.25,
                                child: AutoSizeText(
                                  'Humidity: ' +
                                      snapshot.data!.main.humidity
                                          .toStringAsFixed(0) +
                                      ' %',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  minFontSize: 14,
                                  stepGranularity: 1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 1),
                                //height: Get.height * 0.0,
                                //width: Get.width * 0.25,
                                child: AutoSizeText(
                                  'Wind: ' +
                                      snapshot.data!.wind.speed
                                          .toStringAsFixed(0) +
                                      '  m/sec',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  minFontSize: 14,
                                  stepGranularity: 1,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    //height: Get.height * 0.025,
                    child: AutoSizeText(
                      'Pressure: ' +
                          snapshot.data!.main.pressure.toString() +
                          ' hPa',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      minFontSize: 14,
                      stepGranularity: 1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                    child: AutoSizeText(
                      snapshot.data!.main.temp.toString() + degree,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                      minFontSize: 35,
                      stepGranularity: 1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                child: 'Error'.text.makeCentered(),
              );
            }
          },
        ),
      ),
    );
  }
}
