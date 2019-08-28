import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';


main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: ShapeWidget(),
    ),
  ));
}

class ShapeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState 
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends State<ShapeWidget> {
  List colo = [Colors.red, Colors.green, Colors.yellow, Colors.deepPurple,Colors.lightBlue, Colors.orange,Colors.lime];
  var containerOneColor = Colors.blue;
  Color containerTwoColor = Colors.lightBlue;
  var containerThreeColor = Colors.indigo;
  var containerFourColor = Colors.grey;
  var containerFiveColor = Colors.red;
  var containerSixColor = Colors.deepPurple;
  var containerSevenColor = Colors.teal;
  var challColor=Colors.orange;
  var playClick= false;
  var chalWon = false;
  var message='';
  Random random = new Random();

  int index = 0;

  Color randomGenerator() {
    return colo [new Random().nextInt(7)];
  }


  Timer _timer;
  int _start = 160;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
              if(containerOneColor == challColor &&
                  containerThreeColor == challColor &&
                  containerFourColor == challColor &&
                  containerFiveColor == challColor &&
                  containerTwoColor == challColor &&
                  containerSixColor == challColor &&
                  containerSevenColor == challColor) {
              timer.cancel();
              playClick = false;
              chalWon = true;
              challColor=randomGenerator();
              message="You've Won!";
              }
          if (_start < 1) {
            playClick = false;
            timer.cancel();
            chalWon = false;
            challColor=randomGenerator();
            message= "You've Lost!";
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[

                GestureDetector(onTap:(){
                  startTimer();
                },child:Icon(Icons.play_arrow)),
                Text(message.toString()),
                  Text('Time Left'),
                Text(_start.toString()),

                Container(
                  height: 20,
                  width:20,
                  color: challColor,
                ),
                //Text()
              ]
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          containerOneColor = randomGenerator();
                        });
                      },
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: containerOneColor,
                      ),
                    )
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            containerTwoColor = randomGenerator();
                          });
                        },
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: containerTwoColor,
                        ))),
                Expanded(
                  child:GestureDetector(
                      onTap: (){
                        setState(() {
                          containerThreeColor=randomGenerator();
                        });
                      },
                      child: Container(
                          height: 100.0, width: 100.0, color: containerThreeColor)
                  ),
                )
              ],
            ),
            Expanded(
                child:GestureDetector(
                    onTap: (){
                      setState(() {
                        containerFourColor=randomGenerator();;
                      });
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: containerFourColor,
                    )
                )
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child:GestureDetector(
                        onTap: (){
                          setState(() {
                            containerFiveColor=randomGenerator();
                          });
                        },
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: containerFiveColor,
                        )
                    )
                ),
                Expanded(
                    child:GestureDetector(
                        onTap: (){
                          setState(() {
                            containerSixColor=randomGenerator();
                          });
                        },
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: containerSixColor,
                        )
                    )
                ),
                Expanded(
                    child:GestureDetector(
                        onTap: (){
                          setState(() {
                            containerSevenColor=randomGenerator();
                          });
                        },
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          color: containerSevenColor,
                        )
                    )
                )
              ],
            ),
          ],
        ));
  }
}


