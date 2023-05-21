import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/modles/weather_model.dart';
import 'package:weatherapp/pages/search_page.dart';
import 'package:weatherapp/provider/weather_pr.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void updatUi(){
    setState(() {

    });
  }
  WeatherModel?weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SearchPage(
                  updateUi:updatUi ,
                );
              }),);
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body:weatherData==null? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 🥺 start',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ):Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3,),
            Text(
              Provider.of<WeatherProvider>(context).cityName!,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text(
              weatherData!.date.toString(),
              style: TextStyle(
                fontSize: 22,

              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Image.asset(weatherData!.getImage()),
                Text(
                      '${weatherData!.temp!.toInt()}',
                style: TextStyle(
                  fontSize: 32,

                ),
                ),
                Column(
                  children: [
                    Text('maxTemp : ${weatherData!.maxTemp!.toInt()}'),
                    Text('minTemp : ${weatherData!.minTemp!.toInt()}'),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              weatherData!.weatherStateName!,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
