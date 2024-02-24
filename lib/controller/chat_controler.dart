

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:geminiappchat/model/message_chat.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  final gemini = Gemini.instance;
  final ImagePicker picker = ImagePicker();
  TextEditingController messageControlelr = TextEditingController();
  File ?theImage;


  List<ChatMessage> convertation = <ChatMessage>[].obs;


  generateText(){
    gemini.text(messageControlelr.text)
    .then((candidate) =>  convertation.add(ChatMessage(message: candidate?.output, isQuestion: false)))
    .catchError((e) => print(e));
    messageControlelr.clear();
  }

  generateTextAndImage(){
    gemini.textAndImage(
        text: "What is this picture?",
        images: [theImage!.readAsBytesSync()]
      )
      .then((value) => log(value?.content?.parts?.last.text ?? ''))
      .catchError((e) => log('textAndImageInput', error: e));
  }

  pickImageFromDevice() async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      theImage = File(image.path);
      convertation.add(ChatMessage(isQuestion: true, img: theImage));
    }
  }

  sendMessage() {
    if(messageControlelr.text.isEmpty) return;
    FocusManager.instance.primaryFocus?.unfocus();
    if(theImage == null){
      convertation.add(ChatMessage(message: messageControlelr.text, isQuestion: true));
      generateText();
    }else{
      print('implemant image from storage');
    }
  }
}
