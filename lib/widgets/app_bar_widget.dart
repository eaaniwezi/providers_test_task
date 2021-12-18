// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: (Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        )),
        onPressed: () {},
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
