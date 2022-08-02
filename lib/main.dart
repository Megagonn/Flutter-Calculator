// import 'dart:io';

import 'package:calculator/keypad.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Provider(create: (){});
  // GetIt.I.registerSingleton<Input>(Input());
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => Input()),
  //     ],
  //     child:
  runApp(const MyApp());
  //   ),
  // );
}

dynamic inp = '0';
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
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
            title:
                const Text('Calculator', style: TextStyle(color: Colors.white)),
          ),
          // backgroundColor: mycolor,
          body: Container(
            // color: dayclr,
            child: Column(
              children: [
                Container(
                    // Icons container
                    padding: const EdgeInsets.all(8),
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
                _display(),
                Expanded(
                    //key pads
                    child: Container(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 5,
                    right: 5,
                  ),
                  decoration: BoxDecoration(
                    // border: Border(bottom: BorderSide.none),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: theme ? Colors.grey.shade800 : Colors.white,
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
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(10),
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
                                  child: const Text(
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
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(10),
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
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(10),
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
                          _buildPad('/'),
                        ],
                      ),
                      Row(
                        children: [
                          _buildPad('7'),
                          _buildPad('8'),
                          _buildPad('9'),
                          _buildPad('*'),
                        ],
                      ),
                      Row(
                        children: [
                          _buildPad('4'),
                          _buildPad('5'),
                          _buildPad('6'),
                          _buildPad('-'),
                        ],
                      ),
                      Row(
                        children: [
                          _buildPad('1'),
                          _buildPad('2'),
                          _buildPad('3'),
                          _buildPad('+'),
                        ],
                      ),
                      Row(
                        children: [
                          _buildPad('00', fontSize: 20),
                          _buildPad('.'),
                          _buildPad('0'),
                          Expanded(
                            child: Container(
                              // color: Colors.amber.shade200,
                              // width: 50,
                              // height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     width: 1, color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      calculator();
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateColor
                                          .resolveWith((states) =>
                                              Color.fromARGB(255, 51, 47, 47))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text('=',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.red.shade900)),
                                  ),
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

  _display() {
    return Container(
      padding: const EdgeInsets.all(10),
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
              // context.watch()<Input>().input,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPad(label, {fontSize}) {
    return Expanded(
      child: Container(
        // color: Colors.amber.shade200,
        // width: 50,
        // height: 50,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            // border: Border.all(width: 1, color: Colors.blue.shade200),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Input().notify(label);
              setState(() {
                inp += label;
              });
              // widget.func;
              // notifyListeners();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 51, 47, 47))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: fontSize ?? 30, color: Colors.teal.shade400)),
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
      padding: const EdgeInsets.all(10),
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
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
