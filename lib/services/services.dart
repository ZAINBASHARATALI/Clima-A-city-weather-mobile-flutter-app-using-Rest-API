import 'package:weather_app/models/10daydata.dart';
import 'package:weather_app/models/wdatamodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class WeatherServices {
  
  String apikey = 'ADD YOUR API KEY HERE';       //api key from openweathermap.org to be added here


  Future<WeatherDataModel?> fetchDatafromApi(String city) async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric'));
    WeatherDataModel? weathermodel;
    if (response.statusCode == 200) {
      weathermodel = weatherDataModelFromJson(response.body);
      return weathermodel;
    } else {
      debugPrint("Not Found\n");
      return weathermodel;
    }
  }

  Future<TenDaysData?> fetch5DaysDatafromApi(String city) async {
    var _response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&cnt=10&appid=$apikey&units=metric'));
    TenDaysData? fivedaysdata;
    if (_response.statusCode == 200) {
      fivedaysdata = tenDaysDataFromJson(_response.body);
      return fivedaysdata;
    } else {
      debugPrint("10 Days Data Not Found\n");
      return fivedaysdata;
    }
  }
}
