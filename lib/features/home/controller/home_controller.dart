import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/core/constants/api_routes.dart';
import 'package:mobx_demo/core/generics/resource.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _hive = Hive.box<String>('credentials');
  final _dio = Dio();

  @observable
  Resource homeStatus = Resource.loading();

  @observable
  ObservableList studentList = [].asObservable();

  @action
  Future<void> fetchStudentList() async {
    final token = _hive.get('token');
    if (token == null) {
      homeStatus = Resource.failed(error: "Token not found!");
      //! Logout
    }
    try {
      final result = await _dio.get(
        ApiRoutes.getStudentsRoute,
        onReceiveProgress: (count, total) {
          //! check this out
        },
        options: Options(
          headers: {
            'x-access-token': token,
          },
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      final listFromApi = result.data["students"] as List<dynamic>;

      studentList.addAll(listFromApi.asObservable());
      homeStatus = Resource.success();
    } on DioError catch (e) {
      homeStatus = Resource.failed(error: e.response);
    }
  }

  @action
  Future<Resource<void, String>> logout() async {
    try {
      await _hive.delete('token');
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: e.toString());
    }
  }
}
