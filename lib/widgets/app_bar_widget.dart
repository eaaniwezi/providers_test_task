// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  bool isNavigate = false;
  bool isIcon = false;

  AppBarWidget({
    Key? key,
    required this.title,
    required this.isNavigate,
    required this.isIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: (Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        )),
        onPressed: () {
          isNavigate == false ? null : Navigator.pop(context);
        },
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      actions: [
        isIcon == false
            ? Container()
            : IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
      ],
    );
  }
}
