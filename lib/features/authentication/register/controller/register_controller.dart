import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/core/constants/api_routes.dart';
import 'package:mobx_demo/core/generics/resource.dart';
import 'package:mobx_demo/core/models/user_model.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final _dio = Dio();
  final _hive = Hive.box<String>('credentials');

  @observable
  UserModel user = UserModel();

  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid =>
      email.contains("@") && email.contains(".com") && email.isNotEmpty;

  @observable
  String firstName = '';

  @action
  void changeFirstName(String newValue) => firstName = newValue;

  @computed
  bool get isFirstNameValid => firstName.isNotEmpty;

  @observable
  String lastName = '';

  @action
  void changeLastName(String newValue) => lastName = newValue;

  @computed
  bool get isLastNameValid => lastName.isNotEmpty;

  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @computed
  bool get isPasswordValid => password.length > 7;

  @observable
  String passwordConfirmation = '';

  @action
  void changePasswordConfirmation(String newValue) =>
      passwordConfirmation = newValue;

  @computed
  bool get isPasswordConfirmationValid => passwordConfirmation == password;

  @action
  Future<Resource<void, String>> registerUser() async {
    try {
      final result = await _dio.post(ApiRoutes.registerRoute, data: {
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName
      });
      user = UserModel.fromMap(result.data);
      await _hive.put('token', user.token!);

      return Resource.success();
    } on DioError catch (e) {
      return Resource.failed(error: e.response!.toString());
    }
  }

  @observable
  bool isPasswordVisible = false;

  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool isPasswordConfirmationVisible = false;

  @action
  void setPasswordConfirmationVisibility() =>
      isPasswordConfirmationVisible = !isPasswordConfirmationVisible;

  @observable
  bool isButtonAtLoadingState = false;

  @action
  void setButtonToLoadingState() => isButtonAtLoadingState = true;

  @computed
  bool get areCredentialsValid =>
      isEmailValid &&
      isFirstNameValid &&
      isLastNameValid &&
      isPasswordValid &&
      isPasswordConfirmationValid;
}
