// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$homeStatusAtom =
      Atom(name: '_HomeControllerBase.homeStatus', context: context);

  @override
  Resource<dynamic, dynamic> get homeStatus {
    _$homeStatusAtom.reportRead();
    return super.homeStatus;
  }

  @override
  set homeStatus(Resource<dynamic, dynamic> value) {
    _$homeStatusAtom.reportWrite(value, super.homeStatus, () {
      super.homeStatus = value;
    });
  }

  late final _$studentListAtom =
      Atom(name: '_HomeControllerBase.studentList', context: context);

  @override
  ObservableList<dynamic> get studentList {
    _$studentListAtom.reportRead();
    return super.studentList;
  }

  @override
  set studentList(ObservableList<dynamic> value) {
    _$studentListAtom.reportWrite(value, super.studentList, () {
      super.studentList = value;
    });
  }

  late final _$fetchStudentListAsyncAction =
      AsyncAction('_HomeControllerBase.fetchStudentList', context: context);

  @override
  Future<void> fetchStudentList() {
    return _$fetchStudentListAsyncAction.run(() => super.fetchStudentList());
  }

  @override
  String toString() {
    return '''
homeStatus: ${homeStatus},
studentList: ${studentList}
    ''';
  }
}
