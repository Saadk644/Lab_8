import 'package:flutter/material.dart';

class Page_2 extends StatelessWidget {
  const Page_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Page 2',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Previous Page',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ));
  }
}
