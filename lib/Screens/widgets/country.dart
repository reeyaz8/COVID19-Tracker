import 'package:COVID19_Tracker/Provider/api_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CountryPage extends StatelessWidget {
  double smallContainerHeight = 70.0;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<allData>(context, listen: false);
    return Container(
      child: data.allResponse != null ? 
      Container(
        height: 30.0,
        width: 20.0,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          addAutomaticKeepAlives: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: 3.0,
          ),
          itemCount: data.allResponse.data.length,
          itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              showDialog(context: context,
                child: SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  elevation: 0.0,
                  titlePadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Text(data.allResponse.data[index]['country'])),
                    IconButton(icon: Icon(Icons.close), onPressed: () {Navigator.pop(context);})
                  ]),
                  children: <Widget>[
                     Container(alignment: Alignment.center,
                       child: Text(
                  'Last Updated: '+DateTime.fromMillisecondsSinceEpoch(data.allResponse.data[index]['updated']).toString().split('.')[0],
                  style: TextStyle(fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
                  ),
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
                     SizedBox(height:10.0),
                     Text(data.allResponse.data[index]['todayCases'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
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
                     SizedBox(height:10.0),
                     Text(data.allResponse.data[index]['active'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
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
                     SizedBox(height:10.0),
                     Text(data.allResponse.data[index]['todayDeaths'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
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
                     SizedBox(height:10.0),
                     Text(data.allResponse.data[index]['deaths'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
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
                     SizedBox(height:10.0),
                     Text(data.allResponse.data[index]['recovered'].toString(), style: TextStyle(color: Colors.white, fontSize:18.0),)
                  ],)
                ),
                  ],
                )
              );
            },
              child: Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: new Text(data.allResponse.data[index]['country'], style: TextStyle(color: Colors.white),),
            ),
          );
        },
    ),
      ) : Center(child: Text('Loading Data...')),
    );
  }
}