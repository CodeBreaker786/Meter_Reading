import 'dart:io';

import 'package:metr_reading/models/report.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

void createExcelSheet({Report report}) async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  new Directory(appDocDirectory.path + '/').create(recursive: true)
// The created directory is returned as a Future.
      .then((Directory directory) async {
    // Create a new Excel document.
    final Workbook workbook = new Workbook();
//Accessing worksheet via index.
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByName('A1:AG1').cellStyle.hAlign = HAlignType.left;
    sheet.getRangeByName('A1').setText('Supply Reference');
    sheet.getRangeByName('B1').setText('Building Reference');
    sheet.getRangeByName('C1').setText('Building');
    sheet.getRangeByName('D1').setText('Utility');
    sheet.getRangeByName('E1').setText('Meter Type (Main/Check/Sub)');
    sheet.getRangeByName('F1').setText('Supply Name');
    sheet.getRangeByName('G1').setText('Supply Notes');
    sheet.getRangeByName('H1').setText('Supply Notes');
    sheet.getRangeByName('I1').setText('Meter Serial');
    sheet.getRangeByName('J1').setText('Modbus Slave?');
    sheet.getRangeByName('K1').setText('Manufacturer');
    sheet.getRangeByName('L1').setText('Model');
    sheet.getRangeByName('M1').setText('CT Ratio on Meter');
    sheet.getRangeByName('N1').setText('On Network?');
    sheet.getRangeByName('O1').setText('AMR Enabled?');
    sheet.getRangeByName('P1').setText('Comms Protocol');
    sheet.getRangeByName('Q1').setText('MID? (Y/N)');
    sheet.getRangeByName('R1').setText('Location');
    sheet.getRangeByName('S1').setText('Building');
    sheet.getRangeByName('U1').setText('Utility');
    sheet.getRangeByName('V1').setText('Meter Type (Main/Check/Sub)');
    sheet.getRangeByName('W1').setText('Demise Served');
    sheet.getRangeByName('X1').setText('Unit');
    sheet.getRangeByName('Y1').setText('T1');
    sheet.getRangeByName('Z1').setText('Flir Image');
    sheet.getRangeByName('AA1').setText('T2');
    sheet.getRangeByName('AB1').setText('Flir Image');
    sheet.getRangeByName('AC1').setText('K (T1-2)');
    sheet.getRangeByName('AD1').setText('Flow Rate');
    sheet.getRangeByName('AE1').setText('Flow Rate Unit');
    sheet.getRangeByName('AF1').setText('KW');
    sheet.getRangeByName('AG1').setText('Volume');
    for (int i = 0; i < report.meters.length; i++) {
      sheet
          .getRangeByName('A${i + 2}')
          .setText(report.meters[i].supplyNumber.toString());
      sheet.getRangeByName('B${i + 2}').setText('Building Reference');
      sheet.getRangeByName('C${i + 2}').setText(report.building.toString());
      sheet.getRangeByName('D${i + 2}').setText('Utility');
      sheet
          .getRangeByName('E${i + 2}')
          .setText(report.meters[i].meterType.toString());
      sheet
          .getRangeByName('F${i + 2}')
          .setText(report.meters[i].supplyName.toString());
      sheet.getRangeByName('G${i + 2}').setText('Supply Notes');
      sheet.getRangeByName('H${i + 2}').setText('Supply Notes');
      sheet
          .getRangeByName('I${i + 2}')
          .setText(report.meters[i].serialNumber.toString());
      sheet.getRangeByName('J${i + 2}').setText('Modbus Slave?');
      sheet
          .getRangeByName('K${i + 2}')
          .setText(report.meters[i].manufacturer.toString());
      sheet
          .getRangeByName('L${i + 2}')
          .setText(report.meters[i].meterModel.toString());
      sheet.getRangeByName('M${i + 2}').setText('CT Ratio on Meter');
      sheet.getRangeByName('N${i + 2}').setText('On Network?');
      sheet.getRangeByName('O${i + 2}').setText('AMR Enabled?');
      sheet.getRangeByName('P${i + 2}').setText('Comms Protocol');
      sheet.getRangeByName('Q${i + 2}').setText('MID? (Y/N)');
      sheet
          .getRangeByName('R${i + 2}')
          .setText(report.meters[i].location.toString());
      sheet.getRangeByName('S${i + 2}').setText('Building');
      sheet.getRangeByName('U${i + 2}').setText('Utility');
      sheet.getRangeByName('V${i + 2}').setText('Meter Type (Main/Check/Sub)');
      sheet
          .getRangeByName('W${i + 2}')
          .setText(report.meters[i].demiseServed.toString());
      sheet.getRangeByName('X${i + 2}').setText('Unit');
      sheet.getRangeByName('Y${i + 2}').setText('T1');
      sheet.getRangeByName('Z${i + 2}').setText('Flir Image');
      sheet.getRangeByName('AA${i + 2}').setText('T2');
      sheet.getRangeByName('AB${i + 2}').setText('Flir Image');
      sheet.getRangeByName('AC${i + 2}').setText('K (T1-2)');
      sheet.getRangeByName('AD${i + 2}').setText('Flow Rate');
      sheet.getRangeByName('AE${i + 2}').setText('Flow Rate Unit');
      sheet.getRangeByName('AF${i + 2}').setText('KW');
      sheet.getRangeByName('AG${i + 2}').setText('Volume');
    }
    sheet.getRangeByName('A1:AG${report.meters.length + 1}').autoFit();
    sheet.getRangeByName('A1:AG1').cellStyle.bold = true;
    sheet.getRangeByName('A1:AG${report.meters.length + 1}').cellStyle.hAlign =
        HAlignType.left;

// Save the document.
    final List<int> bytes = workbook.saveAsStream();
    File file =
        await File(directory.path + '/' + 'report.xlsx').writeAsBytes(bytes);
//Dispose the workbook.
    Share.shareFiles([file.path], subject: 'report.xlsx');
  });
  // Create a new Excel document.
}
