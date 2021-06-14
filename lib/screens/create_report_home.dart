import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:metr_reading/global/bloc/global_bloc.dart';
import 'package:metr_reading/models/meter.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/screens/add_meter_page.dart';
import 'package:metr_reading/services/could_firebase.dart';
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
  final GlobalKey<ExpansionTileCardState> card1 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card2 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card3 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card4 = new GlobalKey();
  TextEditingController _editingControllerClient = TextEditingController();
  TextEditingController _editingControllerSite = TextEditingController();
  TextEditingController _editingControllerBuilding = TextEditingController();
  TextEditingController _editingControllerCustomer = TextEditingController();
  TextEditingController _editingControllerCarried = TextEditingController();
  TextEditingController _editingControllerContactName = TextEditingController();
  TextEditingController _editingControllerEmail = TextEditingController();
  TextEditingController _editingControllerPhohneNo = TextEditingController();
  TextEditingController _editingControllerSurvey = TextEditingController();
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
  final ScrollController _scrollController = ScrollController();

  List<bool> meterToggle = List.generate(3, (index) => false);
  final df = DateFormat('dd-MM-yyyy hh:mm a');
  DateTime dateTime;

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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ExpansionTileCard(
                      key: card1,
                      animateTrailing: true,
                      //   finalPadding: EdgeInsets.symmetric(vertical: 12),
                      expandedTextColor: Colors.green,
                      title: Text(
                        'Cient Details',
                        style: buildTileTitleStyle(),
                      ),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ExpansionTileCard(
                      key: card2,
                      animateTrailing: true,
                      finalPadding: EdgeInsets.symmetric(vertical: 12),
                      expandedTextColor: Colors.green,
                      title: Text(
                        'Report Carried Out By',
                        style: buildTileTitleStyle(),
                      ),
                      children: [
                        Column(
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

                            GlobalDropdwon(
                                textEditingController: _editingControllerSurvey,
                                hintText: 'Survey',
                                onChanged: (value) {
                                  setState(() {
                                    _editingControllerSurvey.text = value;
                                  });
                                },
                                getItemList: (searchText) async {
                                  await Future.delayed(
                                      Duration(seconds: 1), () {});
                                  return ['$searchText'];
                                }),
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
                              hintText: 'Site Engineer E-mail',
                              controller: _editingControllerSiteEngineerEmail,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ExpansionTileCard(
                      key: card3,
                      animateTrailing: true,
                      finalPadding: EdgeInsets.symmetric(vertical: 12),
                      expandedTextColor: Colors.green,
                      title: Text(
                        'Test Meter Used',
                        style: buildTileTitleStyle(),
                      ),
                      children: [
                        GlobalDropdwon(
                            hintText: 'Meter',
                            textEditingController: _editingControllerMeter,
                            onChanged: (value) {
                              setState(() {
                                _editingControllerMeter.text = value;
                              });
                            },
                            getItemList: (searchText) async {
                              await Future.delayed(Duration(seconds: 0), () {});
                              return ['Thermal', 'Electric', 'Gas', 'Water'];
                            }),
                        meterToggle[2]
                            ? GlobalTextField(
                                hintText: 'Other:',
                                controller: _editingControllerMeter,
                              )
                            : SizedBox(),
                        GlobalTextField(
                          hintText: 'Model:',
                          controller: _editingControllerModel,
                        ),
                        GlobalTextField(
                          hintText: 'Make:',
                          controller: _editingControllerMake,
                        ),
                        GlobalTextField(
                          hintText: 'Serial No:',
                          controller: _editingControllerSerialNo,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //selectioncontainer

                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  MaterialIcons.attach_file,
                                  size: 40,
                                  color: Colors.lightGreen[600],
                                ),
                                onPressed: null),
                            SizedBox(
                              width: 5,
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
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ExpansionTileCard(
                      key: card4,
                      animateTrailing: true,
                      expandedTextColor: Colors.green,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    builder: (context) => AddMeterPage()),
                              );

                              if (meter != null) {
                                setState(() {
                                  meters.add(meter);
                                });
                                card4.currentState?.expand();
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
                      children: [
                        ListView.separated(
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
                                  title: Text('Tile no $index'),
                                  subtitle: Text('SlidableDrawerDelegate'),
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  state is LoadingState
                      ? LoadingIndicator()
                      : Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Container(
                            height: 50.0,
                            child: GestureDetector(
                              onTap: () async {
                                card1.currentState.expand();
                                card2.currentState.expand();
                                card3.currentState.expand();
                                card4.currentState.expand();
                                await Future.delayed(
                                    Duration(milliseconds: 100));
                                if (_formKey.currentState.validate()) {
                                  report = Report(
                                      site: _editingControllerSite.text,
                                      client: _editingControllerClient.text,
                                      building: _editingControllerBuilding.text,
                                      customerReferenceNo:
                                          _editingControllerCustomer.text,
                                      carriedoutonbehalfof:
                                          _editingControllerCarried.text,
                                      contactName:
                                          _editingControllerContactName.text,
                                      email: _editingControllerEmail.text,
                                      phoneNo: _editingControllerPhohneNo.text,
                                      survey: _editingControllerSurvey.text,
                                      dateSurveyCarriedOut:
                                          dateTime,
                                      accompainedBy:
                                          _editingControllerAccompainedBy.text,
                                      siteEngineer:
                                          _editingControllerSiteEngineer.text,
                                      siteEngineerEmail:
                                          _editingControllerSiteEngineerEmail
                                              .text,
                                      meters: meters);
                                  BlocProvider.of<GlobalBloc>(context)
                                      .add(ShowLoadingIndicator());
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
