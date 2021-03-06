import 'package:COVID19_Tracker/Screens/widgets/country.dart';
import 'package:COVID19_Tracker/Screens/widgets/info.dart';
import 'package:COVID19_Tracker/Screens/widgets/list_country.dart';
import 'package:COVID19_Tracker/Screens/widgets/live.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String name;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  String displayTitle = 'Live Tracker';
  Widget currentWidget = LivePage();
  List<String> title = ['Live Tracker', 'Country Tracker', 'Information'];
  List<Widget> widgets = [LivePage(), CountryPage(), InfoPage()];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
     _tabController = new TabController(initialIndex: 0, vsync: this, length: 3)..addListener(() {
       setState(() {
         displayTitle = title[_tabController.index];
         currentWidget = widgets[_tabController.index];
       });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
          child: DefaultTabController(
        length: 3, 
        child: Scaffold(
          appBar: AppBar(
      title: Text(displayTitle),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.public), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListCountry()));
        })
      ],
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.blue, Colors.purple
          ]
        ))
      ),
      bottom: TabBar(
        controller: _tabController,
        tabs: [
        Tab(icon: Icon(Icons.live_tv),),
        Tab(icon: Icon(Icons.account_balance),),
        Tab(icon: Icon(Icons.info),),
      ]),
          ),
          body:
           TabBarView(
      physics: BouncingScrollPhysics(),
      controller: _tabController,
      children: [
          LivePage(),
          CountryPage(),
          InfoPage()
      ]
        ) 
        ),
       ),
    );
    }
}