import 'package:flutter/material.dart';
import 'package:flutter_flash_card/my_bottom_sheet.dart';
import 'package:get/state_manager.dart';

class WordController extends GetxController {
  var wordController = TextEditingController();
  final screenWidth = 0.0.obs;

  List<String> words = ['何'];
  Rx<int> index = 0.obs;
  String word = '';

  void _addWord(BuildContext context) {
    word = wordController.value.text;
    words.add(word);
    Navigator.pop(context);
  }

  void updateScreenWidth(BuildContext context) {
    screenWidth.value = MediaQuery.of(context).size.width;
  }

  void addWordBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return MyBottomSheet(
          width: screenWidth.value,
          controller: wordController,
          onPressed: () => _addWord(context),
        );
      },
    );
  }
}
