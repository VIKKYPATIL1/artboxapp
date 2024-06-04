import 'package:art_box/providers/artprovider.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

Future<void> sizeoutputnumber(BuildContext context, ArtProvider artprd,
    TextEditingController nofotpctr, TextEditingController negpromptctr) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade300,
              Colors.blue.shade400,
              Colors.blue.shade500,
              Colors.blue,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        height: MediaQuery.of(context).size.height - 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: negpromptctr,
                  decoration: const InputDecoration(
                      label: Text("Negative Prompt"),
                      border: OutlineInputBorder(),
                      hintText: "Enter Detail which are not required"),
                ).frosted(frostOpacity: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nofotpctr,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Output Images Number"),
                      border: OutlineInputBorder(),
                      hintText: "1-4"),
                ).frosted(frostOpacity: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FilledButton.tonal(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(10),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(249, 107, 213, 243)),
                  ),
                  onPressed: () {
                    if (nofotpctr.text.isEmpty) {
                    } else {
                      artprd.negprompt = negpromptctr.text;
                      artprd.numberOfImageOutput = int.parse(nofotpctr.text);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
