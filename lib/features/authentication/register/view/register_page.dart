import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx_demo/features/authentication/register/controller/register_controller.dart';

import '../../../../core/generics/resource.dart';
import '../../../home/view/home_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Hero(
                        tag: "flutter-logo",
                        child: FlutterLogo(size: 98),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Observer(builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                              hintText: "First Name",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            onChanged: _controller.changeFirstName,
                          );
                        }),
                        SizedBox(height: 16),
                        Observer(builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            onChanged: _controller.changeLastName,
                          );
                        }),
                        SizedBox(height: 16),
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
                        SizedBox(height: 16),
                        Observer(builder: (_) {
                          return TextField(
                            obscureText: !_controller.isPasswordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: _controller.isPasswordVisible
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: _controller.setPasswordVisibility),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            onChanged: _controller.changePassword,
                          );
                        }),
                        SizedBox(height: 16),
                        Observer(builder: (_) {
                          return TextField(
                            obscureText:
                                !_controller.isPasswordConfirmationVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon:
                                      _controller.isPasswordConfirmationVisible
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off),
                                  onPressed: _controller
                                      .setPasswordConfirmationVisibility),
                              hintText: "Password Confirmation",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            onChanged: _controller.changePasswordConfirmation,
                          );
                        }),
                        SizedBox(height: 16),
                      ],
                    ),
                    Observer(
                      builder: (_) {
                        bool isLoading = _controller.isButtonAtLoadingState;
                        return SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            onPressed: _controller.areCredentialsValid
                                ? () async {
                                    _controller.setButtonToLoadingState();
                                    final resource =
                                        await _controller.registerUser();
                                    if (resource.hasError) {
                                      await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  backgroundColor:
                                                      Colors.blueGrey.shade300,
                                                  child: Text(resource.error!),
                                                );
                                              })
                                          .then((_) => _controller
                                              .isButtonAtLoadingState = false);
                                    }

                                    if (resource.status == Status.success) {
                                      await Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    }
                                  }
                                : null,
                            child: isLoading
                                ? Container(
                                    width: 24,
                                    height: 24,
                                    child: Lottie.network(
                                        "https://assets9.lottiefiles.com/private_files/lf30_ykdoon9j.json"))
                                : Text(_controller.areCredentialsValid
                                    ? "Entrar"
                                    : "Credenciais inválidas"),
                          ),
                        );
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
