import 'package:flutter/material.dart';

class FavoritiesScreen extends StatefulWidget {
  const FavoritiesScreen({ Key? key }) : super(key: key);

  @override
  _FavoritiesScreenState createState() => _FavoritiesScreenState();
}

class _FavoritiesScreenState extends State<FavoritiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       child: Text("Экран Избранное в разработке"),
      ),
    );
  }
}