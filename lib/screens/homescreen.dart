import 'package:art_box/providers/artprovider.dart';
import 'package:art_box/screens/outputScreen.dart';
import 'package:art_box/widgets/additionalbut.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _promptController.dispose();
    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {
    double widthofdevice = MediaQuery.of(context).size.width / 2;
    double heightofdevice = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ART BOX",
        ),
      ),
      body: Consumer<ArtProvider>(builder: (context, artprd, _) {
        return SingleChildScrollView(
          child: SizedBox(
            height: heightofdevice,
            child: Column(children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Colors.blue.shade100,
                            Colors.blue.shade200,
                            Colors.blue.shade300
                          ])),
                  child: TextField(
                    controller: _promptController,
                    onSubmitted: (String value) {
                      artprd.prompt = value;
                    },
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
                    clipBehavior: Clip.hardEdge,
                    decoration: const InputDecoration(
                        label: Text(
                          "Enter Prompt",
                          style: TextStyle(
                              color: Color.fromARGB(252, 21, 21, 21),
                              fontSize: 20),
                        ),
                        border: InputBorder.none),
                    maxLines: 5,
                  )),
              Row(
                children: [
                  AdditionalBut(
                    title: "Style",
                    subtitle: "Optional",
                    extraTune: ({required title}) {},
                  ),
                  const Spacer(),
                  AdditionalBut(
                    title: "Aspect-Ratio",
                    subtitle: "",
                    extraTune: ({required title}) {},
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Spacer(),
                  AdditionalBut(
                    title: "Advance",
                    subtitle: "Optional",
                    extraTune: ({required title}) {},
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: widthofdevice - widthofdevice * 0.65,
                  width: widthofdevice + widthofdevice * 0.75,
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        artprd.prompt = _promptController.text;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OutputScreen(),
                        ));
                        await artprd.generateImage1();
                      },
                      icon: const Icon(
                        Icons.display_settings_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Create Art",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )))
            ]),
          ),
        );
      }),
    );
  }
}
