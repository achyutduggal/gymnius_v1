import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gymnius_3/Screens/calorie-tracker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:provider/provider.dart';
import '../Providers/providers.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// class StringData extends ChangeNotifier {
//   String _data = '';
//
//   String get data => _data;
//
//   void updateData(String newData) {
//     _data = newData;
//     notifyListeners();
//   }
// }

class ImagePickerScreen extends StatefulWidget {
  static const id = 'imagepicker_screen';
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  File? _image;
  bool _loading = false;
  List? _output;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
    ClassifyImage(_image!);
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  ClassifyImage(File Image) async {
    var output = await Tflite.runModelOnImage(
      path: Image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _loading = false;
      _output = output;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    loadModel().then((value) {
      // setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker'),
        ),
        body: Center(
          child: _loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: const Text('Pick Image from Gallery'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: const Text('Capture Image from Camera'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: Navigator.of(context).pop, child: const Text('Go Back'),),
                    const SizedBox(height: 32),
                    if (_image != null)
                      Image.file(
                        _image!,
                        width: 200,
                        height: 200,
                      ),
                  ],
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Text('$_output'),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            String label_value = _output?[0]["label"];
                            Provider.of<StringData>(context, listen: false).updateData(label_value);

                            Navigator.push(context, MaterialPageRoute(builder: (context) => CalorieTracker(),),);
                          },
                          child: const Text('Go Next'))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
