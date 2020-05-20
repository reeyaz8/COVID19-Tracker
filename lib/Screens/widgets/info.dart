import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
      margin: EdgeInsets.all(10.0),
      child: Column(children: <Widget>[
        SizedBox(height:5.0),
          Text("What is COVID-19?" ,style: TextStyle(fontSize:22.0, fontWeight: FontWeight.w600),),
          SizedBox(height:5.0),
          Text('Coronavirus disease 2019 (COVID-19) is an infectious disease caused by severe acute respiratory syndrome'+
          'coronavirus 2 (SARS-CoV-2). It was first identified in December 2019 in Wuhan, China, and has since spread globally, resulting in an ongoing pandemic.'+
           'As of 20 May 2020, more than 4.93 million cases have been reported across 188 countries and territories, resulting in more than 324,000 deaths. '+
           'More than 1.71 million people have recovered.', textAlign: TextAlign.justify,
           ),
           SizedBox(height:5.0),
           Text('Common symptoms include fever, cough, fatigue, shortness of breath, and loss of smell and taste.'+
           ' While the majority of cases result in mild symptoms, some progress to acute respiratory distress syndrome (ARDS) '+
           'likely precipitated by cytokine storm, multi-organ failure, septic shock, and blood clots.'+
           ' The time from exposure to onset of symptoms is typically around five days but may range from two to fourteen days.' ,textAlign: TextAlign.justify),
          Text("Symptoms of COVID19"  ,style: TextStyle(fontSize:20.0, fontWeight: FontWeight.w600),),
          Image.asset('images/info_image.webp'),
          SizedBox(height:10.0),
          Text('#Stay Safe, Stay Home', style: TextStyle(fontStyle: FontStyle.italic),)
        ],)
      ),
    );
  }
}