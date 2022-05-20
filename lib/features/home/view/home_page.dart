import 'package:flutter/material.dart';
import 'package:mobx_demo/features/home/view/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(
        onLogout: () {},
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        title: Hero(child: FlutterLogo(), tag: "flutter-logo"),
      ),
    );
  }
}
