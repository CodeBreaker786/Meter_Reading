import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ClientSetupAddMeterExtended extends StatefulWidget {
  @override
  _ClientSetupAddMeterExtendedState createState() =>
      _ClientSetupAddMeterExtendedState();
}

class _ClientSetupAddMeterExtendedState
    extends State<ClientSetupAddMeterExtended> {
  bool widgetFirstVisible = false;

  void showFirstWidget() {
    setState(() {
      widgetFirstVisible = true;
    });
  }

  void hideFirstWidget() {
    setState(() {
      widgetFirstVisible = false;
    });
  }

  //second widget visible code

  bool widgetSecondVisible = false;

  void showSecondWidget() {
    setState(() {
      widgetSecondVisible = true;
    });
  }

  void hideSecondWidget() {
    setState(() {
      widgetSecondVisible = false;
    });
  }

  //third widget visible code
  bool widgetThirdVisible = false;

  void showThirdWidget() {
    setState(() {
      widgetThirdVisible = true;
    });
  }

  void hideThirdWidget() {
    setState(() {
      widgetThirdVisible = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
      ],
    );
  }
}
