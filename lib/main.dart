import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flash Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Flash Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wordController = TextEditingController();
  double screenWidth = 0;
  List<String> words = ['何'];
  Rx<int> index = 0.obs;
  String word = '';
  void _addWord() {
    word = wordController.value.text;
    words.add(word);
    Navigator.pop(context);
  }

  void _addWordBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 400,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: screenWidth,
                    alignment: FractionalOffset.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.clear))),
                const Text('Add words here'),
                TextField(
                    keyboardType: TextInputType.text,
                    controller: wordController),
                ElevatedButton(
                  onPressed: _addWord,
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (index == words.length - 1) {
                    index.value = 0;
                  } else {
                    index.value += 1;
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.8,
                    height: 150,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Obx(
                      () => Text(
                        words[index.value],
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWordBottomSheet,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
