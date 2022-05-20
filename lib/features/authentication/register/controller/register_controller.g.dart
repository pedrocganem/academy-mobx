// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_RegisterControllerBase.isEmailValid'))
          .value;
  Computed<bool>? _$isFirstNameValidComputed;

  @override
  bool get isFirstNameValid => (_$isFirstNameValidComputed ??= Computed<bool>(
          () => super.isFirstNameValid,
          name: '_RegisterControllerBase.isFirstNameValid'))
      .value;
  Computed<bool>? _$isLastNameValidComputed;

  @override
  bool get isLastNameValid =>
      (_$isLastNameValidComputed ??= Computed<bool>(() => super.isLastNameValid,
              name: '_RegisterControllerBase.isLastNameValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_RegisterControllerBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isPasswordConfirmationValidComputed;

  @override
  bool get isPasswordConfirmationValid =>
      (_$isPasswordConfirmationValidComputed ??= Computed<bool>(
              () => super.isPasswordConfirmationValid,
              name: '_RegisterControllerBase.isPasswordConfirmationValid'))
          .value;
  Computed<bool>? _$areCredentialsValidComputed;

  @override
  bool get areCredentialsValid => (_$areCredentialsValidComputed ??=
          Computed<bool>(() => super.areCredentialsValid,
              name: '_RegisterControllerBase.areCredentialsValid'))
      .value;

  late final _$userAtom =
      Atom(name: '_RegisterControllerBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_RegisterControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$firstNameAtom =
      Atom(name: '_RegisterControllerBase.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_RegisterControllerBase.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordConfirmationAtom = Atom(
      name: '_RegisterControllerBase.passwordConfirmation', context: context);

  @override
  String get passwordConfirmation {
    _$passwordConfirmationAtom.reportRead();
    return super.passwordConfirmation;
  }

  @override
  set passwordConfirmation(String value) {
    _$passwordConfirmationAtom.reportWrite(value, super.passwordConfirmation,
        () {
      super.passwordConfirmation = value;
    });
  }

  late final _$isPasswordVisibleAtom =
      Atom(name: '_RegisterControllerBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$isPasswordConfirmationVisibleAtom = Atom(
      name: '_RegisterControllerBase.isPasswordConfirmationVisible',
      context: context);

  @override
  bool get isPasswordConfirmationVisible {
    _$isPasswordConfirmationVisibleAtom.reportRead();
    return super.isPasswordConfirmationVisible;
  }

  @override
  set isPasswordConfirmationVisible(bool value) {
    _$isPasswordConfirmationVisibleAtom
        .reportWrite(value, super.isPasswordConfirmationVisible, () {
      super.isPasswordConfirmationVisible = value;
    });
  }

  late final _$isButtonAtLoadingStateAtom = Atom(
      name: '_RegisterControllerBase.isButtonAtLoadingState', context: context);

  @override
  bool get isButtonAtLoadingState {
    _$isButtonAtLoadingStateAtom.reportRead();
    return super.isButtonAtLoadingState;
  }

  @override
  set isButtonAtLoadingState(bool value) {
    _$isButtonAtLoadingStateAtom
        .reportWrite(value, super.isButtonAtLoadingState, () {
      super.isButtonAtLoadingState = value;
    });
  }

  late final _$registerUserAsyncAction =
      AsyncAction('_RegisterControllerBase.registerUser', context: context);

  @override
  Future<Resource<void, String>> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  late final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase', context: context);

  @override
  void changeEmail(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeEmail');
    try {
      return super.changeEmail(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFirstName(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeFirstName');
    try {
      return super.changeFirstName(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLastName(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeLastName');
    try {
      return super.changeLastName(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changePassword');
    try {
      return super.changePassword(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordConfirmation(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changePasswordConfirmation');
    try {
      return super.changePasswordConfirmation(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordVisibility() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPasswordVisibility');
    try {
      return super.setPasswordVisibility();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordConfirmationVisibility() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPasswordConfirmationVisibility');
    try {
      return super.setPasswordConfirmationVisibility();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setButtonToLoadingState() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setButtonToLoadingState');
    try {
      return super.setButtonToLoadingState();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
email: ${email},
firstName: ${firstName},
lastName: ${lastName},
password: ${password},
passwordConfirmation: ${passwordConfirmation},
isPasswordVisible: ${isPasswordVisible},
isPasswordConfirmationVisible: ${isPasswordConfirmationVisible},
isButtonAtLoadingState: ${isButtonAtLoadingState},
isEmailValid: ${isEmailValid},
isFirstNameValid: ${isFirstNameValid},
isLastNameValid: ${isLastNameValid},
isPasswordValid: ${isPasswordValid},
isPasswordConfirmationValid: ${isPasswordConfirmationValid},
areCredentialsValid: ${areCredentialsValid}
    ''';
  }
}
