import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/weather_forecast_model.dart';
import '../util/convert_icon.dart';
import '../util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot)
{
  var forecastList = snapshot.data?.list;
  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000 ?? 0);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$city, $country",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87
          ),),
          Text(Util.getFormattedDate(formattedDate), style: const TextStyle(
            fontSize: 15
          ),),
          const SizedBox(height: 10,),
          // const Icon(Icons.wb_sunny, size: 195,),
          // Icon(FontAwesomeIcons.cloud, size: 195, color: Colors.pinkAccent,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main, color: Colors.pinkAccent, size: 198),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${forecastList[0].temp?.day?.toStringAsFixed(0)}°C",
                  style: const TextStyle(
                    fontSize: 34
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("${forecastList[0].weather?[0].description?.toUpperCase()}",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: <Widget>[
                      Text("${forecastList[0].speed?.toStringAsFixed(1)} mi/h"),
                      // const Icon(Icons.arrow_forward, size: 20, color: Colors.brown)
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown),
                    ],
                  ),
                ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("${forecastList[0].humidity?.toStringAsFixed(0)}%"),
                            // const Icon(Icons.hot_tub, size: 20, color: Colors.brown,)
                            Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, size: 20, color: Colors.brown,)
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${forecastList[0].temp?.max?.toStringAsFixed(0)}°F"),
                          // const Icon(Icons.sunny, size: 20, color: Colors.brown)
                          Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                        ],
                      ),
                    )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}