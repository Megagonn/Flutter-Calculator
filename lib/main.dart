// import 'dart:io';

import 'package:calculator/keypad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  // Provider(create: (){});
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (_) {
      KeyPad(label: '',);
    },
  ));
}

dynamic inp = '';
button(b) {
  inp += b.toString();
}

calculator() {
  ContextModel cm = ContextModel();
  Parser p = Parser();
  Expression exp = p.parse(inp);
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  inp = eval.toString();
}

Color aa = Colors.white;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool theme = true;
  Color dayclr = Colors.blue.shade600;
  Color nightclr = Colors.grey.shade600;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Calculator', style: TextStyle(color: Colors.white)),
          ),
          // backgroundColor: mycolor,
          body: Container(
            // color: dayclr,
            child: Column(
              children: [
                Container(
                    // Icons container
                    padding: EdgeInsets.all(8),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                theme = !theme;
                              });
                            },
                            child: CircleAvatar(
                                child: Icon(Icons.wb_sunny_rounded,
                                    color: dayclr)),
                          ),
                        ],
                      ),
                    )),
                // Expanded(
                //display unit
                // child:
                Display(),
                Expanded(
                    //key pads
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 100,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      inp = '';
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text(
                                    'AC',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text('+/-',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.green.shade400)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text('%',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.green.shade400)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(7);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('7',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(8);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('8',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(9);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('9',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button('*');
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('x',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(4);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('4',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(5);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('5',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(6);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('6',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button('-');
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('-',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(1);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('1',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(2);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('2',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(3);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('3',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button('+');
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('+',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  '<-',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.teal.shade400),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button(0);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('0',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      button('.');
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('.',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.teal.shade400)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      calculator();
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white)),
                                  child: Text('=',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.red.shade900)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 600,
      height: 230,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.lightGreen,
        //   width: 5,
        //   style: BorderStyle.solid,
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              inp,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
