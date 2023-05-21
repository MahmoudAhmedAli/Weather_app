import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/modles/weather_model.dart';
import 'package:weatherapp/provider/weather_pr.dart';
import 'package:weatherapp/serveces/weather_serveces.dart';

class SearchPage extends StatelessWidget {
String? cityName;
SearchPage({this.updateUi});
VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
              cityName = data;
            },
            onSubmitted: (data)async{
                cityName=data;
                WeatherService service=WeatherService();
              WeatherModel weather=await  service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 35,horizontal: 15),
              label: Text('search'),
              border: OutlineInputBorder(),
              hintText: 'please enter your city',
              suffixIcon:GestureDetector(

                  onTap : () async
                  {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                    Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),

            ),
          ),
        ),
      ),
    );
  }
}
