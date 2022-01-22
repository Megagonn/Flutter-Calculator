// import 'dart:io';

import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Calculator', style: TextStyle(color: Colors.white)),
        ),
        // backgroundColor: mycolor,
        body: Container(
          child: Column(
            children: [
              Container(
                  // Icons container
                  padding: EdgeInsets.all(8),
                  child: Container(
                    child: Themey(),
                  )),
              // Expanded(
              //display unit
              // child:
              Container(
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
              ),
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
                                onPressed:(){
                                  setState(() {
                                    inp='';
                                  });
                                },
                                child: Text(
                                  'AC',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.green.shade400),
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
                                    button('/');
                                  });
                                },
                                child: Text('/',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.teal.shade400)),
                              ),
                            ),
                          ),
                        )
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
                                    fontSize: 30, color: Colors.teal.shade400),
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
                                child: Text('=',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.red.shade400)),
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
    );
  }
}
