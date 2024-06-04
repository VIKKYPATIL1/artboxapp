import 'package:art_box/providers/artprovider.dart';
import 'package:flutter/material.dart';

Future<void> modelviewer(BuildContext context, ArtProvider artprd) {
  return showModalBottomSheet<void>(
    clipBehavior: Clip.antiAlias,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade300
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 0; i < artprd.aspectratio.length; i++)
                ElevatedButton(
                  // ignore: prefer_adjacent_string_concatenation, unnecessary_string_interpolations
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (i == 0) const Icon(Icons.portrait),
                      if (i == 1) const Icon(Icons.square),
                      if (i == 2) const Icon(Icons.landscape),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        artprd.aspectratio[i],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  // ignore: prefer_adjacent_string_concatenation, unnecessary_string_interpolations

                  onPressed: () {
                    artprd.setSelectAspectRatio(artprd.aspectratio[i]);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        ),
      );
    },
  );
}
