import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:metr_reading/widgets/mobile/clientsetupaddmeterextended_widget.dart';
import 'package:metr_reading/widgets/mobile/clientsetupextendedaddmeter_widget.dart';

class ClientSetupPageWidget extends StatefulWidget {
  @override
  _ClientSetupPageWidgetState createState() => _ClientSetupPageWidgetState();
}

class SurveyCarriedOutByCategory {
  int id;
  String name;

  SurveyCarriedOutByCategory(this.id, this.name);

  static List<SurveyCarriedOutByCategory> getSurveyCarriedOutByCategories() {
    return <SurveyCarriedOutByCategory>[
      SurveyCarriedOutByCategory(1, 'Survey Carried Out By:'),
      SurveyCarriedOutByCategory(2, 'B'),
      SurveyCarriedOutByCategory(3, 'C'),
      SurveyCarriedOutByCategory(4, 'D'),
      SurveyCarriedOutByCategory(5, 'E'),
      SurveyCarriedOutByCategory(6, 'F'),
    ];
  }
}

class _ClientSetupPageWidgetState extends State<ClientSetupPageWidget> {
  bool widgetSecondVisible = false;

  void showWidget() {
    setState(() {
      widgetSecondVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      widgetSecondVisible = false;
    });
  }

  //third visible code
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

  //fourth visible code
  bool widgetFourVisible = false;

  void showFourWidget() {
    setState(() {
      widgetFourVisible = true;
    });
  }

  void hideFourWidget() {
    setState(() {
      widgetFourVisible = false;
    });
  }

  List<SurveyCarriedOutByCategory> _surveycategories =
      SurveyCarriedOutByCategory.getSurveyCarriedOutByCategories();
  List<DropdownMenuItem<SurveyCarriedOutByCategory>> _dropdownMenuItemsSurvey;
  SurveyCarriedOutByCategory _selectedSurveyCarriedOutByCategory;

  //Survey carried out by loop
  List<DropdownMenuItem<SurveyCarriedOutByCategory>>
      buildDropDownMenuItemsSurveyCarriedOutBy(List categories) {
    List<DropdownMenuItem<SurveyCarriedOutByCategory>> items = List();
    for (SurveyCarriedOutByCategory category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(category.name),
        ),
      );
    }
    return items;
  }

  onChangedSurveyCarriedOutByitem(
      SurveyCarriedOutByCategory surveyCarriedOutByCategory) {
    setState(() {
      _selectedSurveyCarriedOutByCategory = surveyCarriedOutByCategory;
    });
  }

  //loop end here

  @override
  void initState() {
    // survey carried out by state
    _dropdownMenuItemsSurvey =
        buildDropDownMenuItemsSurveyCarriedOutBy(_surveycategories);
    _selectedSurveyCarriedOutByCategory = _dropdownMenuItemsSurvey[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //field one code
        Row(
          children: [
            simpleContainerAdd(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        //textfieldforclient
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'Client:'),
          ),
        ),

        SizedBox(height: 10),

        //textfieldforsite
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'Site:'),
          ),
        ),


        SizedBox(
          height: 10,
        ),

        //textfieldforbuilding
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'Building:'),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        //textfieldforcustomerreferenceno
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'Customer Reference No:'),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        //surverycarriedoutonbehalfof
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'Carried out on behalf of:'),
          ),
        ),

        //field one ended here

        SizedBox(
          height: 10,
        ),

        //field two start here
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Row(
            children: [
              GestureDetector(
                child: simpleContainerAddTwo(),
                onTap: showThirdWidget,
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10,
        ),

        //Contactnamefield
        Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: widgetThirdVisible,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.lightGreen[600],
                      hintText: 'Contact Name:'),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              //emailfield
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.lightGreen[600],
                      hintText: 'E-mail:'),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //phonenofield
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.lightGreen[600],
                      hintText: 'Phone No:'),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //survey carried out by drop down menu
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightGreen[600],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: DropdownButton(
                      isExpanded: true,
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.grey[600],
                      value: _selectedSurveyCarriedOutByCategory,
                      items: _dropdownMenuItemsSurvey,
                      underline: Container(color: Colors.transparent),
                      onChanged: onChangedSurveyCarriedOutByitem,
                      iconSize: 30,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 10,
              ),

              //datesurveycarriedoutbyfield
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.lightGreen[600],
                      hintText: 'Date Survey Carried Out:'),
                ),
              ),


              SizedBox(
                height: 10,
              ),

              //accompainedbyfield
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.lightGreen[600],
                      hintText: 'Accompained By:'),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Siteengineerfield
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.lightGreen[600],
                      hintText: 'Site Engineer:'),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //siteengineeremail
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.lightGreen[600],
                      hintText: 'Site Engineer E-mail:'),
                ),
              ),
            ],
          ),
        ),

        Row(
          children: [
            GestureDetector(
              child: simpleContainerAddThree(),
              onTap: showWidget,
            ),
          ],
        ),

        SizedBox(
          height: 10,
        ),

        Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: widgetSecondVisible,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 250,
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
                            onTap: hideWidget,
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
                            'Test Meter Used',
                            style: TextStyle(
                              color: Colors.lightGreen[600],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //meterselectionbuttononly
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.lightGreen[600],
                          child: Text(
                            "Thermal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.lightGreen[600],
                          child: Text(
                            "Electrical",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.lightGreen[600],
                          child: Text(
                            "Other",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(
                              20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //meterselectionbuttoncodeendhere

                    SizedBox(
                      height: 20,
                    ),

                    //selectioncontainer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.lightGreen[600],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Model",
                                      style: TextStyle(
                                        color: Colors.lightGreen[600],
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.lightGreen[600],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Make",
                                      style: TextStyle(
                                        color: Colors.lightGreen[600],
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.lightGreen[600],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Serial No",
                                      style: TextStyle(
                                        color: Colors.lightGreen[600],
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                        IconButton(
                            icon: Icon(
                              MaterialIcons.attach_file,
                              size: 60,
                              color: Colors.lightGreen[600],
                            ),
                            onPressed: null),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Attach Calibration\nCertificate',
                            style: TextStyle(
                              color: Colors.lightGreen[600],
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        //add meter code start here

        GestureDetector(
            child: simpleContainerAddFour(),
          onTap: showFourWidget,
        ),
         Visibility(
             maintainSize: false,
             maintainAnimation: true,
             maintainState: true,
             visible: widgetFourVisible,
             child: ClientSetupWidgetExtended(),
         ),

        SizedBox(height: 10,),
        ClientSetupAddMeterExtended(),


      ],
    );
  }
}

Widget simpleContainerAdd() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 20),
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.lightGreen[600],
        shape: BoxShape.circle,
      ),
      child: Center(
        heightFactor: 30,
        widthFactor: 30,
        child: Icon(
          MaterialCommunityIcons.pencil,
          color: Colors.white,
          size: 38,
        ),
      ),
    ),
  );
}

Widget simpleContainerAddTwo() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 20),
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.lightGreen[600],
        shape: BoxShape.circle,
      ),
      child: Center(
        heightFactor: 30,
        widthFactor: 30,
        child: Icon(
          MaterialIcons.add,
          color: Colors.white,
          size: 38,
        ),
      ),
    ),
  );
}

Widget simpleContainerAddThree() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 20),
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.lightGreen[600],
        shape: BoxShape.circle,
      ),
      child: Center(
        heightFactor: 30,
        widthFactor: 30,
        child: Icon(
          MaterialIcons.add,
          color: Colors.white,
          size: 38,
        ),
      ),
    ),
  );
}

Widget simpleContainerAddFour() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.lightGreen[600],
            shape: BoxShape.circle,
          ),
          child: Center(
            heightFactor: 30,
            widthFactor: 30,
            child: Icon(
              MaterialIcons.add,
              color: Colors.white,
              size: 38,
            ),
          ),
        ),
      ),
      SizedBox(width: 10,),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
            'Add Meter',
          style: TextStyle(
            color: Colors.lightGreen[600],
            fontSize: 25,
          ),
        ),
      )
    ],
  );
}
