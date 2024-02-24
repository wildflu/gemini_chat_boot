

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:geminiappchat/consts/consts.dart';
import 'package:geminiappchat/presontation/app.dart';
import 'package:get/get.dart';

void main() {
  Gemini.init(apiKey: Consts.apiKey);
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
      title: 'Gemini Chat',
    )
  );
}