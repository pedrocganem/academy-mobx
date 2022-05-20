import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/core/generics/resource.dart';
import 'package:mobx_demo/features/authentication/login/view/login_page.dart';
import 'package:mobx_demo/features/home/view/home_page.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final _hive = Hive.box<String>('credentials');

  @observable
  Resource setupStatus = Resource.loading();

  @observable
  String token = '';

  @action
  void _setTokenValue(String newValue) => token = newValue;

  @computed
  bool get isTokenValid => token.isNotEmpty && token.contains('ey');

  @action
  Future<void> checkIfTokenExistsAndIsValid(BuildContext context) async {
    final localToken = await _hive.get('token');

    await Future.delayed(Duration(seconds: 2));

    if (localToken == null) {
      setupStatus =
          Resource.failed(error: "Token is missing, please signIn again");
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      return;
    }

    //* verificar a validade do token na API

    _setTokenValue(localToken);
    setupStatus = Resource.success();
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  //! Método para lidar com a navegação (se o token existe e está ok => HomePage())
}
