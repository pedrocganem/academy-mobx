import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/core/constants/api_routes.dart';
import 'package:mobx_demo/core/generics/resource.dart';
import 'package:mobx_demo/core/models/user_model.dart';
import 'package:mobx_demo/core/models/user_model_keys.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _dio = Dio();

  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @observable
  Resource<UserModel, String> user = Resource.loading();

  @observable
  bool isPasswordVisible = false;

  @observable
  bool isButtonAtLoadingStatus = false;

  @action
  void setButtonToLoadingStatus() => isButtonAtLoadingStatus = true;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @computed
  bool get areCredentialsValid => isEmailValid && isPasswordValid;

  @action
  Future<Resource<void, String>> loginUser() async {
    try {
      final result = await _dio.post(ApiRoutes.loginRoute,
          data: {"email": email, "password": password});
      user = Resource.success(data: UserModel.fromMap(result.data));
      return user;
    } on DioError catch (e) {
      user = Resource.failed(error: e.response.toString());
      return user;
    }
  }

  @computed
  bool get isEmailValid =>
      email.isNotEmpty && email.contains('@') && email.contains(".com");

  @computed
  bool get isPasswordValid => password.length > 7;

  //TODO: persistência com hive.

  //TODO: Validar e-mail e senha.

  //TODO: requisição na api

  //TODO: computed de verifição do botão.

}
