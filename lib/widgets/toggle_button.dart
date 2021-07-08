import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

Widget toggleButton({
  Key key,
  Function function,
}) {
  return Container(
      height: 40,
      child: LiteRollingSwitch(
        value: true,
        textOn: 'Yes',
        textOff: 'No',
        animationDuration: Duration(milliseconds: 450),
        colorOn: Colors.greenAccent[700],
        colorOff: Colors.redAccent[700],
        iconOn: Icons.done,
        iconOff: Icons.close,
        textSize: 16.0,
        onChanged: function,
      ));
}
