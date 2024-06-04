import 'package:art_box/screens/homescreen.dart';
import 'package:art_box/widgets/checkboxstyle.dart';
import 'package:art_box/widgets/feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class TrialWidget extends StatelessWidget {
  const TrialWidget({super.key});
  final bool? isCheckBasic = true;
  final bool? isCheckPremium = false;
  final bool? isCheckPro = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      fit: StackFit.passthrough,
      children: [
        Image.asset(fit: BoxFit.cover, 'assets/images/home.jpg'),
        Positioned(
          left: 20,
          top: 20,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: const Text(
                "Membership Plans",
                style: TextStyle(
                    decorationThickness: 30,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(253, 255, 255, 255)),
              ).frosted(
                blur: 0,
                frostColor: Color.fromARGB(255, 0, 6, 11),
                alignment: Alignment.center,
                borderRadius: BorderRadius.circular(20),
                padding: const EdgeInsets.all(8),
              ),
            ),
          ),
        ),
        Positioned(
            left: 10,
            bottom: MediaQuery.of(context).size.height / 2,
            right: 10,
            child: const Column(
              children: [
                FeatureWidget(
                    msg: "Fast Processing", align: MainAxisAlignment.start),
                FeatureWidget(
                    msg: "Unlimited Art work Creation",
                    align: MainAxisAlignment.center),
                FeatureWidget(
                    msg: "Unlock 10+ styles", align: MainAxisAlignment.center),
                FeatureWidget(
                    msg: "hd Art work Creation", align: MainAxisAlignment.end)
              ],
            )),
        Positioned(
          left: 40,
          bottom: 100,
          right: 40,
          child: SizedBox(width: 200, child: CheckBoxStyle()).frosted(
            blur: 1,
            frostOpacity: 0,
            width: 500,
            frostColor: const Color.fromARGB(255, 0, 6, 11),
            alignment: Alignment.center,
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.all(8),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 20,
          right: 40,
          child: SizedBox(
              width: 200,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: Colors.white,
                  ),
                  label: const Text(
                    r"Try for $0",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))).frosted(
            blur: 1,
            frostOpacity: 0,
            width: 500,
            frostColor: const Color.fromARGB(255, 0, 6, 11),
            alignment: Alignment.center,
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.all(8),
          ),
        )
      ],
    );
  }
}
