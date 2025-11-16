import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    super.key,
    required this.width,
    required this.controller,
    required this.onPressed,
  });
  final double width;
  final TextEditingController controller;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width,
                alignment: FractionalOffset.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.clear))),
            const Text('Add words here'),
            TextField(keyboardType: TextInputType.text, controller: controller),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
