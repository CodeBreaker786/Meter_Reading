import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final hintText;
  final controller;
  final prefixText;
  Function validator;
  GlobalTextField(
      {Key key,
      @required this.hintText,
      @required this.controller,
      this.prefixText,
      this.validator})
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
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.black, width: 2)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            prefixText: prefixText,
            labelText: hintText,
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.grey[350],
            ),
            filled: true,
            fillColor: Colors.lightGreen[600],
            hintText: hintText),
      ),
    );
  }
}
