import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(new MyApp());
  });
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Check your pocket'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  String _url = "assets/sad.jpg";
  String _description = "I feel bad :(";
  int number = 0;

  void subtractNumbers() {
    setState(() {
      number -= 100;
      setImageAndDecriptionByCurrentNumberValue();
    });
  }
  void addNumbers() {
    setState(() {
      number += 100;
      setImageAndDecriptionByCurrentNumberValue();
    });
  }
  void setImageAndDecriptionByCurrentNumberValue(){
    if(number <= 0){
      _url = "assets/sad.jpg";
      _description = "I feel bad :(";
    }
    if(number >= 300 && number <= 800) {
      _url = "assets/lucky.jpg";
      _description = "I feel good :)";
    }
   if(number == 800 && number <= 1200) {
     _url = "assets/rich.jpg";
     _description = "I feel rich :-)";
   }
    if(number >= 1300){
      _url = "assets/full.jpg";
      _description = "I feel moneyfull :-~";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your budged icons :)"),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Text(
                '$number',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100.0,
                  fontFamily: 'Roboto',
                ),
              ),
              CircleAvatarImage(_url, _description),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: addNumbers,
                    child: Text("Add"),
                  ),
                  RaisedButton(
                    onPressed: subtractNumbers,
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Subtract",
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
class CircleAvatarImage extends StatelessWidget {
  var path, description;
  CircleAvatarImage(this.path, this.description);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(path),
          radius: 120,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

      ],
    );
  }
}
