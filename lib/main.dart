import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/modles/weather_model.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:weatherapp/provider/weather_pr.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}
