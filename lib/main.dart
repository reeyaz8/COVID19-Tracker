import 'dart:async';
import 'dart:ui';
import 'package:COVID19_Tracker/Provider/api_data.dart';
import 'package:COVID19_Tracker/Provider/country.dart';
import 'package:COVID19_Tracker/Screens/HomePage.dart';
import 'package:COVID19_Tracker/Screens/widgets/list_country.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => allData()),
        ChangeNotifierProvider(create: (_) => SCountry())
      ],
          child: MaterialApp(
        title: 'COVID19 Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liveCountry = Provider.of<allData>(context, listen: false);
    final country = Provider.of<SCountry>(context, listen: false);
    Timer(Duration(seconds: 3), () async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getString('country') == null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListCountry()));
      liveCountry.retriveAll();
    }
    else{
      country.setCountryName(pref.getString('country'));
      liveCountry.retrieveOne(country.CountryName);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      liveCountry.retriveAll();
    }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Container(
              margin: EdgeInsets.all(5.0),
              height: 125.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('images/splashscreen.jpeg'),
                  fit: BoxFit.fill
                )
              ),
              child: BackdropFilter(filter: ImageFilter.blur(sigmaX:2.0))
            ),
          ),
          SizedBox(height:50.0),
          Container(
            child: Text('v 1.0.1', style: TextStyle(fontWeight: FontWeight.w300),) 
          ),
        ],
      ),
    );
  }
}
