// ignore_for_file: file_names
import 'package:art_box/providers/artprovider.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StyleScreen extends StatelessWidget {
  const StyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtProvider>(builder: (context, artprd, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select Style",
          ),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: artprd.styles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  if (index == 0 || index == 1) {
                    artprd.setSelectStyle(artprd.styles[index].first);
                    Navigator.of(context).pop();
                  }
                },
                child: index == 0 || index == 1
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        height: 200,
                        width: 200,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                artprd.styles[index].last,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              artprd.styles[index].first,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                      )
                    : Blur(
                        overlay: const Text(
                          "Purchase to unlock",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  artprd.styles[index].last,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                artprd.styles[index].first,
                                style: const TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ));
          },
        ),
      );
    });
  }
}
