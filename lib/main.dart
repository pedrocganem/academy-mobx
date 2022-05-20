import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mobx_demo/app_widget.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('credentials');

  runApp(const AppWidget());
}
