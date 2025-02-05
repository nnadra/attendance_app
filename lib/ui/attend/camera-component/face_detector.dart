import 'dart:math';

import 'package:attadence_app/utils/google_ml_kit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/animation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorComponent {
  
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
    enableTracking: true,
    enableLandmarks: true
  ));

  Future<void> detectFaces(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);
    
    //kalo face terdeteksi, maka akan di tampilkan
    for (Face face in faces) {
      //rect (sebuah objek rec) = rectangle atau persegi panjang
      final Rect boundingBox = face.boundingBox;

      //untuk menghandle posisi wajah secara vertikal
      final double? verticalPosition = face.headEulerAngleX;

      //untuk menghandle posisi wajah secara horizontal
      final double? horizontalPosition = face.headEulerAngleZ;

      //perkondisian apa?bila face landmark sudah aktif, ditandai oleh (mulut, mata, pipi, hidung, dan telinga
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];

      // Cek dulu, kalau telinga kiri ke-detect, baru ambil posisinya
      if (leftEar != null) {
        final Point<int> leftEarPosition = leftEar.position;
        //ambil posisi kordinat telinga kiri (x, y)
        print("Left Ear Position: $leftEarPosition");
      }

      //perkondisian apabila wajahnya terdeteksi (ditandai dengan bibir senyum)
      if (face.smilingProbability != null) {
        final double? smileProbability = face.smilingProbability;
        print("Smile Probability: $smileProbability");
      }

      //perkondisian apabila fitur tracking wajah sudah aktif 
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
      }
    }

  }
}