import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
 
  int scoreHome = 0;
  int scoreAway = 0;
  int time = 0;

  bool _isStart = true;
  String _stopwatchText = '00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  void _startStopButtonPressed() {
    setState(() {

      if (_stopWatch.isRunning) {

        _isStart = true;
        _stopWatch.stop();
      } else {
        time = time +1;
        _isStart = false;
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtonPressed(){

    if(_stopWatch.isRunning){
      _startStopButtonPressed();

    }
    setState(() {
      _stopWatch.reset();
      _setStopwatchText();
      time  = 0;
      scoreHome = 0;
      scoreAway  = 0;
    });
  }

  void _setStopwatchText(){
    _stopwatchText = (_stopWatch.elapsed.inMinutes%60).toString().padLeft(2,'0') + ':'+
        (_stopWatch.elapsed.inSeconds%60).toString().padLeft(2,'0') + ':' +
        (_stopWatch.elapsed.inMilliseconds%20).toString().padLeft(2,'0');
  }


  showAlertDialog2(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();

      },
    );
    Widget continuaButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        Navigator.of(context).pop();
         _resetButtonPressed();

      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Do you wish to continue ?"),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.deepPurple[900],
          title: Text(
            'Scoreboard',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,


            ),
          ),
        ),
      body: Column(
        children: <Widget>[
          //================ Widget topView ==============================
          Expanded(
            child: topView(),
            flex: 1,
          ),
          //================ Widget centerView ==============================
          Expanded(
            child: centerView(),
            flex: 3,
          ),
          //================ Widget bottomView ==============================
          Expanded(
            child: bottomView(),
            flex: 2,
          ),
        ],
      ),
    );
  }
  Widget topView(){
    return Container(
      color: Colors.amber,
      child: Row(
        children: <Widget>[
          //================ Home name ==============================
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
                child: Container(
                  color: Colors.purple[900],
                  child:Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ),
            flex: 2,
          ),
          //================ VS name ==============================

          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Container(
                color: Colors.purple[900],
                child:Center(
                  child: Text(
                    'X',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            flex: 1,
          ),

          //================ Away name ==============================

          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Container(
                color:  Colors.purple[900],
                child:Center(
                  child: Text(
                    'Away',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
//================ Game Points  ==============================
  Widget centerView(){
    return Container(

      child: Column(
        children: <Widget>[
          //================ TopButtons ==============================
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Container(
                color: Colors.purple[900],
                child: Row(
                  children: <Widget>[
                    //======================remove home===================
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Container(


                          padding: EdgeInsets.all(3),
                          color: Colors.purple[900],
                          child:Row(
                            children: <Widget>[
                              Expanded(
                                child: FlatButton(
                                    onPressed: (){
                                      setState(() {
                                        if(scoreHome==0){
                                          scoreHome = 0;
                                        }else{
                                          scoreHome = scoreHome - 1;
                                        }
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                  shape: const StadiumBorder(),
                                  textColor: Colors.white,
                                  color: Colors.purple,


                                ),

                              ),


                            ],
                          ),
                        ),
                      ),
                      flex: 2,
                    ),
                    //======================remove time===================

                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
//                        child: Container(
//                          padding: EdgeInsets.all(3),
//                          color: Colors.purple[900],
//                          child:Row(
//                             children: <Widget>[
//                               Expanded(
//                                  child: FlatButton(
//                                    onPressed: (){
//                                      setState(() {
//                                        if(time==0){
//                                          time = 0;
//                                        }else{
//                                          time = time - 1;
//                                        }
//                                      });
//                                  },
//                                    child: Center(
//                                       child: Icon(
//                                        Icons.remove,
//                                        color: Colors.white,
//                                        size: 34,
//                                       ),
//                                   ),
//                                    shape: const StadiumBorder(),
//                                    textColor: Colors.white,
//                                    color: Colors.purple,
//
//
//                                ),
//
//                              ),
//
//
//                           ],
//                         ),
//                        ),
                      ),
                      flex: 1,
                    ),
                    //======================remove away===================
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.purple[900],
                          child:Row(
                            children: <Widget>[
                              Expanded(
                                child: FlatButton(
                                    onPressed: (){
                                      setState(() {
                                        if(scoreAway==0){
                                          scoreAway = 0;
                                        }else{
                                          scoreAway = scoreAway - 1;
                                        }
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                  shape: const StadiumBorder(),
                                  textColor: Colors.white,
                                  color: Colors.purple,

                                ),

                              ),


                            ],
                          ),
                        ),
                      ),
                      flex: 2,
                    ),
                  ],
                ),

              ),
            ),
            flex: 1,
          ),
          //================ score home ==============================
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Container(
                color: Colors.purple[900],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Container(
                          color: Colors.purple[900],
                          child:Center(
                            child: Text(
                              '$scoreHome',
                              style: TextStyle(
                                fontSize: 80,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      flex: 2,
                    ),
//================ Time ==============================
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(height: 100),
                        child: Container(
                          color: Colors.purple[900],
                          child:Center(
                            child: Text(
                              '$time T',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
//================ score Away ==============================
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Container(
                          color: Colors.purple[900],
                          child:Center(
                            child: Text(
                              '$scoreAway',
                              style: TextStyle(
                                fontSize: 80,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      flex: 2,
                    ),


                  ],
                ),
              ),
            ),
            flex: 3,
          ),

          //================ BottomBottons ==============================
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Container(
                color: Colors.purple[900],
                child: Row(
                  children: <Widget>[
                    //======================add home===================
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.purple[900],
                          child:Row(
                            children: <Widget>[
                              Expanded(
                                child: FlatButton(
                                    onPressed: (){
                                      setState(() {
                                        scoreHome = scoreHome + 1;
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                  shape: const StadiumBorder(),
                                  textColor: Colors.white,
                                  color: Colors.purple,

                                ),

                              ),


                            ],
                          ),
                        ),
                      ),
                      flex: 2,
                    ),
                    //======================add time===================

                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
//                        child: Container(
//                          padding: EdgeInsets.all(3),
//                          color: Colors.purple[900],
//                          child:Row(
//                            children: <Widget>[
//                              Expanded(
//                                child: MaterialButton(
//                                    onPressed: (){
//                                      setState(() {
//                                        time = time + 1;
//                                      });
//                                    },
//                                    child: Center(
//                                      child: Icon(
//                                        Icons.add,
//                                        size: 34,
//                                        color: Colors.white,
//                                      ),
//                                    ),
//                                  shape: const StadiumBorder(),
//                                  textColor: Colors.white,
//                                  color: Colors.purple,
//
//
//
//                                ),
//
//                              ),
//
//
//                            ],
//                          ),
//                        ),
                      ),
                      flex: 1,
                    ),
                   // ======================add away===================
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.purple[900],
                          child:Row(
                            children: <Widget>[
                              Expanded(
                                child: FlatButton(
                                    onPressed: (){
                                      setState(() {
                                        scoreAway = scoreAway + 1;
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                  shape: const StadiumBorder(),
                                  textColor: Colors.white,
                                  color: Colors.purple,

                                ),

                              ),


                            ],
                          ),
                        ),
                      ),
                      flex: 2,
                    ),
                  ],
                ),


              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
//================ VieawTime and bottons ==============================
  Widget bottomView(){
    return Column(

      children: <Widget>[
//================show time=======================
        Expanded(
          child: Container(
            color: Colors.purple[900],
            child: FittedBox(

              fit: BoxFit.none,
              child: Text(
                _stopwatchText,
                style: TextStyle(
                  fontSize: 72,
                  color: Colors.white,
                ),
              ),

            ),
          ),
          flex: 3,
        ),
        //================bottons play and reset=======================
        Expanded(
          child: Row(


            children: <Widget>[
              //================paly=======================
              Expanded(

                child: Container(
                  color: Colors.purple[900],
                  padding: EdgeInsets.all(10),

                  child: MaterialButton(
                    child: Icon(_isStart ? Icons.play_arrow : Icons.stop),
                    onPressed: _startStopButtonPressed,
                    shape: const StadiumBorder(),
                    textColor: Colors.white,
                    color: Colors.purple,
                    height: 60,
                  ),
                ),
                flex: 2,
              ),
//================reset=======================
              Expanded(

                child: Container(
                  color: Colors.purple[900],
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),

                    //onPressed: _resetButtonPressed,
                    onPressed: (){
                      showAlertDialog2(context);
                    },

                    shape: const StadiumBorder(),
                    textColor: Colors.white,
                    color: Colors.purple,
                    height: 60,
                  ),
                ),
                flex: 2,
              ),
            ],
          ),
          flex: 2,
        ),

      ],

    );

  }
}
