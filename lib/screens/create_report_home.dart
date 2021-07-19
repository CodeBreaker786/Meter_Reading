import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:metr_reading/global/bloc/global_bloc.dart';
import 'package:metr_reading/models/meter.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/models/test_meter.dart';
import 'package:metr_reading/screens/add_meter_page.dart';
import 'package:metr_reading/services/could_firebase.dart';
import 'package:metr_reading/utils/get_file_size.dart';
import 'package:metr_reading/utils/upload_file.dart';
import 'package:metr_reading/widgets/flush_bar.dart';
import 'package:metr_reading/widgets/globle_dropdwon.dart';
import 'package:metr_reading/widgets/globle_textFiled.dart';
import 'package:metr_reading/widgets/loading_indicator.dart';

class CreateReportPage extends StatefulWidget {
  @override
  _CreateReportPageState createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  final _formKey = GlobalKey<FormState>();
  List<bool> cardList = List.generate(4, (index) => index == 0 ? true : false);

  TextEditingController _editingControllerClient = TextEditingController();
  TextEditingController _editingControllerSite = TextEditingController();
  TextEditingController _editingControllerBuilding = TextEditingController();
  TextEditingController _editingControllerCustomer = TextEditingController();
  TextEditingController _editingControllerCarried = TextEditingController();
  TextEditingController _editingControllerContactName = TextEditingController();
  TextEditingController _editingControllerEmail = TextEditingController();
  TextEditingController _editingControllerPhohneNo = TextEditingController();
  TextEditingController _editingControllerSiteEngineerPhoneNo =
      TextEditingController();
  TextEditingController _editingControllerDateSurveyCarriedOut =
      TextEditingController();
  TextEditingController _editingControllerAccompainedBy =
      TextEditingController();
  TextEditingController _editingControllerSiteEngineer =
      TextEditingController();
  TextEditingController _editingControllerSiteEngineerEmail =
      TextEditingController();
  TextEditingController _editingControllerModel = TextEditingController();
  TextEditingController _editingControllerMake = TextEditingController();
  TextEditingController _editingControllerSerialNo = TextEditingController();
  TextEditingController _editingControllerMeter = TextEditingController();
  List<Meter> meters = [];
  Report report;
  File attachCalibrationCertificate;
  final ScrollController _scrollController = ScrollController();

  List<bool> meterToggle = List.generate(3, (index) => false);
  final df = DateFormat('dd-MM-yyyy');
  DateTime dateTime;
  String fileSize = '';
  String fileURL;
  @override
  void initState() {
    _editingControllerDateSurveyCarriedOut.text = df.format(DateTime.now());
    dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Client Site Setup',
          style: TextStyle(fontSize: 25, color: Colors.grey[300]),
        ),
      ),
      body: BlocBuilder<GlobalBloc, GlobalState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    elevation: 1,
                    expansionCallback: (index, isExpanded) {
                      for (int i = 0; i < cardList.length; i++) {
                        if (i == index) {
                          cardList[index] = !isExpanded;
                        } else {
                          cardList[i] = false;
                        }
                      }
                      setState(() {});
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                child: Text(
                                  'Client Details',
                                  style: buildTileTitleStyle(),
                                ),
                              ),
                          isExpanded: cardList[0],
                          body: Column(
                            children: [
                              GlobalTextField(
                                hintText: 'Client',
                                controller: _editingControllerClient,
                                validator: (String text) {
                                  if (text == null || text.isEmpty) {
                                    return "Please Enter Client";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              GlobalTextField(
                                hintText: 'Site',
                                controller: _editingControllerSite,
                                validator: (String text) {
                                  if (text == null || text.isEmpty) {
                                    return "Please Enter Site";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              GlobalTextField(
                                hintText: 'Building',
                                controller: _editingControllerBuilding,
                              ),
                              GlobalTextField(
                                hintText: 'Customer Reference No:',
                                controller: _editingControllerCustomer,
                                validator: (String text) {
                                  if (text == null || text.isEmpty) {
                                    return "Please Enter Customer Reference No";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              GlobalTextField(
                                hintText: 'Carried out on behalf of',
                                controller: _editingControllerCarried,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Text(
                            'Report Carried Out By',
                            style: buildTileTitleStyle(),
                          ),
                        ),
                        isExpanded: cardList[1],
                        body: Column(
                          children: [
                            GlobalTextField(
                              hintText: 'Contact Name',
                              controller: _editingControllerContactName,
                              validator: (String text) {
                                if (text == null || text.isEmpty) {
                                  return "Please Enter Contact Name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            GlobalTextField(
                              hintText: 'E-mail:',
                              controller: _editingControllerEmail,
                            ),
                            GlobalTextField(
                              hintText: 'Phone No',
                              controller: _editingControllerPhohneNo,
                            ),
                            //survey carried out by drop down menu

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 12),
                              child: TextFormField(
                                controller:
                                    _editingControllerDateSurveyCarriedOut,
                                cursorWidth: 2,
                                cursorColor: Colors.white54,
                                cursorRadius: Radius.circular(5),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: () async {
                                          await DatePicker.showDatePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(2020, 3, 5),
                                                  maxTime: DateTime(2030, 6, 7),
                                                  onChanged: (date) {
                                            print('change $date');
                                          }, onConfirm: (date) {
                                            print('confirm $date');
                                          },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.en)
                                              .then((date) {
                                            setState(() {
                                              if (date != null) {
                                                dateTime = date;
                                                _editingControllerDateSurveyCarriedOut
                                                    .text = df.format(date);
                                              }
                                            });
                                          });
                                        },
                                        child: Icon(Icons.calendar_today,
                                            color: Colors.white70)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    labelText: 'Date Survey Carried Out',
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
                                    hintText: 'Date Survey Carried Out'),
                              ),
                            ),

                            GlobalTextField(
                              hintText: 'Accompained By',
                              controller: _editingControllerAccompainedBy,
                            ),
                            GlobalTextField(
                              hintText: 'Site Engineer',
                              controller: _editingControllerSiteEngineer,
                            ),
                            GlobalTextField(
                              hintText: 'Site Engineer Phone No',
                              controller: _editingControllerSiteEngineerPhoneNo,
                            ),
                            GlobalTextField(
                              hintText: 'Site Engineer E-mail',
                              controller: _editingControllerSiteEngineerEmail,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                child: Text(
                                  'Test Meter Used',
                                  style: buildTileTitleStyle(),
                                ),
                              ),
                          isExpanded: cardList[2],
                          body: Column(
                            children: [
                              GlobalDropdwon(
                                  hintText: 'Meter Type',
                                  textEditingController:
                                      _editingControllerMeter,
                                  onChanged: (value) {
                                    setState(() {
                                      _editingControllerMeter.text = value;
                                    });
                                  },
                                  getItemList: (searchText) async {
                                    await Future.delayed(
                                        Duration(seconds: 0), () {});
                                    return [
                                      'Thermal',
                                      'Electric',
                                      'Gas',
                                      'Water'
                                    ];
                                  }),
                              GlobalTextField(
                                hintText: ' Meter Make',
                                controller: _editingControllerMake,
                              ),
                              GlobalTextField(
                                hintText: 'Meter Model',
                                controller: _editingControllerModel,
                              ),

                              GlobalTextField(
                                hintText: 'Serial Number',
                                controller: _editingControllerSerialNo,
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              //selectioncontainer

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: attachCalibrationCertificate == null
                                    ? InkWell(
                                        onTap: () async {
                                          FilePickerResult result =
                                              await FilePicker.platform
                                                  .pickFiles();
                                          if (result != null) {
                                            attachCalibrationCertificate =
                                                await File(result
                                                        .files.single.path)
                                                    .create();
                                            fileSize = await getFileSize(
                                                attachCalibrationCertificate
                                                    .path,
                                                1);
                                            setState(() {});
                                          } else {}
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                icon: Icon(
                                                  MaterialIcons.file_upload,
                                                  size: 40,
                                                  color: Colors.lightGreen[600],
                                                ),
                                                onPressed: null),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
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
                                      )
                                    : ListTile(
                                        title: Text(
                                          Path.basename(
                                                  attachCalibrationCertificate
                                                      .path)
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.lightGreen[600],
                                            fontSize: 18,
                                          ),
                                        ),
                                        subtitle: Text(fileSize),
                                        trailing: InkWell(
                                            onTap: () async {
                                              await File(
                                                      attachCalibrationCertificate
                                                          .path)
                                                  .delete();
                                              attachCalibrationCertificate =
                                                  null;
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            )),
                                      ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          )),
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Meters',
                                      style: buildTileTitleStyle(),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        Meter meter = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddMeterPage()),
                                        );

                                        if (meter != null) {
                                          setState(() {
                                            meters.add(meter);
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.add_circle_outline_outlined,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          isExpanded: cardList[3],
                          body: meters.length != 0
                              ? ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  controller: _scrollController,
                                  scrollDirection: Axis.vertical,
                                  itemCount: meters.length,
                                  itemBuilder: (context, index) {
                                    return Slidable(
                                      actionPane: SlidableDrawerActionPane(),
                                      //  actionExtentRatio: 0.25,
                                      child: Container(
                                        color: Colors.green.withOpacity(.4),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                              'assets/meter.png',
                                            ),
                                            foregroundColor: Colors.white,
                                          ),
                                          title: Text(
                                              meters[index].supplyReference),
                                          subtitle:
                                              Text(meters[index].supplyNumber),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        IconSlideAction(
                                          caption: 'Archive',
                                          color: Colors.blue,
                                          icon: Icons.archive,
                                          onTap: () => null,
                                        ),
                                        IconSlideAction(
                                          caption: 'Share',
                                          color: Colors.indigo,
                                          icon: Icons.share,
                                          onTap: () => null,
                                        ),
                                      ],
                                      secondaryActions: <Widget>[
                                        IconSlideAction(
                                          caption: 'More',
                                          color: Colors.black45,
                                          icon: Icons.more_horiz,
                                          onTap: () => null,
                                        ),
                                        IconSlideAction(
                                          caption: 'Delete',
                                          color: Colors.red,
                                          icon: Icons.delete,
                                          onTap: () {
                                            meters.removeAt(index);
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 1,
                                    );
                                  },
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Text(
                                    "No Meter added yet ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: state is LoadingState
                        ? LoadingIndicator()
                        : Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Container(
                              height: 50.0,
                              child: GestureDetector(
                                onTap: () async {
                                  await Future.delayed(
                                      Duration(milliseconds: 100));
                                  if (_formKey.currentState.validate()) {
                                    BlocProvider.of<GlobalBloc>(context)
                                        .add(ShowLoadingIndicator());
                                    if (attachCalibrationCertificate != null) {
                                      String fileURL = await uploadFile(
                                          attachCalibrationCertificate);
                                    }

                                    report = Report(
                                        site: _editingControllerSite.text,
                                        client: _editingControllerClient.text,
                                        building:
                                            _editingControllerBuilding.text,
                                        customerReferenceNo:
                                            _editingControllerCustomer.text,
                                        carriedoutonbehalfof:
                                            _editingControllerCarried.text,
                                        contactName:
                                            _editingControllerContactName.text,
                                        email: _editingControllerEmail.text,
                                        phoneNo:
                                            _editingControllerPhohneNo.text,
                                        siteEngineerphoneNo:
                                            _editingControllerSiteEngineerPhoneNo
                                                .text,
                                        dateSurveyCarriedOut: dateTime,
                                        accompainedBy:
                                            _editingControllerAccompainedBy
                                                .text,
                                        siteEngineer:
                                            _editingControllerSiteEngineer.text,
                                        siteEngineerEmail:
                                            _editingControllerSiteEngineerEmail
                                                .text,
                                        meters: meters,
                                        testMeter: TestMeter(
                                            meterMake: _editingControllerMake.text
                                                .toString(),
                                            meterModel: _editingControllerModel
                                                .text
                                                .toString(),
                                            meterType: _editingControllerMeter.text
                                                .toString(),
                                            attachCalibrationCertificate:
                                                fileURL,
                                            serialNumber:
                                                _editingControllerSerialNo.text.toString()));

                                    bool isSuccess = await uploadReport(report);
                                    if (isSuccess) {
                                      Navigator.pop(context);
                                    } else {
                                      buildFlushBar(
                                        buildContext: context,
                                        title:
                                            "Something Went Wrong Please Try again",
                                        subtitle:
                                            "Please make sure you entered the data ",
                                      );
                                    }
                                  } else {
                                    buildFlushBar(
                                      buildContext: context,
                                      title: "Incomplete Information",
                                      subtitle:
                                          "Please enter the data which is required",
                                    );
                                  }

                                  BlocProvider.of<GlobalBloc>(context)
                                      .add(SetToInitial());
                                },
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
                                        "Save Report",
                                        style: TextStyle(
                                          color: Colors.lightGreen[600],
                                          fontFamily: 'Montserrat',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

TextStyle buildTileTitleStyle() {
  return TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: Colors.grey);
}
