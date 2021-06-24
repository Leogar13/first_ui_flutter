import 'package:flutter/material.dart';
import 'package:flutterapp/Second.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
        key: _globalKey,
          appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu,color: Colors.black,
            ),
            onPressed: (){
              _globalKey.currentState.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black,),
              onPressed: (){
//---------------------------------Chua co----------------------
              },
            ),

          ],
        ),
          drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
          body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Weather',style: TextStyle(fontSize: 30.0),),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: TabBar(
                isScrollable: false,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: choices.map((Choice choice) {
                  return Tab(
                    text: choice.title,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: weatherCity('assets/image/city1.jpg', 'sun','1','Hanoi'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: weatherCity('assets/image/city2.jpg', 'rain','2','Singapore'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: weatherCity('assets/image/city2.jpg', 'storm','3','New York'),
                      ),Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: weatherCity('assets/image/city2.jpg', 'frogy','4', 'Tokyo'),
                      ),
                    ],
                  ),
                  ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: InkWell(
                            child: weatherCity('assets/image/city2.jpg', 'frogy','4', 'Tokyo'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CityWeatherPage()),
                              );
                            },
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: weatherCity('assets/image/city1.jpg', 'sun','1','Hanoi'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: weatherCity('assets/image/city2.jpg', 'rain','2','Singapore'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: weatherCity('assets/image/city2.jpg', 'storm','3','New York'),
                      ),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );

  }

}

Widget weatherCity(image, description, temp, city) {
  return AspectRatio(
    aspectRatio: 4/2,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image)
          )

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.business), color: Colors.white,),//Weather Icons
              Text(description, style: TextStyle(color: Colors.white),)//Description
            ],
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(temp, style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
              Text('°', style: TextStyle(color: Colors.white, fontSize: 20.0)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(city, style: TextStyle(color: Colors.white, fontSize: 20.0)),
              )
            ],
          )


        ],
      ),
    ),
  );
}

class Choice {
  const Choice({this.title});
  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Today'),
  const Choice(title: 'Tomorow'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline;
    return Card(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Homepage(),));


