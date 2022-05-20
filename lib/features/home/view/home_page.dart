import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_demo/core/generics/resource.dart';
import 'package:mobx_demo/features/home/view/controller/home_controller.dart';
import 'package:mobx_demo/features/home/view/widgets/custom_drawer.dart';

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
            await _controller.fetchStudentList();
          },
        ),
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
          title: Hero(child: FlutterLogo(), tag: "flutter-logo"),
        ),
        body: Observer(builder: (_) {
          final students = _controller.studentList;
          return _controller.homeStatus == Status.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ReorderableListView(
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
                );
        }));
  }
}
