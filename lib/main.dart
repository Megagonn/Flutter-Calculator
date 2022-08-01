// import 'dart:io';

import 'package:calculator/keypad.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  // Provider(create: (){});
  GetIt.I.registerSingleton<Input>(Input());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Input()),
        // ChangeNotifierProvider(create: (_) => KeyPad(label: '',)),
      ],
      child: MyApp(),
    ),
  );
}

// dynamic inp = '';
// button(b) {
//   inp += b.toString();
// }

calculator() {
  ContextModel cm = ContextModel();
  Parser p = Parser();
  // Expression exp = p.parse(inp);
  // double eval = exp.evaluate(EvaluationType.REAL, cm);
  // inp = eval.toString();
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
  void initState() {
    super.initState();
    Provider.debugCheckInvalidValueType;
    ProviderBinding.debugInstance;
  }

  @override
  Widget build(BuildContext context) {
    // var prov = context.read<KeyPad>(
    //   ,

    // );
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
                          Provider.of<Input>(context, listen: true).input,
                          // context.watch()<Input>().input,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                    borderRadius: BorderRadius.only(
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
                                      // inp = '';
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
                          KeyPad(
                            label: '/',
                            func: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          KeyPad(label: '7', func:(){}),
                          KeyPad(label: '8', func:(){}),
                          KeyPad(label: '9', func:(){}),
                          KeyPad(label: '*', func:(){}),
                          // KeyPad(label: '8'),
                          // KeyPad(label: '9'),
                          // KeyPad(label: '*'),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(8);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('8',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(9);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('9',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button('*');
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('x',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          // KeyPad(label: '4'),
                          // KeyPad(label: '5'),
                          // KeyPad(label: '6'),
                          // KeyPad(label: '-'),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(4);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('4',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(5);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('5',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(6);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('6',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button('-');
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('-',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          // KeyPad(label: '1'),
                          // KeyPad(label: '2'),
                          // KeyPad(label: '3'),
                          // KeyPad(label: '+'),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(1);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('1',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(2);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('2',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(3);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('3',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button('+');
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('+',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: Text(
                          //         '<-',
                          //         style: TextStyle(
                          //             fontSize: 30,
                          //             color: Colors.teal.shade400),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // KeyPad(label: '<-'),
                          // KeyPad(label: '0'),
                          // KeyPad(label: '.'),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button(0);
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('0',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     // color: Colors.amber.shade200,
                          //     width: 50,
                          //     height: 50,
                          //     padding: EdgeInsets.all(5),
                          //     margin: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width: 1, color: Colors.blue.shade200),
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             button('.');
                          //           });
                          //         },
                          //         style: ButtonStyle(
                          //             backgroundColor:
                          //                 MaterialStateColor.resolveWith(
                          //                     (states) => Colors.white)),
                          //         child: Text('.',
                          //             style: TextStyle(
                          //                 fontSize: 30,
                          //                 color: Colors.teal.shade400)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
    var prov = context.read<Input>().input;
    print(prov);
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
              prov,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
