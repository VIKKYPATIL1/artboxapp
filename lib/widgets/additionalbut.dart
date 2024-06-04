import 'package:art_box/providers/artprovider.dart';
import 'package:art_box/screens/styleScreen.dart';
import 'package:art_box/utility/modelviewer.dart';
import 'package:art_box/utility/sizeoutputnumber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdditionalBut extends StatefulWidget {
  const AdditionalBut(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.extraTune});
  final String title;
  final String subtitle;
  final void Function({required String title}) extraTune;

  @override
  State<AdditionalBut> createState() => _AdditionalButState();
}

class _AdditionalButState extends State<AdditionalBut> {
  TextEditingController nofotpctr = TextEditingController();
  TextEditingController negpromptctr = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nofotpctr.dispose();
    negpromptctr.dispose();
    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {
    double widthofdevice = MediaQuery.of(context).size.width / 2;
    return Consumer<ArtProvider>(
      builder: (context, artprd, _) {
        return InkWell(
            onTap: () {
              if (widget.title == "Style") {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StyleScreen(),
                ));
              } else if (widget.title == "Aspect-Ratio") {
                modelviewer(context, artprd);
              } else {
                setState(() {
                  sizeoutputnumber(context, artprd, nofotpctr, negpromptctr);
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                  Colors.blue.shade300
                ]),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 100,
              width: widthofdevice - 40,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                child: ListTile(
                  trailing: const Icon(Icons.arrow_drop_down_circle),
                  title: Text(widget.title),
                  subtitle: Text(widget.subtitle),
                ),
              ),
            ));
      },
    );
  }
}
