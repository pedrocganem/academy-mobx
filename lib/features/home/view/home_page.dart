import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx_demo/core/generics/resource.dart';
import 'package:mobx_demo/features/home/view/widgets/custom_drawer.dart';
import '../../authentication/login/view/login_page.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _controller.fetchStudentList();
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(
          onLogout: () async {
            final result = await _controller.logout();
            if (!result.hasError) {
              await Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
        ),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          toolbarHeight: 100,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
          title: Hero(
              child: FlutterLogo(
                size: 64,
              ),
              tag: "flutter-logo"),
        ),
        body: Observer(builder: (_) {
          final students = _controller.studentList;
          return _controller.homeStatus.status != Status.loading
              ? Center(
                  child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_lzpnnin5.json",
                      reverse: true),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ReorderableListView(
                    buildDefaultDragHandles: true,
                    onReorder: ((oldIndex, newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex--;
                      }
                      final item = students.removeAt(oldIndex);
                      students.insert(newIndex, item);
                    }),
                    children: <Widget>[
                      for (final student in students)
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          key: Key('$student'),
                          child: ListTile(
                            leading: Icon(Icons.person_outline),
                            title: Text(
                              student,
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            trailing: Text(
                              "☃️",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          // leading: Icon(Icons.person_outline),
                        )
                    ],
                  ),
                );
        }));
  }
}
