import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: 'CalcApp',
      home: MyHomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  String expreson = '';
  String resulte = '';
  void AddExpress(var exp) {
    expreson = expreson + exp;
  }

  void ClearNumclick() {
    expreson = '';
  }

  void Evalexp() {
    try {
      Parser p = Parser();
      Expression expres = p.parse(expreson);
      ContextModel cm = ContextModel();
      resulte = '${expres.evaluate(EvaluationType.REAL, cm)}';
      print(resulte);
    } catch (e) {
      resulte = 'Error Expression';
      print(resulte);
    }
  }

  void DeleteOneExp() {
    if (expreson.length != 0) {
      expreson = expreson.substring(0, expreson.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        children: [
          Result(resulte),
          OnScreenNum(expreson),
          Row(
            children: [
              Container(
                  width: 280,
                  height: 422.12,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: GridView.count(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    padding: EdgeInsets.only(top: 18),
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('1');
                            });
                          },
                          child: Text('1')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('2');
                            });
                          },
                          child: Text('2')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('3');
                            });
                          },
                          child: Text('3')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('4');
                            });
                          },
                          child: Text('4')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('5');
                            });
                          },
                          child: Text('5')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('6');
                            });
                          },
                          child: Text('6')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('7');
                            });
                          },
                          child: Text('7')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('8');
                            });
                          },
                          child: Text('8')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('9');
                            });
                          },
                          child: Text('9')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              AddExpress('0');
                            });
                          },
                          child: Text('0')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              ClearNumclick();
                            });
                          },
                          child: Text('C')),
                      ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              DeleteOneExp();
                            });
                          },
                          child: Text('Del')),
                    ],
                  )),
              Container(
                width: 112.7,
                height: 422.12,
                color: Color.fromARGB(255, 241, 241, 241),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print('operator pressed');
                            setState(() {
                              AddExpress('+');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(83, 83)),
                          child: Text('+')),
                      ElevatedButton(
                          onPressed: () {
                            print('operator pressed');
                            setState(() {
                              AddExpress('-');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(83, 83)),
                          child: Text('-')),
                      ElevatedButton(
                          onPressed: () {
                            print('operator pressed');
                            setState(() {
                              AddExpress('*');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(83, 83)),
                          child: Text('x')),
                      ElevatedButton(
                          onPressed: () {
                            print('operator pressed');
                            setState(() {
                              Evalexp();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(83, 83)),
                          child: Text('=')),
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Result extends StatelessWidget {
  var printresult;
  Result(var ans) {
    this.printresult = ans;
  }
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 203, 224, 97),
      height: 230,
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Center(
          child: Text(
            '$printresult',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    ));
  }
}

class OnScreenNum extends StatelessWidget {
  var NumExp;
  OnScreenNum(var exp) {
    this.NumExp = exp;
  }
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Center(
          child: Text(
            '$NumExp',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    ));
  }
}
