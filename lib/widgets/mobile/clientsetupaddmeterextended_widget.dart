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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //kwh
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  "kWh",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.lightGreen[600],
              ),
            ),

            SizedBox(
              width: 5,
            ),

            //litres
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  "Litres",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.lightGreen[600],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            //M3
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  "M3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.lightGreen[600],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            //other
            //M3
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  "Other",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.lightGreen[600],
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: Row(
            children: [
              Text(
                'Meter Type',
                style: TextStyle(
                  color: Colors.lightGreen[600],
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  "Main\nFiscal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.lightGreen[600],
              ),
            ),
            SizedBox(
              width: 5,
            ),

            //checkmeter
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  "Check Meter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.lightGreen[600],
              ),
            ),
            SizedBox(
              width: 5,
            ),

            //submeter
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  "Sub\nMeter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.lightGreen[600],
              ),
            ),
          ],
        ),

        SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text(
                      "Yes/No",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(200),
                    ),
                    color: Colors.lightGreen[600],
                  ),
                ),
                Text(
                  'MID Approved ?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.lightGreen[600],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: showFirstWidget,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        "Yes/No",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                      color: Colors.lightGreen[600],
                    ),
                  ),
                ),
                Text(
                  'AMR Enable ?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.lightGreen[600],
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(
          height: 20,
        ),

        Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: widgetFirstVisible,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 510,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightGreen[600]),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: hideFirstWidget,
                            child: Text(
                              'Hide',
                              style: TextStyle(
                                color: Colors.lightGreen[600],
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'AMR is Enable',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.lightGreen[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Center(
                                child: Text(
                                  "Yes/No",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(200),
                                ),
                                color: Colors.lightGreen[600],
                              ),
                            ),
                            Text(
                              'On Network',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightGreen[600],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Center(
                                child: Text(
                                  "Yes/No",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(200),
                                ),
                                color: Colors.lightGreen[600],
                              ),
                            ),
                            Text(
                              'On BMS?',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightGreen[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'Comms Protocol Please Select One',
                      style: TextStyle(
                        color: Colors.lightGreen[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "Pulse",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                            color: Colors.lightGreen[600],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "Modbus",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                            color: Colors.lightGreen[600],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "M-Bus",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                            color: Colors.lightGreen[600],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "Other",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                            color: Colors.lightGreen[600],
                          ),
                        ),
                      ],
                    ),
                    //comms protocol end here

                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'Enter Pulse'),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              "Yes/No",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                            color: Colors.lightGreen[600],
                          ),
                        ),
                        Text(
                          'Pulse Lead Required',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightGreen[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),

        //picture column
        Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.lightGreen[600],
                shape: BoxShape.circle,
              ),
              child: Center(
                heightFactor: 30,
                widthFactor: 30,
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    EvilIcons.camera,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Attach Picture',
              style: TextStyle(
                color: Colors.lightGreen[600],
                fontSize: 20,
              ),
            )
          ],
        ),
        //picture column end here

        SizedBox(
          height: 10,
        ),

        //note code start here
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: TextFormField(
            maxLines: 8,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'Add Note/Issue'),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: Row(
            children: [
              Text(
                'Technical Info',
                style: TextStyle(
                  color: Colors.lightGreen[600],
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        //Meter Selection Code heat or electric

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: showSecondWidget,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Icon(
                        Ionicons.ios_bulb,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                      color: Colors.lightGreen[600],
                    ),
                  ),
                ),

                Text(
                  'Electric Meter',
                  style: TextStyle(
                    color: Colors.lightGreen[600],
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: showThirdWidget,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Icon(
                        Octicons.flame,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                      color: Colors.lightGreen[600],
                    ),
                  ),
                ),

                Text(
                  'Heat Meter',
                  style: TextStyle(
                    color: Colors.lightGreen[600],
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        //meter selection heat or electirce code end here

        SizedBox(height: 10,),

        //electric meter code
        Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: widgetSecondVisible,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 590,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightGreen[600]),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: hideSecondWidget,
                            child: Text(
                              'Hide',
                              style: TextStyle(
                                color: Colors.lightGreen[600],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Electric Meter is Selected',
                            style: TextStyle(
                              color: Colors.lightGreen[600],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //addvoltage textfield
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'Enter Pulse'),
                      ),
                    ),


                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text(
                                  "Yes/No",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(200),
                                ),
                                color: Colors.lightGreen[600],
                              ),
                            ),
                            Text(
                              'Voltage L1 & L2\n & L3 Ok ?',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightGreen[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        SizedBox(width: 30,),


                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text(
                                  "Yes/No",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(200),
                                ),
                                color: Colors.lightGreen[600],
                              ),
                            ),
                            Text(
                              'CT Phase Orientation\nOk',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightGreen[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              "Yes/No",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(200),
                            ),
                            color: Colors.lightGreen[600],
                          ),
                        ),
                        Text(
                          'Current Tested\nOk?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightGreen[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    SizedBox(height: 10,),

                    //CT Ratio on meter

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'CT Ratio on Meter'),
                      ),
                    ),


                    SizedBox(height: 10,),

                    //Breaker Rating

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'Breaker Rating'),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        //electrice meter code end here

        SizedBox(height: 10,),

        //heat meter code
        Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: widgetThirdVisible,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 850,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightGreen[600]),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: hideThirdWidget,
                            child: Text(
                              'Hide',
                              style: TextStyle(
                                color: Colors.lightGreen[600],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Heat Meter is Selected',
                            style: TextStyle(
                              color: Colors.lightGreen[600],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                child: Center(
                                  child: Text(
                                    "Mains",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(200),
                                  ),
                                  color: Colors.lightGreen[600],
                                ),
                              ),
                               SizedBox(height: 5,),
                               Container(
                                width: 80,
                                height: 80,
                                child: Center(
                                  child: Text(
                                    "Battery",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(200),
                                  ),
                                  color: Colors.lightGreen[600],
                                ),
                              ),
                              Text(
                                'Power By',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.lightGreen[600],
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 70,
                                    right: 70,
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          borderSide: BorderSide.none,
                                          //borderSide: const BorderSide(),
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                        filled: true,
                                        fillColor: Colors.lightGreen[600],
                                        hintText: 'Add T1 Temperature'),
                                  ),
                                ),

                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 70,
                                    right: 70,
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          borderSide: BorderSide.none,
                                          //borderSide: const BorderSide(),
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                        filled: true,
                                        fillColor: Colors.lightGreen[600],
                                        hintText: 'Add T2 Temperature'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         width: 130,
                         height: 130,
                         child: Center(
                           child: Icon(
                             EvilIcons.camera,
                             color: Colors.white,
                             size: 100,
                           ),
                         ),
                         decoration: BoxDecoration(
                           border: Border.all(width: 3),
                           borderRadius: BorderRadius.all(
                             Radius.circular(200),
                           ),
                           color: Colors.lightGreen[600],
                         ),
                       ),
                       SizedBox(width: 20,),
                       Text(
                         'Add Thermal\nImage',
                         style: TextStyle(
                           color: Colors.lightGreen[600],
                           fontSize: 25,
                         ),
                       )
                     ],
                   ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                        top: 10,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'Add Thermal Image No'),
                      ),
                    ),
                    SizedBox(height: 10,),


                    //K t one and two
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                        top: 10,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'K(T1-2)'),
                      ),
                    ),

                    SizedBox(height: 10,),

                    //Temperature check
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'KW'),
                      ),
                    ),

                    SizedBox(height: 10,),

                    //Temperature check
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'Flow Rate'),
                      ),
                    ),

                    SizedBox(height: 10,),

                    //volume on meter
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'Volume on Meter'),
                      ),
                    ),

                    SizedBox(height: 10,),

                    //Volume on bms
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.lightGreen[600],
                            hintText: 'Volume on BMS'),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        //heat meter code end here

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            height: 50.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightGreen[600],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Save Report",
                        style: TextStyle(
                          color: Colors.lightGreen[600],
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 30,),

        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            height: 50.0,
            width: 300,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen[600],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesome.file_excel_o,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10,),
                    Center(
                      child: Text(
                        "Generate Excel Report",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            height: 50.0,
            width: 300,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen[600],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Octicons.file_pdf,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10,),
                    Center(
                      child: Text(
                        "Generate PDF Report",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            height: 50.0,
            width: 300,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen[600],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Fontisto.onenote,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10,),
                    Center(
                      child: Text(
                        "Generate Note Report",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),


        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            height: 50.0,
            width: 300,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen[600],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MaterialCommunityIcons.emoticon_angry_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10,),
                    Center(
                      child: Text(
                        "Generate Fault Report",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),



      ],
    );
  }
}
