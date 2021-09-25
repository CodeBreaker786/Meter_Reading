import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:metr_reading/models/report.dart';
import 'package:metr_reading/utils/const.dart';
import 'package:metr_reading/widgets/loading_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleReportView extends StatefulWidget {
  Report report;
  SingleReportView({Key key, this.report}) : super(key: key);

  @override
  _SingleReportViewState createState() => _SingleReportViewState();
}

class _SingleReportViewState extends State<SingleReportView> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          'Report View',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfoRow(
                title: 'Contact Name:',
                info: widget.report.contactName,
              ),
              buildInfoRow(
                title: 'Client:',
                info: widget.report.client,
              ),
              buildInfoRow(
                title: 'Site:',
                info: widget.report.site,
              ),
              buildInfoRow(
                title: 'Building',
                info: widget.report.building,
              ),
              buildInfoRow(
                title: 'Carried out on: ',
                info: df.format(widget.report.dateSurveyCarriedOut),
              ),
              buildInfoRow(
                title: 'Carried out on behalf of:',
                info: widget.report.carriedoutonbehalfof,
              ),
              buildInfoRow(
                title: 'Carried out by',
                info: widget.report.carriedoutonbehalfof,
              ),
              ExpansionTile(
                backgroundColor: Colors.green.withOpacity(.4),
                iconColor: Colors.green,
                tilePadding: EdgeInsets.symmetric(horizontal: 8),
                title: Text("Test Meter Used",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                children: [
                  buildInfoRow(
                    title: 'Meter Type',
                    info: widget.report.testMeter.meterType,
                  ),
                  buildInfoRow(
                    title: 'Meter Make',
                    info: widget.report.testMeter.meterMake,
                  ),
                  buildInfoRow(
                    title: 'Meter Modal',
                    info: widget.report.testMeter.meterModel,
                  ),
                  buildInfoRow(
                    title: 'Meter Serial No',
                    info: widget.report.testMeter.serialNumber,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Certificate ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          height: 25,
                          child: ElevatedButton.icon(
                            clipBehavior: Clip.antiAlias,
                            icon: Icon(
                              Icons.link_sharp,
                            ),
                            label: Text('Open'),
                            onPressed: () async {
                              await canLaunch(
                                      widget.report.testMeter.attachCertificate)
                                  ? await launch(
                                      widget.report.testMeter.attachCertificate)
                                  : showError(error: "Could not launch url");
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text("Meters",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: widget.report.meters.length != 0
                    ? SingleChildScrollView(
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: widget.report.meters.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              //  actionExtentRatio: 0.25,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(6)),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      'assets/meter.png',
                                    ),
                                    foregroundColor: Colors.white,
                                  ),
                                  title: Text(
                                      widget.report.meters[index].supplyName),
                                  subtitle: Text(
                                      widget.report.meters[index].supplyNumber),
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
                                    widget.report.meters.removeAt(index);
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
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            "No Meter added yet ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

buildInfoRow({String title, String info}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Flexible(
          child: Text(info,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
        ),
      ],
    ),
  );
}
