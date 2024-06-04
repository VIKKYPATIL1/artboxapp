// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart' as pd;
import 'package:art_box/apikey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:share_plus/share_plus.dart';

class ArtProvider extends ChangeNotifier {
  //to save the style
  //to save output
  List<String?> generatedimages = [];
  //to show models
  List<String> aspectratio = ["portrait", "square", "landscape"];
  //to show style
  List<List<String>> styles = [
    ["photorealistic", "assets/images/vivid.jpg"],
    ["realism", "assets/images/natural.jpg"],
    ["anime", "assets/images/animate.jpg"],
    ["comic-book", "assets/images/cartoon.jpg"],
    ["texture", "assets/images/detail.jpg"],
    ["line-art", "assets/images/drawing.jpg"],
    ["enhance", "assets/images/highre.jpg"],
    ["futuristic", "assets/images/modern.jpg"],
    ["watercolor", "assets/images/oilpaint.jpg"],
    ["pixel-art", "assets/images/point.jpg"],
    ["photographic", "assets/images/photo.jpg"],
    ["digital-art", "assets/images/traditional.jpg"],
    ["vector-art", "assets/images/vector.jpg"],
    ["watercolor", "assets/images/watercolor.jpg"],
    ["3d-model", "assets/images/threed.jpg"]
  ];
  //to save number of image output
  int numberOfImageOutput = 1;
  //to save select model
  String selectedaspectRatio = "square";
  //to save prompt
  String prompt = "";
  String negprompt = "None";
  //to save select images size
  String selectedstyle = 'photorealistic';
  //to show reload
  bool reload = true;
  bool reload1 = true;
  void setReload(bool value) {
    reload = value;
    notifyListeners();
  }

//to set selected style
  void setSelectStyle(String styledata) {
    selectedstyle = styledata;
    notifyListeners();
  }

// to set selected model
  void setSelectAspectRatio(String aspr) {
    selectedaspectRatio = aspr;
    notifyListeners();
  }

// tp set generated image
  void setGeneratedImages(String? imagedata) {
    if (imagedata == '') {
      generatedimages = [];
    } else {
      generatedimages.add(imagedata!);
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> generateImage1() async {
    final inputData = {
      'prompt': prompt,
      'negprompt': negprompt,
      'samples': numberOfImageOutput,
      'steps': 50,
      'aspect_ratio': selectedaspectRatio,
      'guidance_scale': 7.5,
      'seed': 2414,
      "style": selectedstyle,
    };
    const url = endpoint;
    const apiKey = aIKey;
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey"
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(inputData),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        await stout(data["status_url"], headers);
        print("post method");
        print(data["status_url"]);
        notifyListeners();
        return data;
      } else {
        print('Failed to generate image: ${response.statusCode}');
        print('Response Body: ${response.body}');
        notifyListeners();
        return {};
      }
    } catch (e) {
      print('Error: $e');
      notifyListeners();
      return {};
    }
  }

  Future<void> stout(String statusUrl, dynamic headers) async {
    // final headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization':
    //       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjY3NTM0NzJmMTE2ZDMwMTg0ZjFiNDg3NjgzNDg5MzM0IiwiY3JlYXRlZF9hdCI6IjIwMjQtMDYtMDNUMTM6NDc6NDAuODE5NzM2In0.UCLaPiEo7ol1mkoZ-Z-rPOI0w9CtssfhtmuEHCzJyak'
    // };

    const int maxRetries = 10; // Set the maximum number of retries
    const Duration delay =
        Duration(seconds: 5); // Set the delay between retries

    for (int i = 0; i < maxRetries; i++) {
      try {
        final response = await http.get(Uri.parse(statusUrl), headers: headers);

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          print('Status: ${data['status']}');

          if (data['status'] == 'COMPLETED') {
            setReload(false);
            for (int i = 0; i < data['result']['output'].length; i++) {
              setGeneratedImages(data['result']['output'][0]);
            }
            notifyListeners();
            return;
          } else {
            print('Status not completed yet, retrying...');
            setReload(true);
            notifyListeners();
          }
        } else {
          print('Failed to get generated images: ${response.statusCode}');
          print('Response Body: ${response.body}');
        }
      } catch (e) {
        print('Error: $e');
        notifyListeners();
      }
      // Wait for a specified delay before retrying
      await Future.delayed(delay);
    }
    print('Exceeded maximum retries without completion.');
    notifyListeners();
  }

  var random = Random();

  Future<void> saveImage(BuildContext context, String url) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    late String message;

    try {
      reload1 = true;
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await pd.getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);
      reload1 = false;
      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }
    } catch (e) {
      message = e.toString();
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 25, 46),
      ));
    }

    if (message.isNotEmpty) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 25, 46),
      ));
    }
  }
}
