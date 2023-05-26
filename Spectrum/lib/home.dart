import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  File? imageFile;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        runModel();
      });
    }
  }

  Future<void> runModel() async {
    if (imageFile != null) {
      var predictions = await Tflite.runModelOnImage(
        path: imageFile!.path,
        numResults: 7,
        threshold: 0.1,
        asynch: true,
      );
      if (predictions != null && predictions.isNotEmpty) {
        double totalConfidence = 0.0;
        predictions.forEach((element) {
          totalConfidence += element['confidence'];
        });

        setState(() {
          output = ''; // Clear the previous output
        });

        predictions.forEach((element) {
          double percentage = (element['confidence'] / totalConfidence) * 100;
          String emotion = element['label'];
          String accuracy = '${percentage.toStringAsFixed(2)}%';

          setState(() {
            output +=
                '$emotion: $accuracy\n'; // Append emotion and accuracy to output
          });
        });
      }
    }
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
        model: "assets/model1.tflite", labels: "assets/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SPECTRUM')),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: imageFile != null
                ? Image.file(imageFile!)
                : IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () => loadImage(),
                  ),
          ),
        ),
        Text(
          output,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await loadImage();
          await runModel();
        },
        tooltip: 'Reload Image',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
