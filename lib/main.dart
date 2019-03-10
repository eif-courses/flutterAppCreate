import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';
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
      title: 'STUDENT BUDGET',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'STUDENT BUDGET'),
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

    AudioCache player = new AudioCache();

    switch(number){
      case 0: {
        player.play('sadpig.wav');
      }
      break;
      case 300: {
        player.play('luckypig.wav');
      }
      break;
      case 800: {
        player.play('richpig.wav');
      }
      break;
      case 1300: {
        player.play('fullpig.wav');
      }
      break;
    }
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
          title: Text("$number coins | STUDENT BUDGET"),
          leading: CircleAvatarImage(_url, ""),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Text(
                '$number' ,
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
                    color: Colors.green,
                    onPressed: addNumbers,
                    child:
                    Text("+100 PIG COINS"),
                  ),
                  RaisedButton(
                    onPressed: subtractNumbers,
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "-100 PIG COINS",
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
