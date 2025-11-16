import 'package:flutter/material.dart';
import 'package:flutter_flash_card/controller.dart';
import 'package:get/get.dart';

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
      home: MyHomePage(title: 'My Flash Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final controller = Get.put(WordController());

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    controller.updateScreenWidth(context);
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (controller.index == controller.words.length - 1) {
                    controller.index.value = 0;
                  } else {
                    controller.index.value += 1;
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    alignment: Alignment.center,
                    width: controller.screenWidth * 0.8,
                    height: 150,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Obx(
                      () => Text(
                        controller.words[controller.index.value],
                        style: const TextStyle(color: Colors.amber),
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
        onPressed: () => controller.addWordBottomSheet(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
