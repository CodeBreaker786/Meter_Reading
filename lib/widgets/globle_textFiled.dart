import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final hintText;
  final controller;
  Function validator;
  GlobalTextField({Key key, @required this.hintText, @required this.controller,this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: TextFormField(
        controller: controller,
        cursorWidth: 2,
        validator: validator,
        cursorColor: Colors.white54,
        cursorRadius: Radius.circular(5),
        style: TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Colors.lightGreen[600],
            hintText: hintText),
      ),
    );
  }
}
