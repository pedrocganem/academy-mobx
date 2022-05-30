import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final void Function() onLogout;
  const CustomDrawer({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 128,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("NOME"),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                      thickness: 1,
                      color: Theme.of(context).appBarTheme.backgroundColor),
                ],
              ),
              ListTile(
                title: Text(
                  "Logout",
                  textAlign: TextAlign.center,
                ),
                onTap: onLogout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
