import 'package:art_box/widgets/trial_widget.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red.shade100, Colors.red.shade400],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center)),
          height: double.infinity,
          child: const TrialWidget()),
    );
  }
}
