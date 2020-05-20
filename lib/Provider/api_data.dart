import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class allData with ChangeNotifier{
  Response oneResponse, allResponse;
  

  Dio dio = new Dio();

  retrieveOne(String CountryName) async{
    String _url = 'https://disease.sh/v2/countries/'+CountryName;
    oneResponse = await dio.get(_url);
    notifyListeners();
  }

  retriveAll() async {
    String _url = 'https://disease.sh/v2/countries/';
    allResponse = await dio.get(_url);
    notifyListeners();
  }
}