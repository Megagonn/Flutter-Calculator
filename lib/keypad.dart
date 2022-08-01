import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

class KeyPad extends StatefulWidget {
  const KeyPad({Key? key, required this.label, required this.func})
      : super(key: key);
  final String label;
  final void Function() func;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

// dynamic inp = '';

class _KeyPadState extends State<KeyPad> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    String label = widget.label;
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
              Input().notify(label);
              // setState(() {});
              widget.func;
              // notifyListeners();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 51, 47, 47))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(label,
                  style: TextStyle(fontSize: 30, color: Colors.teal.shade400)),
            ),
          ),
        ),
      ),
    );
  }
}

String label = '';

class Input with ChangeNotifier {
  String get input => label;
  notify(text) {
    label += text;
    // print(input);
    notifyListeners();
    // return input;
  }
}
