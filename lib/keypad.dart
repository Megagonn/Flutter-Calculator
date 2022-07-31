import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class KeyPad extends StatefulWidget {
  const KeyPad({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

dynamic inp = '';

class _KeyPadState extends State<KeyPad> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    String label = widget.label;
    return Expanded(
      child: Container(
        // color: Colors.amber.shade200,
        width: 50,
        height: 50,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blue.shade200),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                inp += label.toString();
                // notifyListeners();
              });
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white)),
            child: Text(label,
                style: TextStyle(fontSize: 30, color: Colors.teal.shade400)),
          ),
        ),
      ),
    );
  }
}

class Input with ChangeNotifier, DiagnosticableTreeMixin {
  String get input => inp;
  String label = '';
  void notify() {
    label = inp;
    notifyListeners();
  }
}
