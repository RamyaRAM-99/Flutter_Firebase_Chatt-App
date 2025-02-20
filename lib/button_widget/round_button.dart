import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.btncolor,this.btnName, this.btnOnpressedFunction});

  final Color? btncolor;
  final String? btnName;
 final VoidCallback? btnOnpressedFunction ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: btncolor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: btnOnpressedFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btnName!,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );

  }
}
