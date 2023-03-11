import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/CameraController.dart';

class HomeScreen extends StatelessWidget {
  final CameraController Controller = Get.put(CameraController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Controller.selectedImagePath.value == ''
                    ? Text(
                        'Select an image from camera/gallery',
                        style: TextStyle(fontSize: 20),
                      )
                    : Image.file(
                        File(Controller.selectedImagePath.value),
                      ),
              ),
              SizedBox(height: 8,),
              Obx(
                () => Text(
                  Controller.selectedImageSize.value == ''
                      ? ''
                      : Controller.selectedImageSize.value,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Controller.getImage(ImageSource.camera);
                },
                child: Text("Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  Controller.getImage(ImageSource.gallery);
                },
                child: Text("Gallery"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
