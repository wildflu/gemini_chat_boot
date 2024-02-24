

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geminiappchat/controller/chat_controler.dart';
import 'package:geminiappchat/presontation/components/text_form_component.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:typewritertext/typewritertext.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return Obx(() {
      return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF79FCC8),
                  Colors.black
                ]
              )
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListView.builder(
                          itemCount: chatController.convertation.length,
                          itemBuilder: (context, index) {
                            bool isQues = chatController.convertation[index].isQuestion;
                            bool hasImag = chatController.convertation[index].img != null;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Align(
                                alignment: isQues? Alignment.topRight: Alignment.topLeft,
                                child: hasImag
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(chatController.convertation[index].img!, width: 150, height: 230,),
                                )
                                : TypeWriterText.builder(
                                  chatController.convertation[index].message!,
                                  duration: const Duration(milliseconds: 50),
                                  builder: (context, value) {
                                    return AutoSizeText(
                                      style: TextStyle(color: isQues? Colors.grey:Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                                      value,
                                      minFontSize: 2.0,
                                    );
                                  }
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    TextFiledFormComponent(
                      controller: chatController.messageControlelr,
                      onSend: () => chatController.sendMessage(),
                      onPickImage: ()=> chatController.pickImageFromDevice(),
                    )
                  ],
                ),
                chatController.isLoading
                ? Positioned(
                  top: 150,
                  right: 50,
                  left: 50,
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.grey,
                    size: 30,
                  ),
                )
                : const SizedBox()
              ],
            ),
          ),
        );
      }
    );
  }
}
