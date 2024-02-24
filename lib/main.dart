

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:geminiappchat/consts/consts.dart';
import 'package:geminiappchat/presontation/app.dart';
import 'package:get/get.dart';

void main() {
  Gemini.init(apiKey: Consts.keyApp);
  runApp(
    const GetMaterialApp(
      home: App(),
      title: 'Gemini Chat',
    )
  );
}