import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/models/10daydata.dart';
import 'package:weather_app/models/wdatamodel.dart';
import 'package:weather_app/services/services.dart';
import 'package:weather_app/widgets/chart.dart';
import 'package:weather_app/widgets/listview.dart';
import 'package:weather_app/widgets/mainwidget.dart';

const String degree = '\u00b0';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final weatherservice = WeatherServices();
    final String city = Get.arguments;

    return FutureBuilder(
      future: weatherservice.fetchDatafromApi(city),
      builder: ((context, AsyncSnapshot<WeatherDataModel?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.cod == 404) {
          return Scaffold(
            body: 'City Not Found'.text.minFontSize(60).makeCentered(),
          );
        } else {
          return Scaffold(
            backgroundColor: const Color(0xFF484B5B),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 57, 60, 76),
              elevation: 0.5,
              centerTitle: true,
              title: snapshot.data!.name.text.bold
                  .minFontSize(25)
                  .color(Colors.white)
                  .make(),
              leading: InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainWidget(snapshot: snapshot),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ('Humidity: ' +
                            snapshot.data!.main.humidity.toString() +
                            ' %')
                        .text
                        .color(Colors.white)
                        .minFontSize(20)
                        .makeCentered(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 10,
                      bottom: 5,
                    ),
                    child: 'Weather In Some Other Cities '
                        .text
                        .color(Colors.white)
                        .minFontSize(26)
                        //.fontWeight(FontWeight.w700)
                        .make(),
                  ),
                  ListBuildCities(),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //padding: const EdgeInsets.all(5),
                    height: Get.height * 0.25,
                    child: FutureBuilder(
                      future: weatherservice.fetch5DaysDatafromApi(
                          snapshot.data!.name.toString()),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          //getHistoryData(snapshot);
                          return Chart(
                            snapshot: snapshot as AsyncSnapshot<TenDaysData?>,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
