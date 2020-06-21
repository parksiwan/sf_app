import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sf_app/new_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final appTitle = 'Drwaer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(        
        primarySwatch: Colors.deepPurple,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : null,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: appTitle),
      //routes: <String, WidgetBuilder>{
      //  "/a": (BuildContext context) => NewPage('New Page'),
      //},
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Siwan'),
              accountEmail: Text('parksiwan@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.deepPurple : Colors.white,
                child: Text('P'),
              ),
            ),
            ListTile(
              title: Text('Page One'),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NewPage('Page One')));
              }
            ),
            ListTile(
              title:  Text('Page Two'),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NewPage('Page Two')));
              }
            ),
            Divider(),
            ListTile(
              title:  Text('Close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
