

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:geminiappchat/model/message_chat.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  bool isLoading = false;
  // gemini api instance 'from plugin'
  final gemini = Gemini.instance;
  // this picker to pick an image 
  final ImagePicker picker = ImagePicker();
  // text controler for input text
  TextEditingController messageControlelr = TextEditingController();
  // image file 
  File ?theImage;
  // converation list 
  List<ChatMessage> convertation = <ChatMessage>[].obs;

  // function that generate reponse from text 
  generateText() async{
    await gemini.text(messageControlelr.text)
    .then((candidate) =>  convertation.add(ChatMessage(message: candidate?.output, isQuestion: false)))
    .catchError((e) => log(e));
    messageControlelr.clear();
    isLoading = false;
  }

  // this function generate reponse base on text and image 
  generateTextAndImage() async{
    await gemini.textAndImage(
        text: messageControlelr.text,
        images: [theImage!.readAsBytesSync()]
      )
      .then((value) => convertation.add(ChatMessage(message: value?.content?.parts?.last.text, isQuestion: false)))
      .catchError((e) => log('textAndImageInput', error: e));
    messageControlelr.clear();
    isLoading = false;

  }

  // pick image from local device gallery
  pickImageFromDevice() async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      theImage = File(image.path);
      convertation.add(ChatMessage(isQuestion: true, img: theImage));
    }
  }

  // main function generate repond base on user
  sendMessage() {
    if(messageControlelr.text.isEmpty) return;
    isLoading = true;
    FocusManager.instance.primaryFocus?.unfocus();
    if(theImage == null){
      convertation.add(ChatMessage(message: messageControlelr.text, isQuestion: true));
      generateText();
    }else{
      convertation.add(ChatMessage(message: messageControlelr.text, isQuestion: true));
      generateTextAndImage();
    }
  }
}
