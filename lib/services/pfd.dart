import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/models/report.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets/document.dart';

reportView({context, List<Report> reports}) async {
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
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
            ...reports.map((report) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Paragraph(
                        text:
                            'REF: ${report.supplyName} - ${report.supplyReference}',
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
                        report.meterRead,
                      ],
                      <String>[
                        'Parent Meter (Supplied from)',
                        report.parentMeter,
                      ],
                      <String>[
                        'Manufacturer',
                        report.manufacturer,
                      ],
                      <String>[
                        'Model',
                        report.meterModel,
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
  return pdf;
}
