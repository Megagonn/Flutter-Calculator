import 'package:flutter/material.dart';

class Themey extends StatefulWidget {
  @override
  // Color dayclr = Colors.blue.shade600;
  _ThemeyState createState() => _ThemeyState();
}

// Color clr = Colors.blue.shade600;
// dark(Color val) {
//   clr = val;
// }

class _ThemeyState extends State<Themey> {
  // Color mycolor = Colors.white;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      // backgroundColor: mycolor,
      child: Center(
        child: Container(
          color: Colors.grey.shade200,
          width: 80,
          padding: EdgeInsets.all(5),
          child: Text('data')
        ),
      ),
    );
  }
}
