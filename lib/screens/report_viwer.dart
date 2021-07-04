import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/screens/create_report_home.dart';
import 'package:metr_reading/services/could_firebase.dart';
import 'package:metr_reading/services/excel_sheet.dart';
import 'package:metr_reading/services/pfd.dart';

class ReportViwer extends StatelessWidget {
  Report report;
  ReportViwer({Key key, this.report}) : super(key: key);
  final df = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...report.meters.map((meter) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoRow(
                          title: 'REF:',
                          info: '',
                        ),
                        buildInfoRow(
                          title: '',
                          info: '${meter.supplyName}-${meter.supplyReference}',
                        ),
                      ],
                    ),
                    buildInfoRow(
                      title: 'Contact Name:',
                      info: report.contactName,
                    ),
                    buildInfoRow(
                      title: 'Client:',
                      info: report.client,
                    ),
                    buildInfoRow(
                      title: 'Site:',
                      info: report.site,
                    ),
                    buildInfoRow(
                      title: 'Building',
                      info: report.building,
                    ),
                    buildInfoRow(
                      title: 'Carried out on: ',
                      info: df.format(report.dateSurveyCarriedOut),
                    ),
                    buildInfoRow(
                      title: 'Carried out on behalf of:',
                      info: report.carriedoutonbehalfof,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          border: TableBorder.all(width: 2),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            buildTableCellRow(
                                title: "Meter", info: meter.meter.toString()),
                            buildTableCellRow(
                                title: "Meter Read",
                                info: meter.meterRead.toString()),
                            buildTableCellRow(
                                title: "Parent Meter",
                                info: meter.parentMeter.toString()),
                            buildTableCellRow(
                                title: "Manufacturer",
                                info: meter.manufacturer.toString()),
                            buildTableCellRow(
                                title: "Model",
                                info: meter.meterModel.toString()),
                            buildTableCellRow(
                                title: "Meter type",
                                info: meter.meterType.toString()),
                            buildTableCellRow(
                                title: "MID", info: meter.mID.toString()),
                            buildTableCellRow(
                                title: "AMR", info: meter.aMR.toString()),
                            buildTableCellRow(
                                title: "Comms protocol",
                                info: meter.commonProtocol.toString()),
                            buildTableCellRow(
                                title: "On Network",
                                info: meter.onNetwork.toString()),
                            buildTableCellRow(
                                title: "On BMS", info: meter.onBuss.toString()),
                            buildTableCellRow(
                                title: "Meter Location",
                                info: meter.location.toString()),
                            buildTableCellRow(
                                title: "Floor Level",
                                info: meter.floor.toString()),
                            buildTableCellRow(
                                title: "Note", info: meter.note.toString()),
                            buildTableCellRow(
                                title: "Demise served",
                                info: meter.demiseServed.toString()),
                          ]),
                    ),
                    buildInfoRow(
                      title: 'Notes:',
                      info: report.contactName,
                    ),
                    buildInfoRow(
                      title: 'Issues:',
                      color: Colors.red,
                      info: report.contactName,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Base of Electric Meter report",
                        style: buildTileTitleStyle()
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                            border: TableBorder.all(width: 2),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              buildTableCellRow(
                                  title: "Average Voltage", info: ''),
                              buildTableCellRow(
                                  title: "Voltage Check", info: ''),
                              buildTableCellRow(
                                  title: "CT Phase Direction /orientation",
                                  info: getStringFromBool(
                                      meter.ctPhaseOrientationOk)),
                              buildTableCellRow(
                                  title: "Current Test (Value on Meter)",
                                  info:
                                      getStringFromBool(meter.currentTestedOk)),
                              buildTableCellRow(
                                  title: "Current Test (Value on Test Meter)",
                                  info: ''),
                              buildTableCellRow(
                                  title: "Breaker rating",
                                  info: meter.breakerRating.toString()),
                            ])),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Base of Water Meter report",
                        style: buildTileTitleStyle()
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                            border: TableBorder.all(width: 2),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              buildTableCellRow(
                                  title: "Pulse Lead required",
                                  info: getStringFromBool(
                                      meter.pluseLeadRequuired)),
                            ])),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Base of Gas Meter report",
                        style: buildTileTitleStyle()
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                            border: TableBorder.all(width: 2),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              buildTableCellRow(
                                  title: "Pulse Lead required",
                                  info: getStringFromBool(
                                      meter.pluseLeadRequuired)),
                            ])),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Base of Heat Meter report",
                        style: buildTileTitleStyle()
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                            border: TableBorder.all(width: 2),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              buildTableCellRow(
                                  title: "Pulse Lead required",
                                  info: getStringFromBool(
                                      meter.pluseLeadRequuired)),
                              buildTableCellRow(
                                  title: "Powered by",
                                  info: getStringFromBool(
                                      meter.pluseLeadRequuired)),
                              buildTableCellRow(
                                  title: "T1 Temp",
                                  info: meter.mainT1Temperature),
                              buildTableCellRow(
                                  title: "T2 Temp",
                                  info: meter.batteryT1Temperature),
                              buildTableCellRow(
                                  title: "K (T1-T2)", info: meter.kT12),
                              buildTableCellRow(
                                  title: "Flow Rate", info: meter.flowRate),
                              buildTableCellRow(
                                  title: "Flow Rate Unit", info: ''),
                              buildTableCellRow(title: "kW", info: meter.kW),
                              buildTableCellRow(
                                  title: "Volume on BMS",
                                  info: meter.volumeOnBMS),
                              buildTableCellRow(
                                  title: "Date /Time Reading taken from BMS",
                                  info: ''),
                            ]))
                  ],
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0, color: Colors.white),
        backgroundColor: Colors.green,
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesome.file_excel_o, color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () {
              createExcelSheet(report: report);
            },
            label: 'Generate Excel Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
          SpeedDialChild(
            child: Icon(Octicons.file_pdf, color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () async {
              await reportView(context: context, report: report);
            },
            label: 'Generate PDF Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
          SpeedDialChild(
            child: Icon(Fontisto.onenote, color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () => print('Pressed Code'),
            label: 'Generate Note Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
          SpeedDialChild(
            child: Icon(MaterialCommunityIcons.emoticon_angry_outline,
                color: Colors.white),
            backgroundColor: Colors.green,
            onTap: () => print('Pressed Code'),
            label: 'Generate Fault Report',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.lightGreen[600],
          ),
        ],
      ),
    );
  }

  buildTableCellRow({String title, String info}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textScaleFactor: 1.5,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info, textScaleFactor: 1.5),
      ),
    ]);
  }

  buildTableTwoCellRow({String title, String info}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textScaleFactor: 1.5,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info, textScaleFactor: 1.5),
      ),
    ]);
  }

  buildTableFiveCellRow(
      {String title, String info1, String info2, String info3, String info4}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textScaleFactor: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info1, textScaleFactor: 1),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info2, textScaleFactor: 1),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info3, textScaleFactor: 1),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(info4, textScaleFactor: 1),
      ),
    ]);
  }

  buildInfoRow({String title, String info, Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color != null ? color : Colors.black54)),
          Text(info,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color != null ? color : Colors.grey)),
        ],
      ),
    );
  }
}
