

import 'dart:io';

class ChatMessage {
  final String ?message;
  final bool isQuestion;
  final File ?img;
  ChatMessage({this.message, required this.isQuestion, this.img});
}