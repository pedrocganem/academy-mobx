import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx_demo/features/authentication/login/view/login_page.dart';
import 'package:mobx_demo/features/splash/controller/splash_controller.dart';

import '../../../core/generics/resource.dart';
import '../../home/view/home_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = SplashController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3490DC),
      body: Center(
        child: Observer(builder: (_) {
          _controller.checkIfTokenExistsAndIsValid(context);

          return Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_raiw2hpe.json",
            repeat: true,
            reverse: true,
          );
        }),
      ),
    );
  }
}
