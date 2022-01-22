import 'package:flutter/material.dart';

class Themey extends StatefulWidget {
  @override
  _ThemeyState createState() => _ThemeyState();
}

// Color clr = Colors.blue.shade600;
// dark(Color val) {
//   clr = val;
// }

class _ThemeyState extends State<Themey> {
  // Color mycolor = Colors.white;
  Color dayclr = Colors.blue.shade600;
  Color nightclr = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Container(
      // backgroundColor: mycolor,
      child: Center(
        child: Container(
          color: Colors.grey.shade200,
          width: 80,
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    dayclr = Colors.blue.shade600;
                    nightclr = Colors.grey.shade400;
                  });
                },
                child: Icon(Icons.wb_sunny_rounded, color: dayclr),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    dayclr = Colors.grey.shade400;
                    nightclr = Colors.blue.shade600;
                  });
                },
                child: Icon(Icons.nightlight_round_outlined, color: nightclr),
              )
            ],
          ),
        ),
      ),
    );
  }
}
