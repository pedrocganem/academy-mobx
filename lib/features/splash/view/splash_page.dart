import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx_demo/features/splash/controller/splash_controller.dart';

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
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: Observer(builder: (_) {
          _controller.checkIfTokenExistsAndIsValid(context);

          return Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_raiw2hpe.json",
            reverse: true,
          );
        }),
      ),
    );
  }
}
