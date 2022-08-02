import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

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
  bool removeInput = false;
  double answer = 0;
  TextEditingController _controller = TextEditingController();

  calculator() {
    ContextModel cm = ContextModel();
    Parser p = Parser();
    Expression exp = p.parse(_controller.text);
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toDouble();
    return eval;
  }

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
                    color: theme ? Colors.grey.shade800 : Color.fromARGB(255, 194, 180, 180),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
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
                                      _controller.clear();
                                      answer = 0;
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateColor
                                          .resolveWith((states) =>
                                              Color.fromARGB(255, 51, 47, 47))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                                    child: Text('AC',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _buildPad('%'),
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
                                      // var del = _controller.text.split('').removeLast().toString();
                                      

                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateColor
                                          .resolveWith((states) =>
                                              Color.fromARGB(255, 51, 47, 47))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text('C',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.red.shade900)),
                                  ),
                                ),
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
                          _buildPad('-', fontSize: 34),
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
                          _buildPad('00',
                              fontSize: 20, vPadding: 16, hPadding: 8),
                          _buildPad('0'),
                          _buildPad('.'),
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
                                      removeInput = true;
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
          crossAxisAlignment: CrossAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: [
            // Text(
            //   inp,
            //   // context.watch()<Input>().input,
            //   textAlign: TextAlign.right,
            //   style: const TextStyle(
            //     fontSize: 50,
            //   ),
            // ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.none,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
            Text(
              answer.toString().length > 9
                  ? answer.toStringAsExponential(1)
                  : answer.toString(),
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 50,
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildPad(label, {fontSize, vPadding, hPadding}) {
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
                if (!removeInput) {
                  _controller.text += label;
                  // _controller.text = inp;
                } else {
                  _controller.text = answer.toString() + label;
                  //  _controller.text = inp;
                  removeInput = false;
                  answer = 0;
                }
              });
              // widget.func;
              // notifyListeners();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 51, 47, 47))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: vPadding ?? 12.0, horizontal: hPadding ?? 12),
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
