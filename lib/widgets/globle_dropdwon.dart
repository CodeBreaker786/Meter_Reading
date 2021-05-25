import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class GlobalDropdwon extends StatelessWidget {
  String hintText;
  Function getItemList;
  Function onChanged;
  Function validator;

  TextEditingController textEditingController;

  GlobalDropdwon(
      {Key key,
      @required this.hintText,
      @required this.getItemList,
      @required this.onChanged,
      this.validator,
      @required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
              controller: textEditingController,
              cursorColor: Colors.white70,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.white60, fontSize: 18),
                fillColor: Colors.lightGreen[600],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              )),
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
              color: Colors.lightGreen[200],
              borderRadius: BorderRadius.all(Radius.circular(12))),
              validator: validator,
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          suggestionsCallback: (pattern) async {
            List list = await getItemList({pattern});
            return list;
          },
          onSuggestionSelected: onChanged),
    );
  }
}
