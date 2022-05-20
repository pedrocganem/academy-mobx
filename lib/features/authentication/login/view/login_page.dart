import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx_demo/core/generics/resource.dart';
import 'package:mobx_demo/core/widgets/dialogs/custom_error_dialog.dart';
import 'package:mobx_demo/features/authentication/login/controller/login_controller.dart';
import 'package:mobx_demo/features/authentication/register/view/register_page.dart';
import 'package:mobx_demo/features/home/view/home_page.dart';

class LoginPage extends StatelessWidget {
  final _controller = LoginController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Hero(
                tag: "flutter-logo",
                child: FlutterLogo(
                  size: 84,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                  return TextField(
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onChanged: _controller.changeEmail,
                  );
                }),
                SizedBox(height: 24),
                Observer(builder: (_) {
                  return TextField(
                    obscureText: !_controller.isPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: _controller.isPasswordVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: _controller.changePasswordVisibility),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onChanged: _controller.changePassword,
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        child: Text(
                          "Esqueci minha senha",
                          textAlign: TextAlign.start,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  child: Text("Não possui uma conta?"),
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
                SizedBox(
                  height: 48,
                  child: Observer(builder: (_) {
                    bool isLoading = _controller.isButtonAtLoadingStatus;
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: _controller.areCredentialsValid
                          ? () async {
                              _controller.setButtonToLoadingStatus();
                              final resource = await _controller.loginUser();
                              if (resource.hasError) {
                                await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CustomErrorDialog(
                                              errorMessage:
                                                  resource.error.toString(),
                                              onPressed: () =>
                                                  Navigator.pop(context));
                                        })
                                    .then((_) => _controller
                                        .isButtonAtLoadingStatus = false);
                              }

                              if (resource.status == Status.success) {
                                await Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            }
                          : null,
                      child: isLoading
                          ? Lottie.network(
                              "https://assets9.lottiefiles.com/private_files/lf30_ykdoon9j.json",
                              width: 36)
                          : Text(_controller.areCredentialsValid
                              ? "Entrar"
                              : "Credenciais inválidas"),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
