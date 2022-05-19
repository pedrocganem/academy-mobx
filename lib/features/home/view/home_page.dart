import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Hero(
            child: FlutterLogo(
              size: 64,
            ),
            tag: "flutter-logo"),
      ),
    );
  }
}
