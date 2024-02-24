

import 'package:flutter/material.dart';
import 'package:geminiappchat/controller/chat_controler.dart';
import 'package:geminiappchat/presontation/components/text_form_component.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return Obx(() {
      return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chatController.convertation.length,
                    itemBuilder: (context, index) {
                      bool isQues = chatController.convertation[index].isQuestion;
                      bool hasImag = chatController.convertation[index].img != null;
                      return Align(
                        alignment: isQues? Alignment.topRight: Alignment.topLeft,
                        child: hasImag
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(chatController.convertation[index].img!, width: 150, height: 150,),
                        )
                        : Text(chatController.convertation[index].message!)
                      );
                    },
                  ),
                ),
                TextFiledFormComponent(
                  controller: chatController.messageControlelr,
                  onSend: () => chatController.sendMessage(),
                  onPickImage: ()=> chatController.pickImageFromDevice(),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
