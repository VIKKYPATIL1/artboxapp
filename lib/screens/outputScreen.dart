// ignore_for_file: file_names
import 'package:art_box/providers/artprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({super.key});

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 100;
    return Consumer<ArtProvider>(builder: (context, artprd, _) {
      return Scaffold(
          body: artprd.reload
              ? Center(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white, size: 300)),
                )
              : artprd.reload1
                  ? Center(
                      child: SizedBox(
                          height: 200,
                          width: 200,
                          child: LoadingAnimationWidget.inkDrop(
                              color: Colors.white, size: 200)),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: artprd.generatedimages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1),
                      itemBuilder: (context, index) {
                        return Stack(
                            clipBehavior: Clip.hardEdge,
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  artprd.generatedimages[index]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                height: 600,
                                right: width,
                                left: 10,
                                child: CircleAvatar(
                                  child: IconButton(
                                    color: Colors.red,
                                    onPressed: () async {
                                      setState(() {
                                        artprd.reload1 = true;
                                      });
                                      await artprd.saveImage(context,
                                          artprd.generatedimages[index]!);
                                      setState(() {
                                        artprd.reload1 = false;
                                      });
                                      print(index);
                                    },
                                    icon:
                                        Icon(size: 40, Icons.download_rounded),
                                  ),
                                ),
                              )
                            ]);
                      },
                    ));
    });
  }
}
