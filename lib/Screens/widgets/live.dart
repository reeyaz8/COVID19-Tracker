import 'package:COVID19_Tracker/Provider/api_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LivePage extends StatelessWidget {
  double smallContainerHeight = 70.0;
  @override
  Widget build(BuildContext context) {
    final liveCountry = Provider.of<allData>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
          child: Container(
        child: liveCountry.oneResponse == null ? Center(child: Text('Loading data...')):
          Container(
            child: Column(
              children:<Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue, Colors.white, Colors.purple]),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget>[
                    Container(
                      width: 100.0,
                      child: Image.network(liveCountry.oneResponse.data['countryInfo']['flag'].toString())),
                      SizedBox(width: 30.0,),
                    Container(
                        child:Column(children: <Widget>[
                          Text('Country:'+liveCountry.oneResponse.data['country']),
                          Text('Continent:'+liveCountry.oneResponse.data['continent']),
                          Text('Population: '+liveCountry.oneResponse.data['population'].toString())
                        ],)
                      )

                  ],
                ),),
                Text(
                  'Last Updated: '+DateTime.fromMillisecondsSinceEpoch(liveCountry.oneResponse.data['updated']).toString().split('.')[0],
                  style: TextStyle(fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
                  ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  height: smallContainerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.blue,
                  ),
                  child: Column(children:<Widget>[
                     Text('Today Case', style: TextStyle(color: Colors.white, fontSize:14.0),),
                     SizedBox(height:12.0),
                     Text(liveCountry.oneResponse.data['todayCases'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
                  ],)
                ),
                 Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  height: smallContainerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.purple,
                  ),
                  child: Column(children:<Widget>[
                     Text('Active Case', style: TextStyle(color: Colors.white, fontSize:14.0),),
                     SizedBox(height:12.0),
                     Text(liveCountry.oneResponse.data['active'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
                  ],)
                ),
                 Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  height: smallContainerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.redAccent,
                  ),
                   child: Column(children:<Widget>[
                     Text('Today Death', style: TextStyle(color: Colors.white, fontSize:14.0),),
                     SizedBox(height:12.0),
                     Text(liveCountry.oneResponse.data['todayDeaths'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
                  ],)
                ),
                 Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  height: smallContainerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.red,
                  ),
                   child: Column(children:<Widget>[
                     Text('Total Death', style: TextStyle(color: Colors.white, fontSize:14.0),),
                     SizedBox(height:12.0),
                     Text(liveCountry.oneResponse.data['deaths'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
                  ],)
                ),
                 Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  height: smallContainerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.green,
                  ),
                   child: Column(children:<Widget>[
                     Text('Recovered Case', style: TextStyle(color: Colors.white, fontSize:14.0),),
                     SizedBox(height:12.0),
                     Text(liveCountry.oneResponse.data['recovered'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
                  ],)
                ),
              ],

            ),
          )  
      ),
    );
  }
}