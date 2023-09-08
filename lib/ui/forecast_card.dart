import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/weather_forecast_model.dart';
import '../util/convert_icon.dart';
import '../util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index)
{
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text("${dayOfWeek}", style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),),),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: getWeatherIcon(weatherDescription: forecastList[index].weather![0].main,
                  color: Colors.pinkAccent, size: 45)
            ),),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("${forecastList[index].temp?.min?.toStringAsFixed(0)}°C  ", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15
                    ),),
                    const Icon(FontAwesomeIcons.solidCircleDown, size: 18, color: Colors.white,),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("${forecastList[index].temp?.max?.toStringAsFixed(0)}°C  ", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                    ),),
                    const Icon(FontAwesomeIcons.solidCircleUp, size: 18, color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("Hum: ${forecastList[index].humidity}%", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text("Win: ${forecastList[index].speed?.toStringAsFixed(1)}mi/h", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                )),
              ),

            ]
          )
        ],
      )
    ]
  );
}


