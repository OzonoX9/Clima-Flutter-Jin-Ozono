import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentPosition();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    String token = '189c35b11f0c7ad970b59041f19ed590';
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$token');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
