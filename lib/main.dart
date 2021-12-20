// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_test_task_with_providers/main_page.dart';
import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';
import 'package:shop_test_task_with_providers/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProviders.initialize()),
        // ChangeNotifierProvider(create: (context) => ProductProviders()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: Provider.of<ProductProviders>(context, listen: false)
              .loadCategory(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text(
                  '',
                  textAlign: TextAlign.center,
                );
              case ConnectionState.active:
                return Text('');
              case ConnectionState.waiting:
                return SlapshScreen();
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return MainPage();
                }
            }
            // return const MainPage();
          }),
    );
  }
}
