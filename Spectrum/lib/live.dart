import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

import 'main.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      // Handle the case where no cameras are available
      print('No cameras found.');
      return;
    }

    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await cameraController?.initialize();

    if (!mounted)
      return; // Ensure the widget is mounted before starting the image stream

    cameraController?.startImageStream((image) {
      setState(() {
        cameraImage = image;
        runModel();
      });
    });
  }

  runModel() async {
    if (cameraImage == null) {
      // Handle the case where the camera image is null
      print('Camera image is null.');
      return;
    }

    var predictions = await Tflite.runModelOnFrame(
      bytesList: cameraImage!.planes.map((plane) => plane.bytes).toList(),
      imageHeight: cameraImage!.height,
      imageWidth: cameraImage!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 2,
      threshold: 0.1,
      asynch: true,
    );

    if (predictions != null) {
      setState(() {
        output = predictions[0]['label'];
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/vww_96_grayscale_quantized.tflite",
        labels: "assets/labels.txt");
    runModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SPECTRUM')),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: cameraController != null &&
                    cameraController!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: cameraController!.value.aspectRatio,
                    child: CameraPreview(cameraController!),
                  )
                : Container(),
          ),
        ),
        Text(
          output,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ]),
    );
  }
}
