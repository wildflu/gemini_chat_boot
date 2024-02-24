


import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TextFiledFormComponent extends StatelessWidget {
  const TextFiledFormComponent({
    super.key, required this.controller, required this.onSend, required this.onPickImage,
  });
  final TextEditingController controller;
  final Callback onSend;
  final Callback onPickImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Your Chat Message',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(width: 1, color: Colors.white)),
                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(width: 1, color: Colors.white)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(width: 1, color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(width: 1, color: Colors.white)),
              ),
            ),
          ),
          IconButton(onPressed: ()=> onSend(), icon: const Icon(Icons.send)),
          IconButton(onPressed: ()=> onPickImage(), icon: const Icon(Icons.image))
        ],
      ),
    );
  }
}