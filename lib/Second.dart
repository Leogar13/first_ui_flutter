import 'package:flutter/material.dart';

class CityWeatherPage extends StatelessWidget {
List<String> day = ['Tomorrow', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/image/city1.jpg', fit: BoxFit.fitHeight,),
          Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white.withOpacity(0.00),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: (){Navigator.pop(context);}
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white,),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.wb_sunny,color: Colors.white,),
                                  Text('Sunny', style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                            Text('Sanfrancisco', style: TextStyle(color: Colors.white, fontSize: 20.0),)
                          ],
                        )
                      ),
                      Spacer(),
                      Text('14°', style: TextStyle(color: Colors.white, fontSize: 50.0),)
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                      color: Colors.indigo
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: day.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Container(child: Text(day[index], style: TextStyle(color: Colors.white), ),),

                                Container(
                                  child: Icon(Icons.wb_sunny),
                                ),

                                Container(child: Text('11', style: TextStyle(color: Colors.white),)),

                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                ],
              )
          ),
        ],
      )

    );
  }
}


