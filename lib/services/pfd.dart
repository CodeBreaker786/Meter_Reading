import 'dart:io';

import 'package:metr_reading/models/report.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:share/share.dart';

reportView({context, Report report}) async {
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return SizedBox();
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            child: Text('Meter Survey report',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Header(
                level: 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Meter Survey report', textScaleFactor: 2),
                      PdfLogo()
                    ])),
            ...report.meters.map((meter) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Paragraph(
                        text:
                            'REF: ${meter.supplyName} - ${meter.supplyReference}',
                        style: TextStyle(fontSize: 20)),
                    Paragraph(
                        text: 'Contact Name: ${report.contactName}',
                        style: TextStyle(fontSize: 20)),
                    Paragraph(
                        text: 'Client: ${report.client}',
                        style: TextStyle(fontSize: 20)),
                    Paragraph(
                        text: 'Site: ${report.site}',
                        style: TextStyle(fontSize: 20)),
                    Paragraph(
                        text: 'Building: ${report.building}',
                        style: TextStyle(fontSize: 20)),
                    Paragraph(
                        text:
                            'This report was carried out on:  ${report.dateSurveyCarriedOut}',
                        style: TextStyle(fontSize: 20)),
                    Paragraph(
                        text:
                            'Company survey carried out on behalf of:  ${report.carriedoutonbehalfof}',
                        style: TextStyle(fontSize: 20)),
                    Table.fromTextArray(context: context, data: <List<String>>[
                      <String>['Meter', ''],
                      <String>[
                        'Meter Read',
                        meter.meterRead,
                      ],
                      <String>[
                        'Parent Meter (Supplied from)',
                        meter.parentMeter,
                      ],
                      <String>[
                        'Manufacturer',
                        meter.manufacturer,
                      ],
                      <String>[
                        'Model',
                        meter.meterModel,
                      ],
                      <String>[
                        'Meter type',
                        '',
                      ],
                      <String>[
                        'Serial Number',
                        '',
                      ],
                      <String>[
                        'MID',
                        '',
                      ],
                      <String>[
                        'AMR (Automatic meter reading)',
                        '',
                      ],
                      <String>[
                        'On Network',
                        '',
                      ],
                      <String>[
                        'On BMS',
                        '',
                      ],
                      <String>[
                        'Slave ID',
                        '',
                      ],
                      <String>[
                        'Meter Location',
                        '',
                      ],
                      <String>[
                        'Floor Level',
                        '',
                      ],
                      <String>[
                        'Note',
                        '',
                      ],
                      <String>[
                        'Demise served',
                        '',
                      ],
                    ]),
                    SizedBox(height: 200),
                  ]);
            }),
          ]));

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  Share.shareFiles([file.path], subject: 'report.pdf');
}
