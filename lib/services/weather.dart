import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WeatherModel {
  final String apiKey = '4a6b854be2956b06899f1542113ea101';

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocation();

    var data = await getWeatherApi(
        lat: location.lat.toString(), long: location.long.toString());

    return data;
  }

  Future getWeatherApi({String lat, String long}) async {
    String apiString =
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric';
    Response response = await get(apiString);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
