import 'package:flutter/material.dart';

class ClientSetupExtendedAddMeterFirstWidget extends StatefulWidget {
  @override
  _ClientSetupExtendedAddMeterFirstWidgetState createState() => _ClientSetupExtendedAddMeterFirstWidgetState();
}


class ParentMeterCategory {
  int id;
  String name;

  ParentMeterCategory(this.id, this.name);

  static List<ParentMeterCategory> getParentMeterCategories() {
    return <ParentMeterCategory>[
      ParentMeterCategory(1, 'Parent Meter:'),
      ParentMeterCategory(2, 'B'),
      ParentMeterCategory(3, 'C'),
      ParentMeterCategory(4, 'D'),

    ];
  }
}

class ManufacturerCategory {
  int id;
  String name;

  ManufacturerCategory(this.id, this.name);

  static List<ManufacturerCategory> getManufacturerCategories() {
    return <ManufacturerCategory>[
      ManufacturerCategory(1, 'Manufacturer:'),
      ManufacturerCategory(2, 'B'),
      ManufacturerCategory(3, 'C'),
      ManufacturerCategory(4, 'D'),

    ];
  }
}

class MeterModelCategory {
  int id;
  String name;

  MeterModelCategory(this.id, this.name);

  static List<MeterModelCategory> getMeterModelCategories() {
    return <MeterModelCategory>[
      MeterModelCategory(1, 'Meter Model'),
      MeterModelCategory(2, 'B'),
      MeterModelCategory(3, 'C'),
      MeterModelCategory(4, 'D'),

    ];
  }
}

class FloorCategory {
  int id;
  String name;

  FloorCategory(this.id, this.name);

  static List<FloorCategory> getFloorCategories() {
    return <FloorCategory>[
      FloorCategory(1, 'Floor:'),
      FloorCategory(2, 'B'),
      FloorCategory(3, 'C'),
      FloorCategory(4, 'D'),

    ];
  }
}

class DemiseServedCategory {
  int id;
  String name;

  DemiseServedCategory(this.id, this.name);

  static List<DemiseServedCategory> getDemiseServedCategories() {
    return <DemiseServedCategory>[
      DemiseServedCategory(1, 'Demise Served:'),
      DemiseServedCategory(2, 'B'),
      DemiseServedCategory(3, 'C'),
      DemiseServedCategory(4, 'D'),

    ];
  }
}

class _ClientSetupExtendedAddMeterFirstWidgetState extends State<ClientSetupExtendedAddMeterFirstWidget> {

  //parentmeter code
  List<ParentMeterCategory> _parentmetercategories =
  ParentMeterCategory.getParentMeterCategories();
  List<DropdownMenuItem<ParentMeterCategory>> _dropdownMenuItemsForParentMeter;
  ParentMeterCategory _selectedParentMeterCategory;

  //parent meter drop down menu loop
  List<DropdownMenuItem<ParentMeterCategory>>
  buildDropDownMenuItemsParentMeterCategory(List categories) {
    List<DropdownMenuItem<ParentMeterCategory>> items = List();
    for (ParentMeterCategory category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(
            category.name,

          ),
        ),
      );
    }
    return items;
  }

  onParentMeteritem(
      ParentMeterCategory parentMeterCategory) {
    setState(() {
      _selectedParentMeterCategory = parentMeterCategory;
    });
  }
  //parent meter loop end here


  //manufacturer loop
  List<ManufacturerCategory> _manufacturercategory =
  ManufacturerCategory.getManufacturerCategories();
  List<DropdownMenuItem<ManufacturerCategory>> _dropdownMenuItemsForManufacturerCategory;
  ManufacturerCategory _selectedManufacturerCategory;

  //manufacturer drop down menu loop
  List<DropdownMenuItem<ManufacturerCategory>>
  buildDropDownMenuItemsManufacturerCategory(List categories) {
    List<DropdownMenuItem<ManufacturerCategory>> items = List();
    for (ManufacturerCategory category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(
            category.name,

          ),
        ),
      );
    }
    return items;
  }

  onManufacturerItem(
      ManufacturerCategory manufacturerCategory) {
    setState(() {
      _selectedManufacturerCategory = manufacturerCategory;
    });
  }
  //manufacturer loop end here


  //model meter loop start here
  List<MeterModelCategory> _meterModelcategory =
  MeterModelCategory.getMeterModelCategories();
  List<DropdownMenuItem<MeterModelCategory>> _dropdownMenuItemsForMeterModelCategory;
  MeterModelCategory _selectedMeterModelCategory;

  //manufacturer drop down menu loop
  List<DropdownMenuItem<MeterModelCategory>>
  buildDropDownMenuItemsMeterModelCategory(List categories) {
    List<DropdownMenuItem<MeterModelCategory>> items = List();
    for (MeterModelCategory category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(
            category.name,

          ),
        ),
      );
    }
    return items;
  }

  onMeterModelCategoryItem(
      MeterModelCategory meterModelCategory) {
    setState(() {
      _selectedMeterModelCategory = meterModelCategory;
    });
  }
  //model meter loop end here

  //floor loop start here
  List<FloorCategory> _floorcategory =
  FloorCategory.getFloorCategories();
  List<DropdownMenuItem<FloorCategory>> _dropdownMenuItemsForFloorCategory;
  FloorCategory _selectedFloorCategory;

  //manufacturer drop down menu loop
  List<DropdownMenuItem<FloorCategory>>
  buildDropDownMenuItemsFloorCategory(List categories) {
    List<DropdownMenuItem<FloorCategory>> items = List();
    for (FloorCategory category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(
            category.name,

          ),
        ),
      );
    }
    return items;
  }

  onFloorCategoryItem(
      FloorCategory floorCategory) {
    setState(() {
      _selectedFloorCategory= floorCategory;
    });
  }

  //floor loop end here

  //desmise category loop start here
  List<DemiseServedCategory> _demiseservedcategory =
  DemiseServedCategory.getDemiseServedCategories();
  List<DropdownMenuItem<DemiseServedCategory>> _dropdownMenuItemsForDemiseServedCategory;
  DemiseServedCategory _selectedDemiseServedCategory;

  //manufacturer drop down menu loop
  List<DropdownMenuItem<DemiseServedCategory>>
  buildDropDownMenuItemsDemiseServedCategory(List categories) {
    List<DropdownMenuItem<DemiseServedCategory>> items = List();
    for (DemiseServedCategory category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(
            category.name,

          ),
        ),
      );
    }
    return items;
  }

  onDemiseServedCategoryItem(
      DemiseServedCategory servedCategory) {
    setState(() {
      _selectedDemiseServedCategory= servedCategory;
    });
  }

  @override
  void initState() {
    // parent meter state
    _dropdownMenuItemsForParentMeter =
        buildDropDownMenuItemsParentMeterCategory(_parentmetercategories);
    _selectedParentMeterCategory = _dropdownMenuItemsForParentMeter[0].value;
    //manufacturer state
    _dropdownMenuItemsForManufacturerCategory =
        buildDropDownMenuItemsManufacturerCategory(_manufacturercategory);
    _selectedManufacturerCategory = _dropdownMenuItemsForManufacturerCategory[0].value;
    //metermodelcategories
    _dropdownMenuItemsForMeterModelCategory =
        buildDropDownMenuItemsMeterModelCategory(_meterModelcategory);
    _selectedMeterModelCategory = _dropdownMenuItemsForMeterModelCategory[0].value;
    //floorcategories
    _dropdownMenuItemsForFloorCategory =
        buildDropDownMenuItemsFloorCategory(_floorcategory);
    _selectedFloorCategory = _dropdownMenuItemsForFloorCategory[0].value;
    //desmiseservedcategories
    _dropdownMenuItemsForDemiseServedCategory =
        buildDropDownMenuItemsDemiseServedCategory(_demiseservedcategory);
    _selectedDemiseServedCategory = _dropdownMenuItemsForDemiseServedCategory[0].value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),

        //add meter first row start here
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: [
              Expanded(
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
                      hintText: 'Supply Reference:'),
                ),
              ),

              SizedBox(width: 10,),


              Expanded(
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
                      hintText: 'Supply Name:'),
                ),
              ),

              SizedBox(width: 10,),

              //supply number
              Expanded(
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
                      hintText: 'Supply Number:'),
                ),
              ),
            ],
          ),
        ),
        //add meter first row end here

        SizedBox(height: 10,),

        //add meter second row start here
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 376,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen[600],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: DropdownButton(
                    isExpanded: true,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.grey[700],
                    value: _selectedParentMeterCategory,
                    items: _dropdownMenuItemsForParentMeter,
                    underline: Container(color: Colors.transparent),
                    onChanged: onParentMeteritem,
                    iconSize: 30,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10,),

              //manufacturer
              Container(
                height: 60,
                width: 376,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen[600],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: DropdownButton(
                    isExpanded: true,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.grey[700],
                    value: _selectedManufacturerCategory,
                    items: _dropdownMenuItemsForManufacturerCategory,
                    underline: Container(color: Colors.transparent),
                    onChanged: onManufacturerItem,
                    iconSize: 30,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10,),


              Container(
                height: 60,
                width: 376,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen[600],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: DropdownButton(
                    isExpanded: true,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.grey[700],
                    value: _selectedMeterModelCategory,
                    items: _dropdownMenuItemsForMeterModelCategory,
                    underline: Container(color: Colors.transparent),
                    onChanged: onMeterModelCategoryItem,
                    iconSize: 30,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        // add meter second row end here
        SizedBox(height: 10,),

        //add meter third row start here
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: [
              //meter read
              Expanded(
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
                      hintText: 'Meter Read:'),
                ),
              ),

              SizedBox(width: 10,),

              //floor
              Container(
                height: 60,
                width: 376,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen[600],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: DropdownButton(
                    isExpanded: true,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.grey[700],
                    value: _selectedFloorCategory,
                    items: _dropdownMenuItemsForFloorCategory,
                    underline: Container(color: Colors.transparent),
                    onChanged: onFloorCategoryItem,
                    iconSize: 30,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10,),

              //Demise Served
              Container(
                height: 60,
                width: 376,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen[600],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: DropdownButton(
                    isExpanded: true,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.grey[700],
                    value: _selectedDemiseServedCategory,
                    items: _dropdownMenuItemsForDemiseServedCategory,
                    underline: Container(color: Colors.transparent),
                    onChanged: onDemiseServedCategoryItem,
                    iconSize: 30,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //add meter third row end here
        SizedBox(height: 10,),

        //location text field
        Padding(
          padding: const EdgeInsets.only(left: 415, right: 415),
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
                hintText: 'Location:'),
          ),
        ),
      



      ],
    );
  }
}
